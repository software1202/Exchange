<%@ page language="java" pageEncoding="UTF-8" import = "hibernate.*,javax.servlet.http.HttpServletRequest;"%>
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
    
    <title>物品详情</title>
    	
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
  		Goods goods=(Goods)request.getAttribute("goods");
  		if(goods==null){
  			%>
  				  <jsp:forward page="error.jsp" />
  			<%
  		}
  		String addResult = (String)request.getAttribute("addResult");
  		if(addResult!=null){
  			if(addResult.equals("101")){
  				%>
  				<script>
  				alert("该物品已被换享");
  				</script>
  				<%
  			}else if(addResult.equals("102")){
  				%>
  				<script>
  				alert("不能换享自己的物品");
  				</script>
  				<%
  			}
  		}
		if(request.getParameter("zhuxiao")!=null){
			session.removeAttribute("userId");
			session.removeAttribute("userName");
		}
	 %>
	 <form id="startChange" action="startExchange.do" method="get">
	 	  <input type="hidden" name="state" value="10">
          <input type="hidden" name="goodsId" value="<%out.print(goods.getGoodsId());%>">
     </form>
	<!--scroll-head-->
    <div class="scroll-head"></div>
    <!--top-->
    <div class="top-wrapper">
        <div class="top-info">
            <!--top-right-->
            <div class="top-right">
            	<%
            		String userName = (String)session.getAttribute("userName");
            		if(userName==null){
            			%>
            				<a class="a-float-left" href="login.jsp">登陆</a>
                			<span class="vertical-line">|</span>
                			<a class="a-float-left" href="#">注册</a>
            			<%
            		}else{
            			%>
            				
            				<div data-toggle="arrowdown" id="arrow3" class="user-name">
                    		<a href="#">个人空间</a>
                    		<span class="down-icon"></span>
                			</div>
                			<span class="vertical-line">|</span>
                			<span class="a-float-left">
            					<% out.print(userName); %>,欢迎您
            				</span>
            				<span class="vertical-line">|</span>
                			<a href="javascript:shezhi()">注销</a>
                			<form id="zhuxiao" action="index.jsp" method="post">
                				<input type="hidden" name="zhuxiao">
                			</form>
                			
                			
                			
                			<!--hidden-box-->
                			<div data-toggle="hidden-box" id="nav-box3" class="my-taobao-box">
                    			<ul>
                        			<li><a href="wantChange.do">我想换的</a></li>
                        			<li><a href="wantedChange.jsp">想换我的</a></li>
                       				<li><a href="changetalk.jsp">正在协商</a></li>
                        			<li><a href="exchanging.jsp">正在交换</a></li>
                        			<li><a href="uploadGoods.jsp">上传物品</a></li>
                    			</ul>
                			</div>
            			<%
            		}
            	 %>
                
            </div>
        </div>
        
    </div>
    
    <!--top-main-->
    <div style="height:40px;">
        
    </div>
    
    <div style="margin-left:100px">
        <a href="index.jsp"><img src="img/logo250.png"></a>
    </div>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tbody><tr>
    <td height="30"><table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
        <tbody><tr>
          <td class="text">
     </td>
          <td><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tbody>
</tbody></table></td>
        </tr>
      </tbody></table></td>
  </tr>
</tbody></table>
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tbody><tr>
    <td height="5" background="images/top_mubiao.gif"></td>
  </tr>
</tbody></table>

<table width="980" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#AACCEE">
  <tbody><tr>
    <td height="24" valign="top" bgcolor="#ff4401"><span class="text STYLE3">:<font color=white> 物品详情：</font></span></td>
  </tr>
</tbody></table>

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tbody><tr>
    <td valign="top" height="6"></td>
  </tr>
  <tr>
    <td height="30" class="text" style="color:#999999 "><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody><tr>
          <td width="370" height="270" valign="top"><table border="0" cellpadding="4" cellspacing="1" bgcolor="#CCCCCC">
              <tbody><tr>
                <td width="350" bgcolor="#FFFFFF"><div id="preview">
      
                    <div class="jqzoom" id="spec-n1"><img height="250" src="<%out.print(goods.getImage()); %>" width="350"> 
                    </div>
                    
                  </div>
                  
                  </td>
              </tr>
            </tbody></table>
            <table width="360" border="0" cellpadding="0" cellspacing="0">
              </table></td>
          <td valign="top">
          <table width="400" border="1" cellspacing="0" cellpadding="0" bordercolor="#BBBBBB">
              <tbody>
              
                <tr>
                  <td width="85" height="25" class="text">&nbsp; 物品名称：</td>
                  
                  <td width="335" class="text"><b>&nbsp;<%out.print(goods.getGoodsName());%></b></td>
                </tr>
                
                <tr>
                  
                  <td height="25" class="text">&nbsp; 类&nbsp;&nbsp;&nbsp; 别：</td>
           
                  <td class="text">&nbsp; <%out.print(goods.getBrand()); %></td>
                </tr>
                <tr>
                 <tr>
                  <td height="85" class="text">&nbsp; 描&nbsp;&nbsp;&nbsp;&nbsp;述：</td>
                  <td class="text">&nbsp; <%out.print(goods.getDescribe()); %></td> 
                </tr>
                                   
            </tbody>
            </table>
            
            <table width="400" border="0" cellpadding="0" cellspacing="0">
              <tbody>
              <tr>
                <td height="50" align="center" ></td>
              </tr>
              <tr>
                <td height="50" align="center" >
                
                	<input type="submit" onclick="javascript:formSubmit('startChange')" value ="我想换" style="height:30px;width:80px"></submit> &nbsp; &nbsp; &nbsp;&nbsp; </submit> &nbsp; &nbsp;&nbsp; &nbsp; 
                    
                  	<input type="submit" class="btn" value ="举 报" style="height:30px;width:80px;background:#ff4401"></submit>
                </td>
              </tr>
            </tbody></table>
            </td>
          <td width="200" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" >
              <tbody><tr bgcolor="#ff4401">
                <td height="25" background="images/text_bg.gif"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tbody><tr>
                      <td align="left"><font color=white>用户资料</td>
                    </tr>
                  </tbody></table></td>
              </tr>

              <tr>
                <td height="242" valign="top" bgcolor="#F8FBFE"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tbody><tr>
                      <td height="10" colspan="3" align="right" class="text"><table width="100%" border="0" cellpadding="0" cellspacing="5" style="font-size:12px;">
                          
                          <tbody><tr>
                            <td width="65" height="72" align="center"><a href="user_show.asp?user_id=18061" target="_parent">
                              
                              <img src="img/user-head.jpg" width="60" height="60" border="1" style="border:1px solid #aaccee;">
                              
                              </a></td>
                           
                          </tr>
                        </tbody></table></td>
                    </tr>
                    
                    <%
                    	UserDAO userDao = new UserDAO();
                    	String userIdOfGoods = goods.getUser().getUserId();
                    	User userOfGoods = userDao.findById(userIdOfGoods);
                     %>
                   
                    
                     <tr>
                      <td height="25" colspan="2" align="right" class="text"><div align="right">用 户 名：</div></td>
                       <td class="text"><%out.print(userOfGoods.getUserNickName()); %></td>
                    </tr>
                    <tr>
                    
                      <td colspan="3" height="1" background="images/line.gif"></td>
                    </tr>
                     <tr>
                      <td height="25" colspan="2" align="right" class="text"><div align="right">I D：</div></td>
                      <td width="97" class="text"><%out.print(userOfGoods.getUserId()); %></td>
                    </tr>
                     <tr>
                      <td colspan="3" height="1" background="images/line.gif"></td>
                    </tr>
                    
                    <tr>
                      <td height="25" colspan="2" align="right" class="text"><div align="right">所 在 地：</div></td>
                      <td class="text">地点</td>
                    </tr>
                    
                    
                    <tr>
                      <td colspan="3" height="1" background="images/line.gif"></td><!一根线的图片>
                    </tr>
                    
                    
                    <tr>
                      <td height="25" colspan="2" align="right" class="text"><div align="right">注册时间： </div></td>
                      <td class="text">2014-12-24</td>
                    </tr>
                    
                    <tr>
                      <td colspan="3" height="1" background="images/line.gif"></td>
                    </tr>
                    <tr>
                      <td height="25" colspan="2" align="right" ><input type="submit" class="btn" value ="留言" style="height:30px;width:80px"></td>
                      <td height="25" colspan="2" align="center" ><input type="submit" class="btn" value ="查看更多" style="height:30px;width:80px"></td>
                    </tr>
                    
                    
                    
                  </tbody></table></td>
              </tr>
            </tbody></table></td>
        </tr>
        <tr>
          <td></td>
          <td height="10"></td>
          <td></td>
        </tr>
      </tbody></table></td>
  </tr>
  
</tbody></table>

<div style="height:40px;"></div>

<%@ include file="common/footer.jsp" %>

   <script src="js/jquery_1.9.js"></script>
    <script src="js/main.js"></script>
    <script src="js/img-show.js"></script>
  </body>
</html>
