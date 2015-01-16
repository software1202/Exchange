<%@page import="Biz.TradeBiz"%>
<%@ page language="java" pageEncoding="UTF-8"import="java.util.*,hibernate.*,Biz.*" %>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!doctype html>
<html lang="en">
<head>
    <title>个人信息</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
	
	<link rel="stylesheet" href="css/trade.css"/>
	<link rel="stylesheet" href="css/global-min.css" type="text/css">
    <link rel="stylesheet" href="css/base.css" type="text/css" />
	
	 <link rel="stylesheet" href="css/geren.css"/>
	 <link rel="stylesheet" href="css/geren3.css"/>
	
	 <link rel="stylesheet" href="css/geren5.css"/>
	
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
	<%@ include file="common/top_main.jsp" %>

	
	<%
		UserBiz userBiz = new UserBiz();
		User user = userBiz.getUserById(userId);
	 %>
	
<div id="layout-center">
    <div class="grid-c2">
        <div id="J_Col_Main" class="col-main">
            <div class="main-wrap">
                <div class="mt-ml-c1" >
					<!--薄膜，垫片-->
					<div class="mt-ml-shim"></div>
					<div id="wunai">
						<div id="main-content">
	
	<div class="bought-list">
		<form action="" method="post" id="J_BoughtListForm" autocomplete="off">
			<input id="J_Token" type="hidden" name="_tb_token_" value="fe5fff387e47e">
			<input id="J_MainBizIds" type="hidden" name="main_biz_order_ids" value="830615123442932">
			<input id="J_buddy_require_url" type="hidden" value="http://tbskip.taobao.com/json/show_buddy_biz_order.do">
			<input id="J_buddy_result_link" type="hidden" value="http://follow.taobao.com/buddy_detail.htm">
			<input id="J_activity_require_url" type="hidden" value="http://active.taobao.com/json/bought_icon.htm">
<form name="mainform" action="http://member1.taobao.com/member/fresh/account_profile.htm" method="post">
				<input name="_tb_token_" type="hidden" value="fN321DWCCnn">
                <font size=5><b>个人信息</b></font>
				
		    	<ul class="elem-form section security-profile trade:addressEditor" id="ah:addressForm">
		    		<li>
		    			<span class="label-like">用户账号：</span>
		    			<strong><%out.print(user.getUserNickName()); %></strong>
		    		</li>
					<li>
		    			<span class="label-like">昵称：</span>
		    			<strong><%out.print(user.getUserNickName()); %></strong>
		    		</li>
					<li>
		    			<span class="label-like">注册日期：</span>
		    			<strong><%out.print(user.getRegisDate()); %></strong>
		    		</li>
		    		<li>
		    			<span class="label-like">个人所在地:</span>
		    			
		    		</li>
		    		<li>
			        	<span class="label-like">详细地址:</span>
			        	
		    		</li>
					<li>
		    			<span class="label-like">手机号码:</span>

					</li>
		    	</ul>
			</form>
		</form>

	</div><!--end bought-list-->
	

	</div>
					</div>
				</div>
			</div>
		</div>
	<%@ include file="common/left.jsp" %>
	
	<%@ include file="common/footer.jsp" %>
	
	</div>
</div>
</div>
</body>
</html>
