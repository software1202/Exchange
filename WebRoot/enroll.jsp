<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>账号注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <meta name="data-spm" content="a2145">
    <!--吊顶assets START-->
    <link rel="stylesheet" href="http://g.tbcdn.cn/??tb/global/2.6.13/global-min.css?t=20140305">
    <!--吊顶assets END-->
    <link href="https://s.tbcdn.cn/g/tb/register/2.4.0/xcommon/css/??base.css,form.css,btn.css,dialog.css,ks.css,msg.css,password.css,info.css,responsive.css?t=201404171640" rev="stylesheet" rel="stylesheet">
  </head>
  
  <body>
    <body data-spm="7275777">



<!--吊顶 END-->


<div class="page lang-zh-S">
		
<div class="header">
     <h1 id="logo">
        <a href="index.jsp" target="_top"><img src="img/logo250.png" alt="换享网"></a>
       	</h1>
       	<div>
       	
       	</div>
    <div class="logo">
      <h2 class="tsl" data-phase-id="r_p_registration">账户注册</h2>
    </div>
    
</div><div class="content">
		<div class="form-list form-main-list">
			<form method="post" action="enroll.do" id="J_InfoForm">				
				<div class="form-group">
						<div class="form-item">
						<span class="form-label form-label-b tsl" data-phase-id="r_p_loginName">登录账号:</span>
						
							<input type="text" name="userId" id="TPL_username_1" class="login-text J_UserName" value="" maxlength="32" tabindex="2"><span class="req">&nbsp; </span>(格式要求) 
					</div>
				</div>
									
				<div class="form-group">
					<div class="form-item">
						<span class="form-label form-label-b tsl" data-phase-id="r_ui_enterPwdTip">设置登录密码</span>
					</div>
					<div class="form-item">
						<span class="form-label tsl" data-phase-id="r_p_password">登录密码:</span>
						    <input type="password" aria-labelledby="password-label" name="userPassword" id="TPL_password_1" class="login-text" maxlength="32" tabindex="2"><span class="req">&nbsp; </span>(格式要求) 		
					</div>
					
					<div class="form-item">
						<span class="form-label tsl" data-phase-id="r_p_confirmPassword">再次确认:</span>
							<input type="password" aria-labelledby="password-label" name="uerPassword2" id="TPL_password_1" class="login-text" maxlength="32" tabindex="1">
						
					</div>
				</div>
				<div class="form-group">
					<div class="form-item">
						<span class="form-label form-label-b tsl" data-phase-id="r_ui_enterUserNameTip">设置用户昵称</span>
					</div>
					<div class="form-item">
						<span class="form-label tsl" data-phase-id="r_p_userName">用户昵称:</span>
						<input type="text" name="userName" id="TPL_username_1" class="login-text J_UserName" value="" maxlength="32" tabindex="1"><span class="req">&nbsp; </span>(格式要求) 
					</div>
					<div class="form-item">
						<span class="form-label form-label-b tsl" data-phase-id="r_ui_enterUserNameTip">设置用户所在地</span>
					</div>
					<div class="form-item">
						<span class="form-label tsl" data-phase-id="r_p_userName">所在地:</span>
						<input type="text" name="address" id="TPL_username_1" class="login-text J_UserName" value="" maxlength="32" tabindex="1">
						<select name="cars" style=size:6;width:100pt> 
                           <option value="volvo">Volvo</option> 
                           <option value="saab">Saab</option> 
                           <option value="fiat">Fiat</option> 
                           <option value="audi">Audi</option> 
                        </select> 
					</div>
					
					<div class="form-item">
						<button type="submit" id="J_BtnInfoForm" class="btn btn-large tsl" data-phase-id="r_p_submit">确　定</button>
								<div class="msg tsl msg-type-error msg-hide" data-phase-id="" data-type="error" data-show="0" id="J_MsgInfoForm" data-display="block"><i class="iconfont">󰅕</i><div class="msg-tit"></div><div class="msg-cnt"></div></div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- 页脚 -->
  </body>
</html>
