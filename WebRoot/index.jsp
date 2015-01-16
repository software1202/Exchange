<%@page import="hibernate.Submenu"%>
<%@page import="hibernate.Menu"%>
<%@page import="Biz.MenuBiz"%>
<%@page import="hibernate.Inform"%>
<%@page import="Biz.InformBiz"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>换享网</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <script language="javascript">
    	function shezhi(){
    		//alert("dfs");
    		document.getElementById("zhuxiao").submit();
    	}
    </script>
    
    
</head>
<body>
	<%
		if(request.getParameter("zhuxiao")!=null){
			session.removeAttribute("userId");
			session.removeAttribute("userName");
		}
	 %>
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
                			<a class="a-float-left" href="enroll.jsp">注册</a>
            			<%
            		}else{
            			%>
            				
            				<div data-toggle="arrowdown" id="arrow3" class="user-name">
                    			<a href="wantChange.do">个人空间</a>
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
        
        <!--scroll-top-->
        <div class="scroll-search">
            <div class="search-litter">
                <img class="scroll-logo" src="img/logo.png" />
                <!--scroll-search-->
                <div class="search-wrapper-scroll">
                    <div class="search-box-scroll">
                        <div data-toggle="arrowdown" id="arrow9" class="search-toggle-scroll">
                            	宝贝
                        </div>
                        <form action="searchGoods.do" method="get">
                        	<input name="keyWord" class="search-in-scroll" type="text" />
                        	<input type="submit" class="search-but-scroll" value="搜索">
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<!--top-main-->
    <div class="top-main">
        <img src="img/logo250.png" />
        <div class="search-wrapper">
            <div class="search-box">
                <div class="search-toggle">
                    	宝贝
                </div>
                <form action="searchGoods.do" method="get">
                     <input name="keyWord" class="search-in" type="text" />
                     <input type="submit" class="search-but" value="搜索">
                </form>
            </div>
        </div>
    </div>
	
	<!--content-top-->
    <div class="content-top">
        <!--sidebar-->
        <div class="sidebar">
            <h3>商品服务分类</h3>
            <!--sidebar-info-->
            <div class="sidebar-info">
                <ul class="side-li">
                	<%
                		MenuBiz menuBiz = new MenuBiz();
                		List menuList = menuBiz.getMenuList();
                		for(int i=0;i<menuList.size();i++){
                			hibernate.Menu menu = (hibernate.Menu)menuList.get(i);
                			%>
                				<li class="s_<%out.print((i+1));%>"><h3><%out.print(menu.getMenuName());%><span class="fa fa-angle-right fa-loc"></span></h3></li>
                			<%
                		}
                	 %>
                </ul>
                <!--hidden-li-box-->
                <ul class="hiden-box" >
                	<%
                		for(int i=0;i<menuList.size();i++){
                			%>
                	<li data-hidden="li" id="hiden-<%out.print(i+1);%>">
                        <div class="hidden-title">
                            
                        </div>
                        <div class="">
                            <div class="cell-box">
                                <div class="a-box">
                                	<%
                                		hibernate.Menu menu = (hibernate.Menu)menuList.get(i);
                                		List submenuList = menuBiz.getSubMenuByMenuId(menu.getMenuId());
                                		for(int j=0;j<submenuList.size();j++){
                                			Submenu submenu = (Submenu)submenuList.get(j);
                                			%>
                                				<a style="width:30px;" href="javascript:document.getElementById('searchByType<%out.print(submenu.getSubMenuId());%>').submit();"><%out.print(submenu.getSubMenuName()); %></a><span>|</span>
                                			<%
                                		}
                                		
                                	 %>
                                </div>
                            </div>
                        </div>
                        
                    </li>
                			<%
                		}
                	 %>
                    
                    
                    
                </ul>
            </div>
        </div>
    	<%
    		for(int i=0;i<menuList.size();i++){
    			hibernate.Menu menu = (hibernate.Menu)menuList.get(i);
                List submenuList = menuBiz.getSubMenuByMenuId(menu.getMenuId());
                for(int j=0;j<submenuList.size();j++){
                    Submenu submenu = (Submenu)submenuList.get(j);
                    %>
               
                        <form style="display:no" id="searchByType<%out.print(submenu.getSubMenuId());%>" action="searchGoods.do" method="get">
                        	<input type="hidden" name="type"  value="<%out.print(submenu.getSubMenuId());%>"/>
                        	<input type="hidden" name="keyWord"  value=""/>
                        </form>
                    <%
               }
    		}
    	 %>
		<!--right-con-->
        <div class="right-con">
            <div class="nav">
                <a id="spe-a1" href="#"></a>
				<span class="line-a">|</span>
                <a id="spe-a2" href="#"></a>
				<span class="line-a">|</span>
                <a id="spe-a3" href="#"></a>
                <span class="line-a">|</span>
                <span class="keep-a" href="#"><a href="#"></a></span>
            </div>
            <!--show-box-->
            <div class="show-box">
                <!--content-->
                <div class="content">
                    <ul class="imgBox">
                        <li><a href="show.jsp"><img src="img/indexShow1.jpg"></a></li>
                        <li><a href="#"><img src="img/indexShow2.jpg"></a></li>
                        <li><a href="#"><img src="img/indexShow3.jpg"></a></li>
                        <li><a href="#"><img src="img/indexShow4.jpg"></a></li>
                        <li><a href="#"><img src="img/indexShow2.jpg"></a></li>
                    </ul>
                    <div class="currentNum">
                        <span class="imgNum mark-color"></span>
                        <span class="imgNum"></span>
                        <span class="imgNum"></span>
                        <span class="imgNum"></span>
                        <span class="imgNum"></span>
                    </div>
                    <div class="control to-left"><i class="fa fa-angle-left"></i></div>
                    <div class="control to-right"><i class="fa fa-angle-right"></i></div>
                </div>
				<a style="float: left" href="#"><img src="img/indexBox1.jpg"></a>
				<a style="float: left;padding-left:50px" href="#"><img src="img/indexBox3.jpg"></a>
				<a style="float: left;padding-left:50px" href="#"><img src="img/indexBox4.jpg"></a>
            </div>
            <%
            	InformBiz informBiz = new InformBiz();
            	List informList1 = informBiz.getInformBytype("01");
            	List informList2 = informBiz.getInformBytype("02");
            	List informList3 = informBiz.getInformBytype("03");
            	List informList4 = informBiz.getInformBytype("04");
            	List informList5 = informBiz.getInformBytype("05");
             %>
            <!--right-sidbar-->
            <div class="right-sidebar">
                <div class="info-box">
                    <ul class="tab-nav">
                        <li id="li-1" class="li-nav li-nav-hover li-border">公告</li>
                        <li id="li-2" class="li-nav">规则</li>
                        <li id="li-3" class="li-nav">活动</li>
                        <li id="li-4" class="li-nav">提醒</li>
                        <li style="border-right: none" id="li-5" class="li-nav">其它</li>
                    </ul>
                    <div id="box-1" style="display: block" class="hiddenBox">
					<!-- 
                        <a href="#">淘宝2014:开放多样性</a>
                        <a href="#">舌尖中国二季 天猫首尝</a>
                        <a href="#">阿里通信自建计费系统</a>
                        <a href="#">来往首届419宇宙节</a>
                    -->
                    	<%
                    		for(int i=0;i<informList1.size()&&i<3;i++){
                    			Inform inform = (Inform)informList1.get(i);
                    			Date informDate = inform.getTime();
                    			%>
                    				<div style="margin-top:10px;">
                    					<div>
                    					<span><%out.print(inform.getContent()); %></span>
                    					</div>	
                    					<div style="margin-top:10px;margin-left:200px">
                    					<span><%out.print((informDate.getYear()+1900)+"-"+(informDate.getMonth()+1)+"-"+informDate.getDay()); %></span>
                    					</div>
                    				</div>
                    			<%
                    		}
                    	 %>
                    </div>
                    <div id="box-2" class="hiddenBox">

                        <%
                    		for(int i=0;i<informList2.size()&&i<3;i++){
                    			Inform inform = (Inform)informList2.get(i);
                    			Date informDate = inform.getTime();
                    			%>
                    				<div style="margin-top:10px;">
                    					<div>
                    					<span><%out.print(inform.getContent()); %></span>
                    					</div>	
                    					<div style="margin-top:10px;margin-left:200px">
                    					<span><%out.print((informDate.getYear()+1900)+"-"+(informDate.getMonth()+1)+"-"+informDate.getDay()); %></span>
                    					</div>
                    				</div>
                    			<%
                    		}
                    	 %>
                    </div>
                    <div id="box-3" class="hiddenBox">
                        <%
                    		for(int i=0;i<informList3.size()&&i<3;i++){
                    			Inform inform = (Inform)informList3.get(i);
                    			Date informDate = inform.getTime();
                    			%>
                    				<div style="margin-top:10px;">
                    					<div>
                    					<span><%out.print(inform.getContent()); %></span>
                    					</div>	
                    					<div style="margin-top:10px;margin-left:200px">
                    					<span><%out.print((informDate.getYear()+1900)+"-"+(informDate.getMonth()+1)+"-"+informDate.getDay()); %></span>
                    					</div>
                    				</div>
                    			<%
                    		}
                    	 %>
                    </div>
                    <div id="box-4" class="hiddenBox">

                        <%
                    		for(int i=0;i<informList4.size()&&i<3;i++){
                    			Inform inform = (Inform)informList4.get(i);
                    			Date informDate = inform.getTime();
                    			%>
                    				<div style="margin-top:10px;">
                    					<div>
                    					<span><%out.print(inform.getContent()); %></span>
                    					</div>	
                    					<div style="margin-top:10px;margin-left:200px">
                    					<span><%out.print((informDate.getYear()+1900)+"-"+(informDate.getMonth()+1)+"-"+informDate.getDay()); %></span>
                    					</div>
                    				</div>
                    			<%
                    		}
                    	 %>
                    </div>
                    <div id="box-5" class="hiddenBox">
                        <%
                    		for(int i=0;i<informList5.size()&&i<3;i++){
                    			Inform inform = (Inform)informList5.get(i);
                    			Date informDate = inform.getTime();
                    			%>
                    				<div style="margin-top:10px;">
                    					<div>
                    					<span><%out.print(inform.getContent()); %></span>
                    					</div>	
                    					<div style="margin-top:10px;margin-left:200px">
                    					<span><%out.print((informDate.getYear()+1900)+"-"+(informDate.getMonth()+1)+"-"+informDate.getDay()); %></span>
                    					</div>
                    				</div>
                    			<%
                    		}
                    	 %>
                    </div>
                </div>
            </div>
        </div>
	</div>
    <!--main-->

	<!--help-->
    <div class="help">
        <div class="help-info">
            <h1><img src="img/help4.png"><span class="help-text">消费者保障</span></h1>
            <a class="help-a" target="_blank" href="nomatter.jsp">保障范围</a>
            <a class="help-a" target="_blank" href="nomatter.jsp">退货退款流程</a>
            <a class="help-a" target="_blank" href="nomatter.jsp">服务中心</a>
            <a class="help-a" target="_blank" href="nomatter.jsp">更多特色服务</a>
        </div>
        <div class="help-info">
            <h1><img src="img/help1.png"><span class="help-text">新手上路</span></h1>
            <a class="help-a" target="_blank" href="nomatter.jsp">新手专区</a>
            <a class="help-a" target="_blank" href="nomatter.jsp">换享警示</a>
            <a class="help-a" target="_blank" href="nomatter.jsp">换享安全</a>
            <a class="help-a margin-r" target="_blank" href="nomatter.jsp">24小时在线帮助</a>
        </div>
        <div class="help-info">
            <h1><img src="img/help2.png"><span class="help-text">交易方式方式</span></h1>
            <a class="help-a-litter" target="_blank" href="nomatter.jsp">线上支付</a>
            <a class="help-a-litter" target="_blank" href="nomatter.jsp">线下支付</a>
        </div>
        <div class="help-info">
            <h1><img src="img/help3.png"><span class="help-text">换享网特色</span></h1>
            <a class="help-a" target="_blank" href="show.jsp">项目介绍</a>
        </div>
    </div>
	
	<%@ include file="common/footer.jsp" %>
	
	<!--backtoTop1-->
    <!--兼容所有现代浏览器同时包括 ie6/7/8/9 （ie6会有一点点抖动）-->
    <div class="backtoTop" id="backToTop1">
        <div id="backToTop-up" class="up-back"><i class="fa fa-angle-up"></i></div>
        <div id="backToTop-down" class="down-back"><i class="fa fa-angle-down"></i></div>
    </div>


    <script src="js/jquery_1.9.js"></script>
    <script src="js/main.js"></script>
    <script src="js/img-show.js"></script>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>