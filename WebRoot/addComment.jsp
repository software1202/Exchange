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
    <link rel="stylesheet" href="css/detail.css"/>
    
    
    
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="css/global-min.css" type="text/css">
    <link rel="stylesheet" href="css/base.css" type="text/css" />
    
    <title>添加公告</title>
    	
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
    <script type="text/javascript">   
          // 新增   
      function trdadd(){   
            //flag=false;   
      		document.getElementById("fid").style.display="block"; //控制显示   
      		//chongzhi();   
         	//document.getElementById("aid").disabled=false; //重新启用   
      }   
        
      //保存   
      function baocun(){   
            formSubmit('formid'); 
      }   
      //重置   
      function chongzhi(){   
       document.getElementById("formid").reset();   
      }   
        

      </script>
      
    
 </head>

<body>
	<%
	InformBiz informBiz = new InformBiz();
		if(request.getParameter("informId")!=null){
			String informId = request.getParameter("informId");
			if(informBiz.deleteInform(informId)){
				%>
					<script>
						alert("删除成功");
					</script>
				<%
			}else{
				%>
					<script>
						alert("删除失败");
					</script>
				<%
			}
		}
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
	 %>
<!--top-main-->
    <div style="height:10px;">
        
    </div>
    
    <div style="margin-left:100px">
        <img src="img/logo250.png">
    </div>
	<div style="margin-left:200px;width:1000px;"> 
		<center>   
		<table id="tableid" border="1" cellpadding="0" cellspacing="0" width="100%" >   
		<thead>   
		<tr>   
            <td style="width:10%">编号</td>   
           <td style="width:60%">内容</td>   
           <td style="width:10%">时间</td>   
           <td style="width:10%">类型</td>  
           <td align="center" width = "10%">操作</td>    
      	</tr> 
      	<%
      		List informList = informBiz.getInformList();
      		for(int i=0;i<informList.size();i++){
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
        <div style="height:100px;width:100%">
        <input style="float:right;margin-right:50px;margin-top:30px;width:60px;height:30px" type="button" value="新增" onclick="trdadd()">  
      	</div>
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
     
      
    </center>
	</div>
	<div style="height:10px;"></div>

	<%@ include file="common/footer.jsp" %>
</body>
</html>