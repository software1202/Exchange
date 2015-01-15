<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>换享网</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
	
	<link rel="stylesheet" href="css/loginfull.css"/>	
</head>
<body>
	<div id="page">
   <div class="header">
    	<h1 id="logo">
        <a href="index.jsp" target="_top"><img src="img/logo250.png" alt="换享网"></a>
       	</h1>
	</div>
   <div class="body clearfix">
		<div class="login"> 
		<div id="J_LoginBox" class="login-box no-longlogin module-static">
			<div class="hd"> 
				<ul>
					<li class="current"><h2>登录</h2></li>
				</ul>
			</div>
			<div class="bd">
				
				<div class="taobao-box" data-spm="1000341">
					<!--login box begin-->
					<div id="J_Message" style="display:none;" class="login-msg msg">
						<p class="error"></p>
					</div>
					<!--登录的错误信息结束-->

					<!--标准登录框-->
					<div id="J_Static" class="static">
						<form id="J_StaticForm" action="login.do" method="post">
							<input type="hidden" name="ua" id="UA_InputId">
							<div class="field ph-hide username-field">
								<label for="TPL_username_1" class="iconfont">󰄭</label>
								<span class="ph-label">手机号/会员名/邮箱</span>
								<input type="text" name="userName" id="TPL_username_1" class="login-text J_UserName" value="" maxlength="32" tabindex="1">
								<span id="J_NickX1413893659169" class="nickx" href="javascript:void(0)" style="display: block;"></span>
							</div>
							<div class="field pwd-field">
								<label id="password-label" for="TPL_password_1" class="iconfont">󰃮</label>
								<span id="J_StandardPwd">
									<input type="password" aria-labelledby="password-label" name="password" id="TPL_password_1" class="login-text" maxlength="20" tabindex="2">
								</span>     
							</div>
							<div class="field field-checkcode hidden" id="l_f_code">
								<span class="ph-label">验证码</span> 
								<input id="J_CodeInput_i" type="text" class="login-text checkcode J_CheckCode" maxlength="4" name="TPL_checkcode" tabindex="3">
								<img id="J_StandardCode_m" src="https://s.tbcdn.cn/apps/login/static/img/blank.gif" data-src="" class="check-code-img">
								<a href="#" class="change-code" id="J_StandardCode">看不清<br>换一张</a>
							</div>
							<%
								if(request.getAttribute("error")!=null){
									%>
										<font style="color:red;">用户名或密码错误</font>
									<%
								}
								if(request.getAttribute("fenghao")!=null){
									%>
										<font style="color:red;">您已被封号，请联系管理员</font>
									<%
								}
								if(request.getAttribute("unLegal")!=null){
									%>
										<font style="color:red;">用户名或密码包含非法字符</font>
									<%
								}
								if(request.getAttribute("null")!=null){
									%>
										<font style="color:red;">用户名或密码为空</font>
									<%
								}
				 			%>
							<div class="safe">
								<span class="safe-login"></span>
								<a href="http://110.taobao.com/account/activate.htm" target="_blank" id="forget-pw-safe" class="forget-pw">忘记登录密码?</a>
								<div class="login-tips" style="visibility:hidden;">
									<div class="login-tips-content"></div>
								</div>
							</div>
							<div class="submit">
								<button type="submit" class="J_Submit" tabindex="5" id="J_SubmitStatic">登　录</button>
							</div>
							<ul class="entries">
								<li id="registerUrl_1" class="register"><a id="J_RegisterLink1" href="http://reg.taobao.com/member/newbie.htm?from=login" target="_blank" tabindex="8">免费注册</a></li>
							</ul>
						</form>
					</div>
				</div>
			</div>	
		</div>
	
		<!--  <div class="login-bg">-->
		<div style="width:500px;height:300px;margin-left:80px;padding-top:60px;">
			   <img style="width:100%;height:100%;" src="img/loginShow.png">
    	</div>
	
		</div>
   </div>
   </div>
</body>
</html>
