package form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
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
       if (this.password.equals("")) {
            errors.add("password", new ActionError("error.password"));
        }
       if (this.userName.equals("")) {
           errors.add("userName", new ActionError("error.userName"));
       }
       return errors;
    }
	
}
