package Biz;

import java.util.Date;
import java.util.List;

import hibernate.Goods;
import hibernate.HibernateSessionFactory;
import hibernate.Submenu;
import hibernate.SubmenuDAO;
import hibernate.User;
import hibernate.UserDAO;

import org.hibernate.Query;
import org.hibernate.Session;



public class GoodsBiz {
	public boolean addGoods(User user,String goodsName,String imgSrc,Submenu submenu,String describe,String newd) {
		Goods goods = new Goods();
		goods.setGoodsName(goodsName);
		Date date = new Date();
		String goodsId = "g"+date.getTime();
		goods.setGoodsId(goodsId);
		goods.setSubmenu(submenu);
		goods.setDescribe(describe);
		goods.setImage(imgSrc);
		goods.setNewDegree(newd);
		goods.setStatus("00");
		goods.setUser(user);
		goods.setBrand("21");
		goods.setNewDegree("23");
		
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		session.save(goods);
		session.getTransaction().commit();
		session.close();
		return true;
	}
	
	public Goods getGoods(String goodsId){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Query query = session.createQuery("from Goods where GoodsId='"+ goodsId+"'");
		//session.close();
		if(query.list() != null){
			
			Goods goods = (Goods)query.list().get(0);
			session.close();
			return goods; 
		}
		else{
			session.close();
			return null;
		}
		
	}
	
	public List getGoodsListByKeyWord(String keyWord){
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Goods as g where g.status='00' and g.goodsName like :name"; // 调用 session 的获得数据列表方法，传递 HQL 查询语句 
		Query query = session.createQuery(hql); 
		query.setString("name","%"+keyWord+"%"); 
		
		//Query query = session.createQuery("from Goods where goodsName='%"+ keyWord+"%'");
//		Query query = session.createQuery("from Goods");
		List goodsList = query.list();
		session.close();
		return goodsList;
	}
	
	public List getGoodsListByType(String type){
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Goods as g where g.status='00' and g.submenu='"+type+"'"; // 调用 session 的获得数据列表方法，传递 HQL 查询语句 
		Query query = session.createQuery(hql); 
		List goodsList = query.list();
		session.close();
		return goodsList;
	}
	
	public List getUserAllGoods(String userId){
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Goods as g where g.status='00' and g.user='"+userId+"'";
		Query query = session.createQuery(hql); 	
		List goodsList = query.list();
		session.close();
		return goodsList;
	}
	
	public boolean deleteGoodsById(String goodsId){
		try {
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();  
			Query query = session.createQuery("update Goods g set g.status = '04' where g.goodsId='"+goodsId+"'");  
			query.executeUpdate();  
			session.getTransaction().commit(); 
			session.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	 
}
