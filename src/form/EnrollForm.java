package form;

import java.io.UnsupportedEncodingException;

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
//		try {
//			//goodsName = new String(goodsName.getBytes("ISO-8859-1"),"UTF-8");
//			//describe = new String(describe.getBytes("ISO-8859-1"),"UTF-8");
//			//NewDegree = new String(NewDegree.getBytes("ISO-8859-1"),"UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		ActionErrors errors = new ActionErrors();
		if(userId==null){
			errors.add("noUserId",new ActionMessage("noUserIdError"));
			//return errors;
		}
		if(userPassword.equals("")){
			
			errors.add("noUserPassword",new ActionMessage("noUserPasswordError"));
			//return errors;
		}
		//request.setAttribute("GoodsName", goodsName);
		if(userName.equals("")){
			errors.add("noUserName",new ActionMessage("noUserNameError"));
			//return errors;
		}
		
		
		//request.setAttribute("Brand", brand);
//		if(describe.equals("")){
//			errors.add("noDec",new ActionMessage("noDecError"));
//			return errors;
//		}
		//request.setAttribute("Describe", describe);
		return errors;
	}
	
}
