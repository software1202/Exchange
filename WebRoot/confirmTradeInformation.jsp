<%@page import="hibernate.BookingDAO"%>
<%@ page language="java" import="java.util.*,hibernate.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'noLogin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript">
    	function formSubmit(formName){
    		//alert(formName);
    		if(confirm("确认执行此操作？")){
    			document.getElementById(formName).submit();
    		}
    	}
    </script>
  </head>
  
  <body>
  	<%
  		if(session.getAttribute("userId")==null){
			%>
				<jsp:forward page="noLogin.jsp"/>
			<%
		}
		String tradeId = request.getParameter("tradeId");
		String userId = request.getParameter("userId");
		if(tradeId==null){
			%>
				<jsp:forward page="error.jsp"/>
			<%
		}
		BookingDAO bookingDao = new BookingDAO();
		Booking booking = bookingDao.findById(tradeId);
  	 %>
   		<div style="margin-left:40%;margin-top:200px;">
   		<form id="confirmTrade" action="confirmTrade.do" method="post">
   			<div>
   				<span>交易Id：<%out.print(booking.getBookingId());%></span>
   			</div>
   			<div>
   				<span>甲方Id：<%out.print(booking.getUserByAuserId().getUserId());%></span>
   			</div>
   			<div>
   				<span>乙方Id：<%out.print(booking.getUserByBuserId().getUserId());%></span>
   			</div>
   			<div>
   				<span>交易保证金：<%out.print(booking.getDeposit());%></span>
   			</div>
   			<div>
   				<span>交易方式:
   				<%
   					if(booking.getExMethod().equals("01")){
   						out.print("快递交易");
   					}else{
   						out.print("当面交易");
   					}
   				 %>
   				 </span>
   			</div>
   			<div style="margin-top:30px">
   				<input type="hidden" name="tradeId" value="<%out.print(tradeId);%>">
   				<input type="hidden" name="userId" value="<%out.print(userId);%>">
   				<a href="javascript:formSubmit('confirmTrade')">确认交易</a>
   			</div>
   		</form>
   		</div>
  </body>
</html>
