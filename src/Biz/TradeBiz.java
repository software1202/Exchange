package Biz;

import hibernate.Booking;
import hibernate.BookingDAO;
import hibernate.Goods;
import hibernate.GoodsDAO;
import hibernate.HibernateSessionFactory;
import hibernate.User;
import hibernate.UserDAO;

import java.sql.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class TradeBiz {
	//查询所有的booking中是否有这个物品
	private boolean isGoodsInBooking(String goodsId){
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery("from Booking where (goodsByAgoods='"+goodsId+"' or goodsByBgoods='"+goodsId+"') and ((astatus='04' and bstatus='04') or (astatus='06' and bstatus='06'))");
		
		if(query.list().size()==0){
			return false;
		}else{
			return true;
		}
	}
	
	//新建一个trade
	public String addNewTrade(String userId,String goodsId){
		
		GoodsDAO goodsDao = new GoodsDAO();
		UserDAO userDao = new UserDAO();
		Goods Bgoods = goodsDao.findById(goodsId);
		
		//该物品已经被换享
		if(isGoodsInBooking(Bgoods.getGoodsId())){
			
			return "101";
		}
		
		User Auser = userDao.findById(userId);
		User Buser = Bgoods.getUser();
		
		//不能换享自己的物品
		if(Auser.getUserId().equals(Buser.getUserId())) return "102";
		
		java.util.Date nowDate = new java.util.Date();
		
		Booking booking = new Booking();
		String bookingId = Long.toString(nowDate.getTime());// new Date()为获取当前系统时间
		
		booking.setBookingId("t"+bookingId);
		booking.setGoodsByBgoods(Bgoods);
		booking.setUserByAuserId(Auser);
		booking.setUserByBuserId(Buser);
		booking.setAtime(nowDate);
		booking.setAstatus("01");
		booking.setBstatus("03");
		booking.setExStatus("00");
		
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		session.save(booking);
		session.beginTransaction().commit();
		session.close();
		//换享成功
		return "103";
	}
	
	
	public List getUserWantTradeList(String userId){
//		Criteria criteria = session.createCriteria(Booking.class); 
//		criteria.add(Restrictions.eq("userByAuserId", userId)); 
//		List userList = criteria.list(); 
		
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery("from Booking where userByAuserId='"+userId+"' and astatus=01 and bstatus!=01");
		return query.list();
	}
	
	public List getUserWantedTradeList(String userId){
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery("from Booking where userByBuserId='"+userId+"' and (bstatus=03 or bstatus=02)");
		return query.list();
	}
	
	public List getChangeTalkTradeList(String userId){
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery("from Booking where (userByBuserId='"+userId+"' and bstatus='04') or  (userByAuserId='"+userId+"' and astatus='04')");
		return query.list();
	}
	
	public List getExchangingTradeList(String userId){
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery("from Booking where (userByBuserId='"+userId+"' and bstatus='06') or  (userByAuserId='"+userId+"' and astatus='06')");
		return query.list();
	}
	//用户同意一个换享
	public String agreeExchange(String tradeId,String goodsId){
		try { 
//			Session session = HibernateSessionFactory.getSession();
//			session.beginTransaction();  
//			Query query = session.createQuery("update Booking booking set booking.bstatus = '01' where booking.bookingId='"+tradeId+"'");  
//			//Query query = session.createQuery("update Booking booking set booking.bstatus = '01' ");  
//			query.executeUpdate();  
//			session.getTransaction().commit();  
//			return true;
			GoodsDAO goodsDao = new GoodsDAO();
			UserDAO userDao = new UserDAO();
			Goods Agoods = goodsDao.findById(goodsId);
			
			//该物品已经被换享
			if(isGoodsInBooking(Agoods.getGoodsId())){
				System.out.println(goodsId);
				return "101";
			}
			
			Booking booking = (new BookingDAO()).findById(tradeId);
			
			
			//不能换享自己的物品
			System.out.println(booking);
			if(!Agoods.getUser().getUserId().equals(booking.getUserByAuserId().getUserId())) return "102";
			
			
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();  
			Query query = session.createQuery("update Booking b set b.bstatus = '04',b.astatus = '04',b.goodsByAgoods ='"+goodsId+"' where b.bookingId='"+tradeId+"'");  
			query.executeUpdate();  
			session.getTransaction().commit(); 
			session.close();
			//进入正在协商状态
			return "103";
		} catch (Exception e) {
			e.printStackTrace();
			return "104";
		}
	}
	//用户拒绝一个换享
	public boolean disagreeExchange(String tradeId){
		try { 
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();  
			Query query = session.createQuery("update Booking booking set booking.bstatus = '02' where booking.bookingId='"+tradeId+"'");  
			query.executeUpdate();  
			session.getTransaction().commit(); 
			session.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	//判断一个用户是Auser还是Buser
	public boolean isAuserOrBuser(String tradeId,String userId) {
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery("from Booking where userByAuserId='"+userId+"' and bookingId='"+tradeId+"'");
		if(query.list().size()!=0){
			return true;
		}else{
			return false;
		}
	}
	
	//用户删除一个trade,将status 设置为 05
	public boolean deleteExchange(String tradeId,String userId){
		try { 
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction(); 
			Query query;
			if(isAuserOrBuser(tradeId, userId)){
				query = session.createQuery("update Booking booking set booking.astatus = '05' where booking.bookingId = '"+tradeId+"'");  
				query.executeUpdate();  
			}else{
				query = session.createQuery("update Booking booking set booking.bstatus = '05' where booking.bookingId = '"+tradeId+"'");  
				query.executeUpdate();  
			}
			session.getTransaction().commit(); 
			session.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	//用户在正在协商编辑信息
	public boolean editTradeInformation(String tradeId,String tradeWay,int tradeMoney){
		try { 
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();  
			Query query = session.createQuery("update Booking booking set booking.exMethod = '"+tradeWay+"',booking.exStatus = '01',booking.deposit = '"+tradeMoney+"' where booking.bookingId='"+tradeId+"'");  
			query.executeUpdate();  
			session.getTransaction().commit(); 
			session.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	//用户确认交换
	public String confirmTrade(String tradeId,String userId){
		try {
			Booking booking = (new BookingDAO()).findById(tradeId);
			String AuserId = booking.getUserByAuserId().getUserId();
			String BuserId = booking.getUserByBuserId().getUserId();
			if(AuserId.equals(userId)&&!booking.getExStatus().equals("03")){
				Session session = HibernateSessionFactory.getSession();
				session.beginTransaction();  
				Query query = session.createQuery("update Booking booking set booking.exStatus = '02' where booking.bookingId='"+tradeId+"'");  
				query.executeUpdate();  
				session.getTransaction().commit(); 
				session.close();
				return "101";
			}else if(BuserId.equals(userId)&&!booking.getExStatus().equals("02")){
				Session session = HibernateSessionFactory.getSession();
				session.beginTransaction();  
				Query query = session.createQuery("update Booking booking set booking.exStatus = '03' where booking.bookingId='"+tradeId+"'");  
				query.executeUpdate();  
				session.getTransaction().commit(); 
				session.close();
				return "102";
			}else{
				Session session = HibernateSessionFactory.getSession();
				session.beginTransaction();  
				Query query = session.createQuery("update Booking b set b.bstatus = '06',b.astatus = '06',b.exStatus='00' where b.bookingId='"+tradeId+"'");  
				query.executeUpdate();  
				session.getTransaction().commit(); 
				session.close();
				return "103";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "104";
		}
	}
	
	//用户确认交换
		public String completeTrade(String tradeId,String userId){
			try {
				Booking booking = (new BookingDAO()).findById(tradeId);
				String AuserId = booking.getUserByAuserId().getUserId();
				String BuserId = booking.getUserByBuserId().getUserId();
				if(AuserId.equals(userId)&&!booking.getExStatus().equals("01")){
					Session session = HibernateSessionFactory.getSession();
					session.beginTransaction();  
					Query query = session.createQuery("update Booking booking set booking.exStatus = '02' where booking.bookingId='"+tradeId+"'");  
					query.executeUpdate();  
					session.getTransaction().commit(); 
					session.close();
					return "101";
				}else if(BuserId.equals(userId)&&!booking.getExStatus().equals("02")){
					Session session = HibernateSessionFactory.getSession();
					session.beginTransaction();  
					Query query = session.createQuery("update Booking booking set booking.exStatus = '01' where booking.bookingId='"+tradeId+"'");  
					query.executeUpdate();  
					session.getTransaction().commit(); 
					session.close();
					return "102";
				}else{
					Session session = HibernateSessionFactory.getSession();
					session.beginTransaction();  
					Query query = session.createQuery("update Booking b set b.bstatus = '07',b.astatus = '07',b.exStatus='00' where b.bookingId='"+tradeId+"'");  
					query.executeUpdate();  
					session.getTransaction().commit(); 
					session.close();
					return "103";
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				return "104";
			}
		}
	
}
