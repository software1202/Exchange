package Biz;

import hibernate.HibernateSessionFactory;
import hibernate.Submenu;

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
	
	public Submenu getSubMenuByName(String subMenuName){
		Session session = HibernateSessionFactory.getSession();
		
		Query query = session.createQuery("from Submenu where subMenuName='"+subMenuName+"'");
		
		Submenu submenu = (Submenu)query.list().get(0);
		
		return submenu;
		
	}
	
}
