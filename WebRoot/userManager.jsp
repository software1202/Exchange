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

		if(request.getParameter("content")!=null){
			String content = (String)request.getParameter("content");
			content = new String(content.getBytes("iso-8859-1"),"UTF-8");
			String contentType = request.getParameter("contentType");
			
			if(informBiz.addInform(content, contentType)){
				%>
					<script>
						alert("添加成功");
					</script>
				<%
			}else{
				%>
					<script>
						alert("添加失败");
					</script>
				<%
			}
		}
		int pageIndex =1;
		int pageNum = 1; //显示的分页数目
		int singlePageNum = 5;
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
           <td style="width:15%">类型</td>  
           <td align="center" width = "10%">操作</td>    
      	</tr> 
      	<%
      		List informList = informBiz.getInformList();
      		if(informList.size()%singlePageNum==0)
				pageNum = informList.size()/singlePageNum;
			else
				pageNum = informList.size()/singlePageNum+1;
      		for(int i=(pageIndex-1)*singlePageNum;i<informList.size()&&i<(pageIndex)*singlePageNum;i++){
      			Inform inform = (Inform)informList.get(i);
      			%>
      				<tr>
      					<td><% out.print(inform.getIid()); %></td>
      					<td><% out.print(inform.getContent()); %></td>
      					<td><% out.print(inform.getTime()); %></td>
      					<td>
      						<%
      							String informType = inform.getType();
      							if(informType.equals("01")){
      								out.print("公告"); 
      							}else if(informType.equals("02")){
      								out.print("活动"); 
      							}else if(informType.equals("03")){
      								out.print("规则"); 
      							}else if(informType.equals("04")){
      								out.print("提醒"); 
      							}else if(informType.equals("05")){
      								out.print("其他"); 
      							}
      						%>
      					
      					</td>
      					<td>
      					<input type='button' value='删除' onclick="formSubmit('delete<%out.print(i+"");%>')">
      					<form id="delete<%out.print(i+"");%>" action="addComment.jsp">
      						<input type="hidden" name ="informId" value="<%out.print(inform.getIid());%>">
      					</form>
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
		<form id="pageNext" action="addComment.jsp" method="post">
          		<input type="hidden" name="pageIndex" value="<%out.print(pageIndex+1);%>">
     	</form>
     	<form id="pagepre" action="addComment.jsp" method="post">
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
    
    
    <div style="margin-top:60px;width:1000px;height:100px;margin-left:80px;">
        <input style="margin-right:50px;margin-top:10px;width:60px;height:30px" type="button" value="新增" onclick="trdadd()">  
    
    <div id="fid" style="display : none;margin-top:10px">   
      	<form id="formid" method="post" action="addComment.jsp">   
     	<table id=aaid>   
     	<tr>  
     		<td> 
     	 	新增内容 : <input name="content" style="width:300px;height:100px" id="bid" type="text" size="20%"> 
     	 	</td>   
           <td>                           
                                       新增 类型 :   
       		<select id="eid" name="contentType">   
          		<option value="01">公告</option>   
          		<option value="02">规则</option>   
          		<option value="03">活动</option>   
          		<option value="04">提醒</option>   
          		<option value="05">其他</option>   
      		</select>  
      		</td>   
      		<td>
        	<input style="margin-left: 20px" type="submit" value="保存" onclick="baocun()">   
        	</td>
        	<td>
        	<input style="margin-left: 20px" type="reset" value="重置" onclick="chongzhi()"> <!-- 重置type类型必须为reset--> 
         	</td>
         </tr> 
        </table>     
    	</form>   
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