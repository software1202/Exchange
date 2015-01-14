package Biz;

import hibernate.District;
import hibernate.DistrictDAO;
import hibernate.HibernateSessionFactory;
import hibernate.User;
import hibernate.UserDAO;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
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
	
	public boolean addUser(String userId,String userPassword,String userName,
			int integration,String disId,String phoneNum){
		
		
		User user = new User();
		Date regisDate = new Date(); 
		//District district = new District();
		//java.util.Date nowDate = new java.util.Date();
		//Date regisDate =nowDate.getTime();// new Date()为获取当前系统时间
		user.setRegisDate(regisDate);
	    user.setPhoneNumber(phoneNum);
	    user.setUserId(userId);
	    user.setUserPassword(userPassword);
	    user.setUserNickName(userName);
	    user.setIntegration(integration);
	    
	    //district.setDisId(disId);
	    //userDAO(district.getDisId());
	    DistrictDAO districtDAO = new DistrictDAO();
	    District district = districtDAO.findById(disId); 
	    user.setDistrict(district);
	    user.setAddress(district.getDisName());
	    System.out.println(district.getDisName());
	    System.out.println(user.getDistrict().getDisId());
	    Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		session.save(user);
 
		session.getTransaction().commit(); 
		session.close();
		return true;
	}
	
	
	

}
