package action;

import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import Biz.AdminBiz;
import Biz.UserBiz;

import form.AdminLoginForm;
import form.LoginForm;

import sun.security.util.Password;


/** 
 * MyEclipse Struts
 * Creation date: 06-10-2008
 * 
 * XDoclet definition:
 * @struts.action path="/login" name="loginForm" input="/login.jsp" validate="true"
 * @struts.action-forward name="success" path="/success.jsp"
 * @struts.action-forward name="failure" path="/login.jsp"
 */
public class AdminLoginAction extends Action {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		AdminLoginForm loginForm = (AdminLoginForm) form;// TODO Auto-generated method stub
		String userName = loginForm.getUserName();
		String password = loginForm.getPassword();
		
		AdminBiz adminBiz = new AdminBiz();
		if(adminBiz.adminLogin(userName, password)){
			request.getSession().setAttribute("adminName", userName);
			return mapping.findForward("success");
		}else{
			request.setAttribute("error", "yes");
			return mapping.findForward("failed");
		}
		
		
	}
}