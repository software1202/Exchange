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
                			<a class="a-float-left" href="#">注册</a>
            			<%
            		}else{
            			%>
            				
            				<div data-toggle="arrowdown" id="arrow3" class="user-name">
                    		<a href="#">个人空间</a>
                    		<span class="down-icon"></span>
                			</div>
                			<span class="vertical-line">|</span>
                			<a class="a-float-left" href="#">
            					<% out.print(userName); %>,欢迎您
            				</a>
            				<span class="vertical-line">|</span>
                			<a onclick=shezhi()>注销</a>
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
                    <li class="s_1"><h3>服装内衣<span class="fa fa-angle-right fa-loc"></span></h3></li>
                    <li class="s_2"><h3>鞋包配饰<span class="fa fa-angle-right fa-loc"></span></h3></li>
                    <li class="s_3"><h3>运动户外<span class="fa fa-angle-right fa-loc"></span></h3></li>
                    <li class="s_4"><h3>珠宝手表<span class="fa fa-angle-right fa-loc"></span></h3></li>
                    <li class="s_5"><h3>手机数码<span class="fa fa-angle-right fa-loc"></span></h3></li>
                    <li class="s_6"><h3>家电办公<span class="fa fa-angle-right fa-loc"></span></h3></li>
                    <li class="s_7"><h3>护肤彩妆<span class="fa fa-angle-right fa-loc"></span></h3>v</li>
                    <li class="s_8"><h3>母婴用品<span class="fa fa-angle-right fa-loc"></span></h3></li>
                    <li class="s_9"><h3>家纺居家<span class="fa fa-angle-right fa-loc"></span></h3></li>
                    <li class="s_10"><h3>家具建材<span class="fa fa-angle-right fa-loc"></span></h3></li>
                    <li class="s_11"><h3>美食特产<span class="fa fa-angle-right fa-loc"></span></h3></li>
                    <li class="s_12"><h3>日用百货<span class="fa fa-angle-right fa-loc"></span></h3></li>
                    <li class="s_13"><h3>汽车摩托<span class="fa fa-angle-right fa-loc"></span></h3></li>
                    <li class="s_14"><h3>文化娱乐<span class="fa fa-angle-right fa-loc"></span></h3></li>
                    <li class="s_15"><h3>本地生活<span class="fa fa-angle-right fa-loc"></span></h3></li>
                    <li class="s_16"><h3>虚拟服务<span class="fa fa-angle-right fa-loc"></span></h3></li>
                </ul>
                <!--hidden-li-box-->
                <ul class="hiden-box">
                    <li data-hidden="li" id="hiden-1">
                        <div class="hidden-title">
                            <a href="#">淘宝女人</a><span class="right-box"><i class="fa fa-angle-right"></i></span>
                            <a href="#">最in女装</a><span class="right-box"><i class="fa fa-angle-right"></i></span>
                            <a href="#">淘宝男人</a><span class="right-box"><i class="fa fa-angle-right"></i></span>
                            <a href="#">女人搭配</a><span class="right-box"><i class="fa fa-angle-right"></i></span>
                        </div>
                        <div class="sub-nav-right">
                            <div class="cell-box">
                                <h1>印记女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                    <a href="#">郑志山</a><span>|</span>
                                    <a href="#">毛衣</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">大地亏</a>
                                    <a href="#">半身全</a><span>|</span>
                                    <a href="#">风衣</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                    <a href="#">礼服</a><span>|</span>
                                    <a href="#">婚纱</a><span>|</span>
                                    <a href="#">大妈</a><span>|</span>
                                    <a href="#">Zara</a><span>|</span>
                                    <a href="#">挨个</a>
                                </div>
                            </div>
                            <div class="cell-box">
                                <h1>印记女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                    <a href="#">郑志山</a><span>|</span>
                                    <a href="#">毛衣</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">大地亏</a>
                                    <a href="#">半身全</a><span>|</span>
                                    <a href="#">风衣</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                    <a href="#">礼服</a><span>|</span>
                                    <a href="#">婚纱</a><span>|</span>
                                    <a href="#">大妈</a><span>|</span>
                                    <a href="#">Zara</a><span>|</span>
                                    <a href="#">挨个</a>
                                </div>
                            </div>
                            <div class="cell-box">
                                <h1>印记女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                    <a href="#">郑志山</a><span>|</span>
                                    <a href="#">毛衣</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">大地亏</a>
                                    <a href="#">半身全</a><span>|</span>
                                    <a href="#">风衣</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                    <a href="#">礼服</a><span>|</span>
                                    <a href="#">婚纱</a><span>|</span>
                                    <a href="#">大妈</a><span>|</span>
                                    <a href="#">Zara</a><span>|</span>
                                    <a href="#">挨个</a>
                                </div>
                            </div>
                        </div>
                        <div class="sub-nav-left">
                            <div class="cell-box">
                                <h1>印记女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                    <a href="#">郑志山</a><span>|</span>
                                    <a href="#">毛衣</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">大地亏</a>
                                    <a href="#">半身全</a><span>|</span>
                                    <a href="#">风衣</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                    <a href="#">礼服</a><span>|</span>
                                    <a href="#">婚纱</a><span>|</span>
                                    <a href="#">大妈</a><span>|</span>
                                    <a href="#">Zara</a><span>|</span>
                                    <a href="#">挨个</a>
                                </div>
                            </div>
                            <div class="cell-box">
                                <h1>印记女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                    <a href="#">郑志山</a><span>|</span>
                                    <a href="#">毛衣</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">大地亏</a>
                                    <a href="#">半身全</a><span>|</span>
                                    <a href="#">风衣</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                    <a href="#">礼服</a><span>|</span>
                                    <a href="#">婚纱</a><span>|</span>
                                    <a href="#">大妈</a><span>|</span>
                                    <a href="#">Zara</a><span>|</span>
                                    <a href="#">挨个</a>
                                </div>
                            </div>
                            <div class="cell-box">
                                <h1>印记女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                    <a href="#">郑志山</a><span>|</span>
                                    <a href="#">毛衣</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">大地亏</a>
                                    <a href="#">半身全</a><span>|</span>
                                    <a href="#">风衣</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                    <a href="#">礼服</a><span>|</span>
                                    <a href="#">婚纱</a><span>|</span>
                                    <a href="#">大妈</a><span>|</span>
                                    <a href="#">Zara</a><span>|</span>
                                    <a href="#">挨个</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li data-hidden="li" id="hiden-2">
                        <div class="hidden-title">
                            <a href="#">精品女鞋</a><span class="right-box"><i class="fa fa-angle-right"></i></span>
                            <a href="#">最in女装</a><span class="right-box"><i class="fa fa-angle-right"></i></span>
                            <a href="#">淘宝男人</a><span class="right-box"><i class="fa fa-angle-right"></i></span>
                            <a href="#">女人搭配</a><span class="right-box"><i class="fa fa-angle-right"></i></span>
                        </div>
                        <div class="sub-nav-right">
                            <div class="cell-box">
                                <h1>印记女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                    <a href="#">郑志山</a><span>|</span>
                                    <a href="#">毛衣</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">大地亏</a>
                                    <a href="#">半身全</a><span>|</span>
                                    <a href="#">风衣</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                    <a href="#">礼服</a><span>|</span>
                                    <a href="#">婚纱</a><span>|</span>
                                    <a href="#">大妈</a><span>|</span>
                                    <a href="#">Zara</a><span>|</span>
                                    <a href="#">挨个</a>
                                </div>
                            </div>
                            <div class="cell-box">
                                <h1>印记女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                    <a href="#">郑志山</a><span>|</span>
                                    <a href="#">毛衣</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">大地亏</a>
                                    <a href="#">半身全</a><span>|</span>
                                    <a href="#">风衣</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                    <a href="#">礼服</a><span>|</span>
                                    <a href="#">婚纱</a><span>|</span>
                                    <a href="#">大妈</a><span>|</span>
                                    <a href="#">Zara</a><span>|</span>
                                    <a href="#">挨个</a>
                                </div>
                            </div>
                            <div class="cell-box">
                                <h1>印记女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                    <a href="#">郑志山</a><span>|</span>
                                    <a href="#">毛衣</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">大地亏</a>
                                    <a href="#">半身全</a><span>|</span>
                                    <a href="#">风衣</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                    <a href="#">礼服</a><span>|</span>
                                    <a href="#">婚纱</a><span>|</span>
                                    <a href="#">大妈</a><span>|</span>
                                    <a href="#">Zara</a><span>|</span>
                                    <a href="#">挨个</a>
                                </div>
                            </div>
                        </div>
                        <div class="sub-nav-left">
                            <div class="cell-box">
                                <h1>印记女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                    <a href="#">郑志山</a><span>|</span>
                                    <a href="#">毛衣</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">大地亏</a>
                                    <a href="#">半身全</a><span>|</span>
                                    <a href="#">风衣</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                    <a href="#">礼服</a><span>|</span>
                                    <a href="#">婚纱</a><span>|</span>
                                    <a href="#">大妈</a><span>|</span>
                                    <a href="#">Zara</a><span>|</span>
                                    <a href="#">挨个</a>
                                </div>
                            </div>
                            <div class="cell-box">
                                <h1>印记女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                    <a href="#">郑志山</a><span>|</span>
                                    <a href="#">毛衣</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">大地亏</a>
                                    <a href="#">半身全</a><span>|</span>
                                    <a href="#">风衣</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                    <a href="#">礼服</a><span>|</span>
                                    <a href="#">婚纱</a><span>|</span>
                                    <a href="#">大妈</a><span>|</span>
                                    <a href="#">Zara</a><span>|</span>
                                    <a href="#">挨个</a>
                                </div>
                            </div>
                            <div class="cell-box">
                                <h1>印记女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                    <a href="#">郑志山</a><span>|</span>
                                    <a href="#">毛衣</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">大地亏</a>
                                    <a href="#">半身全</a><span>|</span>
                                    <a href="#">风衣</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                    <a href="#">礼服</a><span>|</span>
                                    <a href="#">婚纱</a><span>|</span>
                                    <a href="#">大妈</a><span>|</span>
                                    <a href="#">Zara</a><span>|</span>
                                    <a href="#">挨个</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    
                    <li data-hidden="li" id="hiden-16">
                        <div class="hidden-title">
                            <a href="#">淘宝女人</a><span class="right-box"><i class="fa fa-angle-right"></i></span>
                            <a href="#">最in女装</a><span class="right-box"><i class="fa fa-angle-right"></i></span>
                            <a href="#">淘宝男人</a><span class="right-box"><i class="fa fa-angle-right"></i></span>
                            <a href="#">女人搭配</a><span class="right-box"><i class="fa fa-angle-right"></i></span>
                        </div>
                        <div class="sub-nav-right">
                            <div class="cell-box">
                                <h1>印记女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                    <a href="#">郑志山</a><span>|</span>
                                    <a href="#">毛衣</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">大地亏</a>
                                    <a href="#">半身全</a><span>|</span>
                                    <a href="#">风衣</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                    <a href="#">礼服</a><span>|</span>
                                    <a href="#">婚纱</a><span>|</span>
                                    <a href="#">大妈</a><span>|</span>
                                    <a href="#">Zara</a><span>|</span>
                                    <a href="#">挨个</a>
                                </div>
                            </div>
                            <div class="cell-box">
                                <h1>印记女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                    <a href="#">郑志山</a><span>|</span>
                                    <a href="#">毛衣</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">大地亏</a>
                                    <a href="#">半身全</a><span>|</span>
                                    <a href="#">风衣</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                    <a href="#">礼服</a><span>|</span>
                                    <a href="#">婚纱</a><span>|</span>
                                    <a href="#">大妈</a><span>|</span>
                                    <a href="#">Zara</a><span>|</span>
                                    <a href="#">挨个</a>
                                </div>
                            </div>
                            <div class="cell-box">
                                <h1>印记女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                    <a href="#">郑志山</a><span>|</span>
                                    <a href="#">毛衣</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">大地亏</a>
                                    <a href="#">半身全</a><span>|</span>
                                    <a href="#">风衣</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                    <a href="#">礼服</a><span>|</span>
                                    <a href="#">婚纱</a><span>|</span>
                                    <a href="#">大妈</a><span>|</span>
                                    <a href="#">Zara</a><span>|</span>
                                    <a href="#">挨个</a>
                                </div>
                            </div>
                        </div>
                        <div class="sub-nav-left">
                            <div class="cell-box">
                                <h1>印记女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                    <a href="#">郑志山</a><span>|</span>
                                    <a href="#">毛衣</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">大地亏</a>
                                    <a href="#">半身全</a><span>|</span>
                                    <a href="#">风衣</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                    <a href="#">礼服</a><span>|</span>
                                    <a href="#">婚纱</a><span>|</span>
                                    <a href="#">大妈</a><span>|</span>
                                    <a href="#">Zara</a><span>|</span>
                                    <a href="#">挨个</a>
                                </div>
                            </div>
                            <div class="cell-box">
                                <h1>印记女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                    <a href="#">郑志山</a><span>|</span>
                                    <a href="#">毛衣</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">大地亏</a>
                                    <a href="#">半身全</a><span>|</span>
                                    <a href="#">风衣</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                    <a href="#">礼服</a><span>|</span>
                                    <a href="#">婚纱</a><span>|</span>
                                    <a href="#">大妈</a><span>|</span>
                                    <a href="#">Zara</a><span>|</span>
                                    <a href="#">挨个</a>
                                </div>
                            </div>
                            <div class="cell-box">
                                <h1>印记女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                    <a href="#">郑志山</a><span>|</span>
                                    <a href="#">毛衣</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">大地亏</a>
                                    <a href="#">半身全</a><span>|</span>
                                    <a href="#">风衣</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                    <a href="#">礼服</a><span>|</span>
                                    <a href="#">婚纱</a><span>|</span>
                                    <a href="#">大妈</a><span>|</span>
                                    <a href="#">Zara</a><span>|</span>
                                    <a href="#">挨个</a>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    
		<!--right-con-->
        <div class="right-con">
            <div class="nav">
                <a id="spe-a1" href="#">随便看看</a>
				<span class="line-a">|</span>
                <a id="spe-a2" href="#">最新</a>
				<span class="line-a">|</span>
                <a id="spe-a3" href="#">最热</a>
                <span class="line-a">|</span>
                <span class="keep-a" href="#"><a href="#">消费者保障</a></span>
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
            <!--right-sidbar-->
            <div class="right-sidebar">
                <div class="info-box">
                    <ul class="tab-nav">
                        <li id="li-1" class="li-nav li-nav-hover li-border">公告</li>
                        <li id="li-2" class="li-nav">规则</li>
                        <li id="li-3" class="li-nav">论坛</li>
                        <li id="li-4" class="li-nav">安全</li>
                        <li style="border-right: none" id="li-5" class="li-nav">公益</li>
                    </ul>
                    <div id="box-1" style="display: block" class="hiddenBox">

                        <a href="#">淘宝2014:开放多样性</a>
                        <a href="#">舌尖中国二季 天猫首尝</a>
                        <a href="#">阿里通信自建计费系统</a>
                        <a href="#">来往首届419宇宙节</a>
                    </div>
                    <div id="box-2" class="hiddenBox">

                        <a href="#">[重要] 淘点点规范</a>
                        <a href="#">[重要] 虚假交易新规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <a href="#">[重要] 新增认证规则</a>
                        <a href="#">[重要] 购买刀具实名</a>
                    </div>
                    <div id="box-3" class="hiddenBox">
                        <a href="#">[优化] 称谓滥用将整改</a>
                        <a href="#">[热点] 如何赢取新商机</a>
                        <a href="#">[话题] 同城交易避处罚</a>
                        <a href="#">[聚焦] 新消保法全解析</a>
                    </div>
                    <div id="box-4" class="hiddenBox">

                        <a href="#">个人重要信息要管牢！</a>
                        <a href="#">卖家防范红包欺诈提醒</a>
                        <a href="#">更换收货地址的陷阱！</a>
                        <a href="#">注意骗子的技术升级了</a>
                    </div>
                    <div id="box-5" class="hiddenBox">
                        <a href="#">[优化] 称谓滥用将整改</a>
                        <a href="#">[热点] 如何赢取新商机</a>
                        <a href="#">[话题] 同城交易避处罚</a>
                        <a href="#">[聚焦] 新消保法全解析</a>
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
            <a class="help-a" href="#">保障范围</a>
            <a class="help-a" href="#">退货退款流程</a>
            <a class="help-a" href="#">服务中心</a>
            <a class="help-a" href="#">更多特色服务</a>
        </div>
        <div class="help-info">
            <h1><img src="img/help1.png"><span class="help-text">新手上路</span></h1>
            <a class="help-a" href="#">新手专区</a>
            <a class="help-a" href="#">换享警示</a>
            <a class="help-a" href="#">换享安全</a>
            <a class="help-a margin-r" href="#">24小时在线帮助</a>
        </div>
        <div class="help-info">
            <h1><img src="img/help2.png"><span class="help-text">交易方式方式</span></h1>
            <a class="help-a-litter" href="#">线上支付</a>
            <a class="help-a-litter" href="#">线下支付</a>
        </div>
        <div class="help-info">
            <h1><img src="img/help3.png"><span class="help-text">换享网特色</span></h1>
            <a class="help-a" href="#">项目介绍</a>
        </div>
    </div>
	
	<!--footer-->
    <div class="footer">
        <div class="footer-right">
            <div class="footer-nav">
                <a href="#">湖南大学</a>|
                <a href="#">湖南大学信息科学与工程学院</a>
            </div>
            <div class="about-tao">
                <a href="#">关于我们</a>
                <a href="#">合作伙伴</a>
                <a href="#">营销中心</a>
                <a href="#">相关投诉</a>
                <a href="#">联系客服</a>
                <a href="#">联系我们</a>
                <a href="#">法律声明</a>
                <span class="gary-text">&copy; 2014 换享网 版权所有</span>
            </div>
            <p class="gary-text"><span>湖南大学</span>|<span>信息科学与工程学院</span>|<span>2014软件工程二班 第三组</span></p>
        </div>
		
		<!--换成我们的Logo-->
        <div class="tao-man">
            <img src="img/tao-man.png" />
        </div>
    </div>
	
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