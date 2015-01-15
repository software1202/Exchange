package form;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
/** 
 * MyEclipse Struts
 * Creation date: 06-10-2008
 * 
 * XDoclet definition:
 * @struts.form name="loginForm"
 */
public class LoginForm extends ActionForm {
	/*
	 * Generated fields
	 */
	/** password property */
	private String password;

	/** userName property */
	private String userName;

	/*
	 * Generated Methods
	 */

	/** 
	 * Returns the password.
	 * @return String
	 */
	public String getPassword() {
		return password;
	}

	/** 
	 * Set the password.
	 * @param password The password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/** 
	 * Returns the userName.
	 * @return String
	 */
	public String getUserName() {
		return userName;
	}

	/** 
	 * Set the userName.
	 * @param userName The userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public ActionErrors validate(ActionMapping mapping,
            HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
       if (this.password.equals("")||this.userName.equals("")) {
    	   request.setAttribute("null", "12");
           errors.add("unLegal",new ActionMessage("unLegalError"));
           return errors;
        }
       if(!isLegal(userName,password)){
    	   request.setAttribute("unLegal", "12");
           errors.add("unLegal",new ActionMessage("unLegalError"));
           return errors;
       }
       return errors;
    }
	private boolean isLegal(String tUserName,String tPassword){
		//过滤用户名，密码
		Pattern p = Pattern.compile("([~!@#$%^&\\*()_+\\-=;':\",\\./<>?|\\s]|drop|delete|truncate|and|or)"); 
		Matcher m = p.matcher(tUserName);   
		if(m.find())return false;
		m = p.matcher(tPassword);   
		if(m.find())return false;
		return true;
	}
}
