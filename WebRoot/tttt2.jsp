<%@page import="Biz.MenuBiz"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import = "hibernate.*,javax.servlet.http.HttpServletRequest;"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="站长,网页特效,js特效,广告代码,zzjs,zzjs.net,sky,www.zzjs.net,站长特效 网" />
<meta name="description" content="www.zzjs.net,站长特效网，站长必备js特效及广告代码。大量高质量js特效，提供高质量广告代码下载,尽在站长特效网" />
<title>JS省市二级联动菜单,sky整理收集。</title>
<style>
<!--
body         { font-size: 14px }
-->
</style>
</head>
<body bgcolor=#FFFFFF alink=#333333 vlink=#333333 link=#333333 topmargin=0 leftmargin=0 onload="init()">
<a href="<#ZC_BLOG_HOST#>">站长特效网</a>,站长必备的高质量网页特效和广告代码。zzjs.net，站长js特效。<hr>
<!--欢迎来到站长特效网，我们网站收集大量高质量js特效，提供许多广告代码下载，网址：www.zzjs.net，zzjs@msn.com,用.net打造靓站-->
<form action="<#ZC_BLOG_HOST#>" method="post" name="creator" enctype="multipart/form-data">
<script language="javascript">
<!--

	
var where = new Array(9);
function comefrom(loca,locacity) { this.loca = loca; this.locacity = locacity; }
where[0]= new comefrom("请选择目录","请选择子目录");
<%
    MenuBiz menuBiz = new MenuBiz();
	Menu menu = new Menu();
	List menuList = menuBiz.getMenuList();
	 Submenu submenu = new Submenu();
      List subList;
      
      System.out.print(menuList.size());
      
      String t1 ="\");";
        //int j;
	  for(int i=1;i<menuList.size();i++){
	     String tmpString1 = "";
         String tmpString2="";
         String tmpString4="";
	     menu = (Menu)menuList.get(i-1); 
	     tmpString1 = "where["+i+"]= new comefrom(\""+menu.getMenuName()+"\",\"";
	     subList = menuBiz.getSubMenuByMenuId(menu.getMenuId());
	     for(int j=0;j<subList.size();j++){
	        submenu = (Submenu)subList.get(j);
	        if(j!=0)
	        	tmpString2 += "|"+submenu.getSubMenuName();
	        else 
	        	tmpString2 += submenu.getSubMenuName();
	     }
	     tmpString4 = tmpString1+tmpString2+t1;
	     out.print(tmpString4);
	  }
	%>
//where[1] = new comefrom("北京","|东城|西城|崇文|宣武|朝阳|丰台|石景山|海淀|门头沟|房山|通州|顺义|昌平|大兴|平谷|怀柔|密云|延庆");  //欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
//where[2] = new comefrom("上海","|黄浦|卢湾|徐汇|长宁|静安|普陀|闸北|虹口|杨浦|闵行|宝山|嘉定|浦东|金山|松江|青浦|南汇|奉贤|崇明");//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
//where[3] = new comefrom("天津","|和平|东丽|河东|西青|河西|津南|南开|北辰|河北|武清|红挢|塘沽|汉沽|大港|宁河|静海|宝坻|蓟县");
function select() {
with(document.creator.menu) { var loca2 = options[selectedIndex].value; }
for(i = 0;i < where.length;i ++) {
if (where[i].loca == loca2) {
loca3 = (where[i].locacity).split("|");
for(j = 0;j < loca3.length;j++) { with(document.creator.submenu) { length = loca3.length; options[j].text = loca3[j]; options[j].value = loca3[j]; var loca4=options[selectedIndex].value;}}
break;
}}
document.creator.newlocation.value=loca2+loca4;
} //欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
function init() {
with(document.creator.menu) {
length = where.length;
for(k=0;k<where.length;k++) { options[k].text = where[k].loca; options[k].value = where[k].loca; }
options[selectedIndex].text = where[0].loca; options[selectedIndex].value = where[0].loca;
}
with(document.creator.submenu) {
loca3 = (where[0].locacity).split("|");
length = loca3.length;
for(l=0;l<length;l++) { options[l].text = loca3[l]; options[l].value = loca3[l]; }
options[selectedIndex].text = loca3[0]; options[selectedIndex].value = loca3[0];
}} //欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
-->
</script>
<font color=#000000><b>来自：</b>
目录<select name="menu" onChange = "select()"></select>　子目录 <select name="submenu" onChange = "select()"></select>
</form>
</font>
</body>
</html>
