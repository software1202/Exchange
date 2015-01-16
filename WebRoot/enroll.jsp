<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="Biz.*,hibernate.*" %>
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
    <link rel="stylesheet" href="css/enroll.css"/>
    <link rel="stylesheet" href="css/enroll1.css"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <meta name="data-spm" content="a2145">
    <!--吊顶assets START-->
   
    <!--吊顶assets END-->
      <script type="text/javascript">
     	function Dsy() {
    this.Items = {};
}
Dsy.prototype.add = function(id, iArray) {
    this.Items[id] = iArray;
}
Dsy.prototype.Exists = function(id) {
    if (typeof (this.Items[id]) == "undefined") return false;
    return true;
}

function change(v) {
    var str = "0";
    for (i = 0; i < v; i++) { str += ("_" + (document.getElementById(s[i]).selectedIndex - 1)); };
    var ss = document.getElementById(s[v]);
    with (ss) {
        length = 0;
        options[0] = new Option(opt0[v], opt0[v]);
        if (v && document.getElementById(s[v - 1]).selectedIndex > 0 || !v) {
            if (dsy.Exists(str)) {
                ar = dsy.Items[str];
                for (i = 0; i < ar.length; i++) options[length] = new Option(ar[i], ar[i]);
                if (v) options[1].selected = true;
            }
        }
        if (++v < s.length) { change(v); }
    }
}

var dsy = new Dsy();

<%
Biz.LocationBiz addressBiz = new Biz.LocationBiz();
	Province pro = new Province();
	
	List proList = addressBiz.getProviceList();
	
	

	pro = (Province)proList.get(0);
	String tmpString = "dsy.add(\"0\",[\""+pro.getProName()+"\"" ;
	for(int i=1;i<proList.size();i++){
	
		 pro = (Province)proList.get(i);
		 tmpString +=",\""+pro.getProName()+"\""; 
		}
		tmpString +="]);";
	    out.print(tmpString);
        City city = new City();
        District dis = new District();
        List cityList;
        List disList;
        String tmpString1 = "dsy.add(\"0_";
        String tmpString2="";
        String tmpString4="";
        String t1 ="]);";
        int j;
        int k;
       
	    for(int i=0;i<proList.size();i++){
	
		 pro = (Province)proList.get(i);
		 cityList=addressBiz.getCityList(pro.getProId());
		 for(j=1;j<cityList.size();j++) {
		 
		     city = (City)cityList.get(j);
		      tmpString2 = ",\""+city.getCityName()+"\"";
		 }
		 
		 String t =i+"\",[\""+((City)cityList.get(0)).getCityName()+"\"";
		 String tmpString3 = tmpString1+t+tmpString2+"]);";
		  out.print(tmpString3);
		 }
		
         for(int i=0;i<proList.size();i++){
	
		 pro = (Province)proList.get(i);
		 cityList=addressBiz.getCityList(pro.getProId());
		 for(j=0;j<cityList.size();j++) {
		 
		     city = (City)cityList.get(j);
		     disList=addressBiz.getdistList(city.getCityId());
		     for(k=1;k<disList.size();k++){
		      	
		      	dis=(District)disList.get(k);
		      	tmpString4 =  ",\""+dis.getDisName()+"\"";
		     }
		     String t2=i+"_"+j+"\",[\""+((District)disList.get(0)).getDisName()+"\"";
		     String tmpString5=tmpString1+t2+tmpString4+"]);";
		      out.print(tmpString5);
		     }
		     }%>
        
        

     	var s = ["province", "city", "county"];
var opt0 = ["省份", "地级市", "市、县级市、县"];
function setup() {
    for (i = 0; i < s.length - 1; i++)
        document.getElementById(s[i]).onchange = new Function("change(" + (i + 1) + ")");
    change(0);
     	}
     
     </script>
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
						<span class="form-label form-label-b tsl" data-phase-id="r_p_loginName">登录账号 <span class="req">*</span>:</span>
						
							<input type="text" name="userId" id="TPL_username_1" class="login-text J_UserName" value="" maxlength="32" tabindex="2"><span class="req">&nbsp; </span>(格式要求) 
						<%
							String ErrorInformation = (String)request.getAttribute("userIdError");
							if(ErrorInformation!=null){
								if(ErrorInformation.equals("01")){
									%>
										<font style="color: red;">不能为空</font>
									<%
								}else if(ErrorInformation.equals("02")){
									%>
										<font style="color: red;">不能超过10个字符</font>
									<%
								}else if(ErrorInformation.equals("03")){
									%>
										<font style="color: red;">含有非法字符</font>
									<%
								}
							}
						 %>
						
					</div>
					
				</div>
									
				<div class="form-group">
					<div class="form-item">
						<span class="form-label form-label-b tsl" data-phase-id="r_ui_enterPwdTip">设置登录密码</span>
					</div>
					<div class="form-item">
						<span class="form-label tsl" data-phase-id="r_p_password">登录密码:</span>
						    <input type="password" aria-labelledby="password-label" name="userPassword" id="TPL_password_1" class="login-text" maxlength="32" tabindex="2"><span class="req">&nbsp; </span>(格式要求) 		
						    <%
							ErrorInformation = (String)request.getAttribute("userPasswordError");
							if(ErrorInformation!=null){
								if(ErrorInformation.equals("01")){
									%>
										<font style="color: red;">不能为空</font>
									<%
								}else if(ErrorInformation.equals("02")){
									%>
										<font style="color: red;">不能超过10个字符</font>
									<%
								}else if(ErrorInformation.equals("03")){
									%>
										<font style="color: red;">含有非法字符</font>
									<%
								}
							}
						 %>
					</div>
					
					<div class="form-item">
						<span class="form-label tsl" data-phase-id="r_p_confirmPassword">再次确认:</span>
							<input type="password" aria-labelledby="password-label" name="uerPassword2" id="TPL_password_1" class="login-text" maxlength="32" tabindex="1">
						   <%  ErrorInformation = (String)request.getAttribute("userPasswordError");
							if(ErrorInformation!=null){
								if(ErrorInformation.equals("01")){
									%>
										<font style="color: red;">不能为空</font>
									<%
								}else if(ErrorInformation.equals("04")){
									%>
										<font style="color: red;">两次密码不一致</font>
									<% }
									}%>
							
					</div>
				</div>
				<div class="form-group">
					<div class="form-item">
						<span class="form-label form-label-b tsl" data-phase-id="r_ui_enterUserNameTip">设置用户昵称</span>
					</div>
					<div class="form-item">
						<span class="form-label tsl" data-phase-id="r_p_userName">用户昵称:</span>
						<input type="text" name="userName" id="TPL_username_1" class="login-text J_UserName" value="" maxlength="32" tabindex="1"><span class="req">&nbsp; </span>(格式要求) 
					    <%
							ErrorInformation = (String)request.getAttribute("userNameError");
							if(ErrorInformation!=null){
								if(ErrorInformation.equals("01")){
									%>
										<font style="color: red;">不能为空</font>
									<%
								}else if(ErrorInformation.equals("02")){
									%>
										<font style="color: red;">不能超过10个字符</font>
									<%
								}else if(ErrorInformation.equals("03")){
									%>
										<font style="color: red;">含有非法字符</font>
									<%
								}
							}
						 %>
					</div>
					<div class="form-item">
						<span class="form-label form-label-b tsl" data-phase-id="r_ui_enterUserNameTip">设置联系方式</span>
					</div>
					<div class="form-item">
						<span class="form-label tsl" data-phase-id="r_p_userName">手机:</span>
						<input type="text" name="phoneNum" id="TPL_username_1" class="login-text J_UserName" value="" maxlength="32" tabindex="1"><span class="req">&nbsp; </span>(格式要求) 
						<%
							ErrorInformation = (String)request.getAttribute("phoneNumError");
							if(ErrorInformation!=null){
								if(ErrorInformation.equals("01")){
									%>
										<font style="color: red;">不能为空</font>
									<%
								}else if(ErrorInformation.equals("02")){
									%>
										<font style="color: red;">不能超过11个字符</font>
									<%
								}else if(ErrorInformation.equals("03")){
									%>
										<font style="color: red;">含有非法字符</font>
									<%
								}
							}
						 %>					
					</div>
					<div class="form-item">
						<span class="form-label form-label-b tsl" data-phase-id="r_ui_enterUserNameTip">设置用户所在地</span>
					</div>
					<div class="form-item">
						<span class="form-label tsl" data-phase-id="r_p_userName">所在地:</span>
						<div class="t1">
                      
        				   <div>
            				  <select name="province" id="province">
           					  </select>
            				  <select name="city" id="city">
            				  </select>
                			  <select name="county" id="county">
                			  </select>
       					   </div>
       					   <div>
       					    <span class="form-label tsl" data-phase-id="r_p_userName">详细地址:</span>
       					    <input type="text" name="userAddress" id="TPL_username_1"  value=""  maxlength="32" tabindex="1" > 
       					   <%
							ErrorInformation = (String)request.getAttribute("userAddressError");
							if(ErrorInformation!=null){
								if(ErrorInformation.equals("01")){
									%>
										<font style="color: red;">不能为空</font>
									<%
								}else if(ErrorInformation.equals("02")){
									%>
										<font style="color: red;">不能超过30个字符</font>
									<%
								}else if(ErrorInformation.equals("03")){
									%>
										<font style="color: red;">含有非法字符</font>
									<%
								}
							}
						 %>
       					   </div>
    					</div>
   						 <script language="javascript">
       						 setup() 
    					 </script>
    					 
    					 
    					
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
