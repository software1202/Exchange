package Biz;

import java.util.List;

import hibernate.Goods;
import hibernate.HibernateSessionFactory;
import hibernate.SubmenuDAO;
import hibernate.UserDAO;

import org.hibernate.Query;
import org.hibernate.Session;



public class GoodsBiz {
	//AnnotationConfiguration configuration = new AnnotationConfiguration();
	public boolean addGoods(String userId,String goodsName,String imgSrc,String brand,String describe) {
		Goods goods = new Goods();
		goods.setGoodsName(goodsName);
		goods.setGoodsId("10033");
		goods.setBrand(brand);
		goods.setDescribe(describe);
		goods.setImage(imgSrc);
		goods.setUser((new UserDAO()).findById(userId));
		goods.setSubmenu(new SubmenuDAO().findById("001"));
		Session session= HibernateSessionFactory.getSession();
		session.beginTransaction();
		session.save(goods);
		//String sql = null;
		//sql = "INSERT INTO Goods(GoodsId,GoodsName,brand,Describe,image) VALUES ('"+goods.getGoodsId()+"','"+
		//goods.getGoodsName()+"','"+goods.getBrand()+"','"+goods.getDescribe()+"','"+goods.getDescribe()+"','"+
				//goods.getImage()+"')";
		//Query q = session.createQuery(sql);
		//q.executeUpdate();
		session.beginTransaction().commit();
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
		String hql = "from Goods as g where g.goodsName like :name"; // 调用 session 的获得数据列表方法，传递 HQL 查询语句 
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
		String hql = "from Goods as g where g.submenu='"+type+"'"; // 调用 session 的获得数据列表方法，传递 HQL 查询语句 
		Query query = session.createQuery(hql); 
		List goodsList = query.list();
		session.close();
		return goodsList;
	}
	
	public List getUserAllGoods(String userId){
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Goods as g where g.user='"+userId+"'";
		Query query = session.createQuery(hql); 	
		List goodsList = query.list();
		session.close();
		return goodsList;
	}
	
	public boolean deleteGoodsById(String goodsId){
		try {
			Session session = HibernateSessionFactory.getSession();
			String hql = "from Goods where goodsId='"+goodsId+"'";
			Query query = session.createQuery(hql); 
			Goods goods = (Goods) query.list().get(0);
			session.beginTransaction();
			session.delete(goods);
			session.beginTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	 
}
