package Biz;

import hibernate.Booking;
import hibernate.Goods;
import hibernate.GoodsDAO;
import hibernate.HibernateSessionFactory;
import hibernate.Inform;
import hibernate.User;
import hibernate.UserDAO;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class InformBiz {

	public List getInformList(){
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery("from Inform");
		return query.list();
	}
	
	
	public boolean addInform(String content,String contentType){
		try {
			Inform inform = new Inform();
			inform.setTime(new Date());
			inform.setType(contentType);
			inform.setContent(content);
			inform.setIid("i"+new Date().getTime()%100007);
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			session.save(inform);
			session.beginTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteInform(String informId){
		try{
			Session session = HibernateSessionFactory.getSession();
			Query query = session.createQuery("from Inform where iid='"+informId+"'");
			session.beginTransaction();
			session.delete(query.list().get(0));
			session.beginTransaction().commit();
			session.close();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
}
