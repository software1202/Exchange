<%@page import="Biz.UserBiz"%>
<%@page import="Biz.InformBiz"%>
<%@ page language="java" pageEncoding="UTF-8" import = "java.util.*,hibernate.*,javax.servlet.http.HttpServletRequest;"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
   <link rel="stylesheet" href="css/gradely.css" />
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
	
	
	<link rel="stylesheet" href="css/global-min.css" type="text/css">
    <link rel="stylesheet" href="css/base.css" type="text/css" />
    
    <title>用户管理</title>
    	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
		if(session.getAttribute("adminName")==null){
			%>
				<script type="text/javascript">
					alert("未登录");
				</script>
				<jsp:forward page="adminLogin.jsp"/>
			<%
		}
		UserBiz userBiz = new UserBiz();

		if(request.getParameter("delete")!=null){
			String userId = request.getParameter("userId");
			if(userBiz.deleteUserById(userId)){
				%>
					<script>
						alert("封号成功");
					</script>
				<%
			}else{
				%>
					<script>
						alert("封号失败");
					</script>
				<%
			}
		}
		if(request.getParameter("recover")!=null){
			String userId = request.getParameter("userId");
			if(userBiz.recoverUserById(userId)){
				%>
					<script>
						alert("解封成功");
					</script>
				<%
			}else{
				%>
					<script>
						alert("解封失败");
					</script>
				<%
			}
		}
		int pageIndex =1;
		int pageNum = 1; //显示的分页数目
		int singlePageNum = 8;
		if(request.getParameter("pageIndex")!=null){
			pageIndex= Integer.parseInt((String)request.getParameter("pageIndex"));
		}
	 %>
<!--top-main-->
    <div style="height:10px;">
        
    </div>
    
    <div style="margin-left:100px">
        <img src="img/logo250.png">
    </div>
    <div id="layout-center">
    <div class="grid-c2">
        <div id="J_Col_Main" class="col-main">
    
	<div style="margin-left:100px;width:1000px;"> 
		<center> 
		<table id="tableid" class="show-rate-table" >   
		<thead>   
		<tr>   
            <td style="width:10%">用户账号</td>   
           <td style="width:10%">用户昵称</td>   
           <td style="width:15%">时间</td>   
           <td style="width:15%">状态</td>  
           <td align="center" width = "10%">操作</td>    
      	</tr> 
      	<%
      		List userList = userBiz.getAllUser();
      		System.out.print("--");
      		if(userList.size()%singlePageNum==0)
				pageNum = userList.size()/singlePageNum;
			else
				pageNum = userList.size()/singlePageNum+1;
      		for(int i=(pageIndex-1)*singlePageNum;i<userList.size()&&i<(pageIndex)*singlePageNum;i++){
      			User user = (User)userList.get(i);
      			%>
      				<tr>
      					<td><% out.print(user.getUserId()); %></td>
      					<td><% out.print(user.getUserNickName()); %></td>
      					<td><% out.print(user.getRegisDate()); %></td>
      					<td>
      						<%
      							String userStatus = user.getStatus();
      							if(userStatus.equals("00")){
      								out.print("正常使用"); 
      							}else if(userStatus.equals("01")){
      								out.print("已被封号"); 
      							}
      						%>
      					
      					</td>
      					<td>
      					<%
      							if(userStatus.equals("00")){
      							%>
      								<input type='button' value='封号' onclick="formSubmit('delete<%out.print(i+"");%>')">
      								<form id="delete<%out.print(i+"");%>" action="userManager.jsp">
      								<input type="hidden" name ="userId" value="<%out.print(user.getUserId());%>">
      								<input type="hidden" name ="delete" value="yes">
      								</form>
      							<%
      							}else if(userStatus.equals("01")){
      							%>
      								<input type='button' value='解封' onclick="formSubmit('recover<%out.print(i+"");%>')">
      								<form id="recover<%out.print(i+"");%>" action="userManager.jsp">
      								<input type="hidden" name ="userId" value="<%out.print(user.getUserId());%>">
      								<input type="hidden" name ="recover" value="yes">
      								</form>
      							<%
      							}
      					%>
      					
      				</tr>
      			<%
      		}
      	 %>  
      </thead>   
     </table>     
    </center>
    
    <div style="width:100%">
    <div style="float:right;margin-top:30px;width:300px;">
    	<div style="">
			<a href="javascript:pageSub()" class="J_CombinPay J_MakePoint toolbtn" id="prv">上一页</a>
			<a href="javascript:pageAdd()" class="J_CombinAgentPay J_MakePoint toolbtn" id="next">下一页</a>
			共<%out.print(pageNum); %> 页，
			<span class="text">当前是第<%out.print(pageIndex); %> 页</span>
		</div>
		<form id="pageNext" action="userManager.jsp" method="post">
          		<input type="hidden" name="pageIndex" value="<%out.print(pageIndex+1);%>">
     	</form>
     	<form id="pagepre" action="userManager.jsp" method="post">
          	<input type="hidden" name="pageIndex" value="<%out.print(pageIndex-1);%>">
     	</form>
		<script language="javascript">
			function pageAdd() {
				if(<%out.print(pageIndex+"<"+pageNum);%>){
					document.getElementById("pageNext").submit();
				}else{
					alert("已到最后一页");
				}
			}
			function pageSub() {
				if(<%out.print(pageIndex+">1");%>){
					document.getElementById("pagepre").submit();
				}else{
					alert("已到第一页");
				}
			}
		</script>
    </div>
    </div>
    
    
	</div>
	<div style="height:10px;"></div>

	</div>
	<%@ include file="common/adminLeft.jsp" %>

	<%@ include file="common/footer.jsp" %>
	
	</div>
	</div>
</body>
</html>