package form;

import java.io.UnsupportedEncodingException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class EnrollForm extends ActionForm {
	
	private String userId;
	private String userName;
	private String userPassword;
	private String userPassword2;
	private String disId;
	private String county;
	private String regisDate;
	private String phoneNum;
	private String userAddress;
	
    public String getPhoneNum() {
		return phoneNum;
	}
    public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
    
   public void setUserAddress(String userAddress) {
	this.userAddress = userAddress;
    }
	
   public String getUserAddress() {
	return userAddress;
}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserPassword2() {
		return userPassword2;
	}
	public void setUserPassword2(String userPassword2) {
		this.userPassword2 = userPassword2;
	}
	public String getDisId() {
		return disId;
	}
	public void setDisId(String disId) {
		this.disId = disId;
	}
	public String getRegisDate() {
		return regisDate;
	}
	public void setRegisDate(String regisDate) {
		this.regisDate = regisDate;
	}
	
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		try{
		
			userId = new String(userId.getBytes("iso-8859-1"),"UTF-8");
			if(userId.equals("")){
				request.setAttribute("userIdError", "01");
				errors.add("errors",new ActionMessage("errors"));
				return errors;
			}
			if(userId.length()>10){
				request.setAttribute("userIdError", "02");
				errors.add("errors",new ActionMessage("errors"));
				return errors;
			}
			if(!isLegal(userId)){
				request.setAttribute("userIdError", "03");
				errors.add("errors",new ActionMessage("errors"));
				return errors;
			}
			
			userPassword = new String(userPassword.getBytes("iso-8859-1"),"UTF-8");
			if(userPassword.equals("")){
				request.setAttribute("userPasswordError", "01");
				errors.add("errors",new ActionMessage("errors"));
				return errors;
			}
			if(userPassword.length()>10){
				request.setAttribute("userPasswordError", "02");
				errors.add("errors",new ActionMessage("errors"));
				return errors;
			}
			if(!isLegal(userPassword)){
				request.setAttribute("userPasswordError", "03");
				errors.add("errors",new ActionMessage("errors"));
				return errors;
			}
			
			userPassword2 = new String(userPassword2.getBytes("iso-8859-1"),"UTF-8");
			if(userPassword2.equals("")){
				request.setAttribute("userPassword2Error", "01");
				errors.add("errors",new ActionMessage("errors"));
				return errors;
			}
			
			if(userPassword!=userPassword2){
				request.setAttribute("userPassword2Error", "04");
				errors.add("errors",new ActionMessage("errors"));
				return errors;
			}
			
			
			
			userName = new String(userName.getBytes("iso-8859-1"),"UTF-8");
			if(userName.equals("")){
				request.setAttribute("userNameError", "01");
				errors.add("errors",new ActionMessage("errors"));
				return errors;
			}
			if(userName.length()>10){
				request.setAttribute("userNameError", "02");
				errors.add("errors",new ActionMessage("errors"));
				return errors;
			}
			if(!isLegal(userName)){
				request.setAttribute("userNameError", "03");
				errors.add("errors",new ActionMessage("errors"));
				return errors;
			}
			
			
			
			phoneNum = new String(phoneNum.getBytes("iso-8859-1"),"UTF-8");
			if(phoneNum.equals("")){
				request.setAttribute("phoneNumError", "01");
				errors.add("errors",new ActionMessage("errors"));
				return errors;
			}
			if(phoneNum.length()>11){
				request.setAttribute("phoneNumError", "02");
				errors.add("errors",new ActionMessage("errors"));
				return errors;
			}
			if(!isLegal(phoneNum)){
				request.setAttribute("phoneNumError", "03");
				errors.add("errors",new ActionMessage("errors"));
				return errors;
			}
			userAddress = new String(userAddress.getBytes("iso-8859-1"),"UTF-8");
			if(userAddress.equals("")){
				request.setAttribute("userAddressError", "01");
				errors.add("errors",new ActionMessage("errors"));
				return errors;
			}
			if(userAddress.length()>30){
				request.setAttribute("userAddressError", "02");
				errors.add("errors",new ActionMessage("errors"));
				return errors;
			}
			if(!isLegal(userAddress)){
				request.setAttribute("userAddressError", "03");
				errors.add("errors",new ActionMessage("errors"));
				return errors;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return errors;
	}
	private boolean isLegal(String str){
		//¹ıÂË,·½sql×¢Èë
		System.out.println(str);
		Pattern p = Pattern.compile("([~!@#$%^&\\*()_+\\-=;':\",\\./<>?|\\s]|drop|delete|truncate|and|or)"); 
		Matcher m = p.matcher(str);   
		if(m.find())return false;
		return true;
	}
}
