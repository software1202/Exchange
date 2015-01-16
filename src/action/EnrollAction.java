package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import Biz.LocationBiz;
import Biz.UserBiz;
import form.EnrollForm;

public class EnrollAction extends Action {
   @Override
public ActionForward execute(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {
	// TODO Auto-generated method stub
	   EnrollForm enrollform = (EnrollForm)form;
	   LocationBiz addressBiz = new LocationBiz();
	   String userId = enrollform.getUserId();
	   String userPassword = enrollform.getUserPassword();
	   String userName = enrollform.getUserName();
	   String status = "00";
	   String district = enrollform.getCounty();
	   //System.out.println("111111111111");
	   String address = enrollform.getUserAddress();
	   //System.out.println("111111111111");
	   System.out.println(address);
	   district = new String(district.getBytes("iso-8859-1"),"UTF-8");
	   address = new String(address.getBytes("iso-8859-1"),"UTF-8");
	   String disId = (addressBiz.getDis(district)).getDisId();
	   //String disId = enrollform.getDisId();
	   //String disId = "1100200001";
	   String phoneNum = enrollform.getPhoneNum();
	   int integration = 123;
	   UserBiz userBiz = new UserBiz();
	   userBiz.addUser(userId, userPassword, userName, integration, disId, phoneNum,address,status);
	   return mapping.findForward("success");
	   
	//return super.execute(mapping, form, request, response);
}	
}