package action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import Biz.UserBiz;
import form.EnrollForm;

public class EnrollAction extends Action {
   @Override
public ActionForward execute(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {
	// TODO Auto-generated method stub
	   EnrollForm enrollform = (EnrollForm)form;
	   String userId = enrollform.getUserId();
	   String userPassword = enrollform.getUserPassword();
	   String userName = enrollform.getUserName();
	   //String disId = enrollform.getDisId();
	   String disId = "1100200001";
	   String phoneNum = "1234567";
	   int integration = 123;
	   UserBiz userBiz = new UserBiz();
	   userBiz.addUser(userId, userPassword, userName, integration, disId, phoneNum);
	   return mapping.findForward("success");
	   
	//return super.execute(mapping, form, request, response);
}	
}