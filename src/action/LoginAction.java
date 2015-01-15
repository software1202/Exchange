package action;

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

import Biz.UserBiz;

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
public class LoginAction extends Action {
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
		LoginForm loginForm = (LoginForm) form;// TODO Auto-generated method stub
		String userName = loginForm.getUserName();
		String password = loginForm.getPassword();
		UserBiz uBiz =  new UserBiz();
		String userNickname= uBiz.userLogin(userName, password);
		if(userNickname!=null){
			//Ã»ÓÐ±»·âºÅ
			if(uBiz.isLegal(userName)){
				HttpSession session = request.getSession();
				session.setAttribute("userName", userNickname);
				session.setAttribute("userId", userName);
				return mapping.findForward("success");
			}else{
				request.setAttribute("fenghao", "fenghao");
				return mapping.findForward("failed");
			}
		}else{
			request.setAttribute("error", "error");
			return mapping.findForward("failed");
		}
		
	}
}