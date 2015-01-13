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
	<script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
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
<!--top-main-->
    <div style="height:10px;">
        
    </div>
    
    <div style="margin-left:100px">
        <img src="img/logo250.png">
    </div>
	<div style="margin-left:300px">
	  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="750" height="500" id="FLVPlayer">
		  <param name="movie" value="FLVPlayer_Progressive.swf" />
		  <param name="quality" value="high">
		  <param name="wmode" value="opaque">
		  <param name="scale" value="noscale">
		  <param name="salign" value="lt">
		  <param name="FlashVars" value="&amp;MM_ComponentVersion=1&amp;skinName=Clear_Skin_1&amp;streamName=flv/ex-share&amp;autoPlay=false&amp;autoRewind=false" />
		  <param name="swfversion" value="8,0,0,0">
		  <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
		  <param name="expressinstall" value="Scripts/expressInstall.swf">
		  <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
		  <!--[if !IE]>-->
		  <object type="application/x-shockwave-flash" data="FLVPlayer_Progressive.swf" width="750" height="500">
		    <!--<![endif]-->
		    <param name="quality" value="high">
		    <param name="wmode" value="opaque">
		    <param name="scale" value="noscale">
		    <param name="salign" value="lt">
		    <param name="FlashVars" value="&amp;MM_ComponentVersion=1&amp;skinName=Clear_Skin_1&amp;streamName=flv/ex-share&amp;autoPlay=false&amp;autoRewind=false" />
		    <param name="swfversion" value="8,0,0,0">
		    <param name="expressinstall" value="Scripts/expressInstall.swf">
		    <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
		    <div>
		      <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
		      <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="获取 Adobe Flash Player" /></a></p>
	        </div>
		    <!--[if !IE]>-->
	    </object>
		  <!--<![endif]-->
	  </object>
</div>
	<div style="height:10px;"></div>

<%@ include file="common/footer.jsp" %>
<script type="text/javascript">
swfobject.registerObject("FLVPlayer");
    </script>
</body>
</html>