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
    <link rel="stylesheet" href="css/gradely.css" />
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
	
	
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
	<font size=5><b>站内消息</b></font>
	<div style="margin-top:60px;width:1000px;"> 
	
		<center> 
		
		<table id="tableid" class="show-rate-table" >   
		<thead>   
		<tr>   
            <td style="width:15%">编号</td>   
           <td style="width:55%">内容</td>   
           <td style="width:15%">时间</td>   
           <td style="width:15%">类型</td>     
      	</tr> 
      	<%
      		singlePageNum =6;
      		InformBiz informBiz = new InformBiz();
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
      				</tr>
      			<%
      		}
      	 %>  
      </thead>   
     </table>     
    </center>
    
    <div style="float:right;margin-top:30px;">
    	<div class="total">
			<a href="javascript:pageSub()" class="J_CombinPay J_MakePoint toolbtn" id="prv">上一页</a>
			<a href="javascript:pageAdd()" class="J_CombinAgentPay J_MakePoint toolbtn" id="next">下一页</a>
			共<%out.print(pageNum); %> 页，
			<span class="text">当前是第<%out.print(pageIndex); %> 页</span>
		</div>
		<form id="pageNext" action="webInformation.jsp" method="post">
          		<input type="hidden" name="pageIndex" value="<%out.print(pageIndex+1);%>">
     	</form>
     	<form id="pagepre" action="webInformation.jsp" method="post">
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
