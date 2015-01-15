package Biz;

import hibernate.Admini;
import hibernate.HibernateSessionFactory;
import hibernate.User;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class AdminBiz {
	
	public boolean adminLogin(String userName,String password){
		
		Session session = HibernateSessionFactory.getSession();
		Criteria criteria = session.createCriteria(Admini.class); 
		criteria.add(Restrictions.eq("adName", userName)); 
		List userList = criteria.list(); 
		
		if(userList.size()!=0){
			Admini user = (Admini) userList.get(0);
			//System.out.println(user.getUserId()+" "+user.getUserPassword());
			if(password.equals(user.getAdPassword()))
				return true;
			else return false;
		}else{
			return false;
		}
		
		
	}
}
