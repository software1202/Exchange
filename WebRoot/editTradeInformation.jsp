<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		if(tradeId==null){
			%>
				<jsp:forward page="error.jsp"/>
			<%
		}
  	 %>
   		<div style="margin-left:40%;margin-top:200px;">
   		<form id="editTradeInformation" action="editTradeInformation.do" method="post">
   			<div>
   				交易金额：<input type="text" name="tradeMoney"/>
   				<html:errors  property="noTradeMoney" />
   				<html:errors  property="tradeMoneyFault" />
   			</div>
   			<div>
   				交易方式
   				<input type="radio" name="tradeWay" value='01'>快递交易
   				<input type="radio" name="tradeWay" value='02'>面对面交易
   				
   				<html:errors  property="noTradeWay" />
 				<input type="hidden" name="tradeId" value="<%out.print(tradeId);%>">
   			</div>
   			<div style="margin-top:30px">
   				<button onclick="formSubmit('editTradeInformation')">提交交易信息</button>
   			</div>
   		</form>
   		</div>
  </body>
</html>
