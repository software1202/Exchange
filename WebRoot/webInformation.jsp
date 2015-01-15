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
    <title>站内消息</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
	
	<link rel="stylesheet" href="css/trade.css"/>
	<link rel="stylesheet" href="css/global-min.css" type="text/css">
    <link rel="stylesheet" href="css/base.css" type="text/css" />
	<script type="text/javascript" src="js/deps.js"></script>
	
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

	
	
<div id="layout-center">
    <div class="grid-c2">
        <div id="J_Col_Main" class="col-main">
            <div class="main-wrap">
                <div class="mt-ml-c1" >
					<!--薄膜，垫片-->
					<div class="mt-ml-shim"></div>
					<div id="wunai">
						<div id="main-content">
	
	<div style="margin-left:100px;width:1000px;"> 
		<center> 
		<table id="tableid" class="show-rate-table" >   
		<thead>   
		<tr>   
            <td style="width:10%">编号</td>   
           <td style="width:50%">内容</td>   
           <td style="width:15%">时间</td>   
           <td style="width:15%">类型</td>  
           <td align="center" width = "10%">操作</td>    
      	</tr> 
      	<%
      		InformBiz informBiz = new InformBiz();
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
