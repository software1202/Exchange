package Biz;

import hibernate.District;
import hibernate.Goods;
import hibernate.HibernateSessionFactory;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class LocationBiz {
	
	public List getProviceList(){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Query query = session.createQuery("from Province");
		List provinceList = query.list();
		session.close();
		return provinceList;
	}
	
	public List getCityList(String proId){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Query query = session.createQuery("from City where ProId='"+proId+"'");
		List cityList = query.list();
		session.close();
		return cityList;
	}
	
	public List getdistList(String cityId){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Query query = session.createQuery("from District where CityId='"+cityId+"'");
		List distList = query.list();
		session.close();
		return distList;
	}
	
	public District getDis(String disName){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Query query = session.createQuery("from District where DisName='"+ disName+"'");
		//session.close();
		if(query.list() != null){
			
			District dis = (District)query.list().get(0);
			session.close();
			return dis; 
		}
		else{
			session.close();
			return null;
		}
		
	}
	
}
