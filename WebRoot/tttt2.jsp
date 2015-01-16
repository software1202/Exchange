<%@page import="Biz.MenuBiz"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="hibernate.*,javax.servlet.http.HttpServletRequest;"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords"
	content="站长,网页特效,js特效,广告代码,zzjs,zzjs.net,sky,www.zzjs.net,站长特效 网" />
<meta name="description"
	content="www.zzjs.net,站长特效网，站长必备js特效及广告代码。大量高质量js特效，提供高质量广告代码下载,尽在站长特效网" />
<title>JS省市二级联动菜单,sky整理收集。</title>

<HEAD>

		<script language="JavaScript" type="text/javascript">
			//定义了城市的二维数组，里面的顺序跟省份的顺序是相同的。通过selectedIndex获得省份的下标值来得到相应的城市数组
			<%
				MenuBiz menuBiz = new MenuBiz();
				List menuList = menuBiz.getMenuList();
				String headString = "var city = [";
				String endString = "];" ;
				for(int i=0;i<menuList.size();i++){
					Menu menu=(Menu)menuList.get(i);
					List subMenuList = menuBiz.getSubMenuByMenuId(menu.getMenuId());
					String tmp ="[ ";
					for(int j=0;j<subMenuList.size();j++){
						if(j==subMenuList.size()-1){
							Submenu submenu = (Submenu)subMenuList.get(j);
							tmp += "\""+ submenu.getSubMenuName()+"\"";
						}else{
							Submenu submenu = (Submenu)subMenuList.get(j);
							tmp += "\""+ submenu.getSubMenuName()+"\",";
						}
						
					}
					tmp+=" ],";
					headString += tmp;
				}
				headString+= endString;
				out.println(headString);
			%>
// 			var city = [ [ "北京", "天津", "上海", "重庆" ],
// 					[ "南京", "苏州", "南通", "常州" ], [ "福州", "福安", "龙岩", "南平" ],
// 					[ "广州", "潮阳", "潮州", "澄海" ], [ "兰州", "白银", "定西", "敦煌" ] ];

			function getCity() {
				//获得省份下拉框的对象
				var sltProvince = document.getElementById('province');
				//获得城市下拉框的对象
				var sltCity = document.getElementById('city');

				//得到对应省份的城市数组
				var provinceCity = city[sltProvince.selectedIndex - 1];

				//清空城市下拉框，仅留提示选项
				sltCity.length = 1;

				//将城市数组中的值填充到城市下拉框中
				for ( var i = 0; i < provinceCity.length; i++) {
					sltCity[i + 1] = new Option(provinceCity[i],
							provinceCity[i]);
				}
			}
		</script>
	</HEAD></head>

<BODY>
		<FORM METHOD=POST ACTION="">
			<SELECT id="province" onChange="getCity()">
				<OPTION VALUE="0">
					请选择所在省份
				</OPTION>
				<%
					for(int i=0;i<menuList.size();i++){
						Menu menu = (Menu)menuList.get(i);
						%>
							<OPTION VALUE="<% out.print(menu.getMenuId());%>">
								<% out.print(menu.getMenuName());%>							
							</OPTION>
						<%
					}
				 %>
			</SELECT>
			<SELECT id="city">
				<OPTION VALUE="0">
					请选择所在城市
				</OPTION>
			</SELECT>
		</FORM>
	</BODY>
</html>
