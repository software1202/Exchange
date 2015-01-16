package Biz;

import hibernate.HibernateSessionFactory;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class MenuBiz {

	public List getMenuList(){
		Session session = HibernateSessionFactory.getSession();
	
		Query query = session.createQuery("from Menu");
		
		return query.list();
	}
	
	public List getSubMenuByMenuId(String MenuId){
		Session session = HibernateSessionFactory.getSession();
		
		Query query = session.createQuery("from Submenu where menu='"+MenuId+"'");
	
		return query.list();
	}
	
}
