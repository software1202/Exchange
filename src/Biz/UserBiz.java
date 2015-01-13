package Biz;

import hibernate.HibernateSessionFactory;
import hibernate.User;
import hibernate.UserDAO;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;


public class UserBiz {
	
	
	
	public String userLogin(String userName,String password){
		
		Session session = HibernateSessionFactory.getSession();
		Criteria criteria = session.createCriteria(User.class); 
		criteria.add(Restrictions.eq("userId", userName)); 
		List userList = criteria.list(); 
		
		if(userList.size()!=0){
			User user = (User) userList.get(0);
			//System.out.println(user.getUserId()+" "+user.getUserPassword());
			if(password.equals(user.getUserPassword()))
				return user.getUserNickName();
			else return null;
		}else{
			return null;
		}
		
		
	}
	
}
