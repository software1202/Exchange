<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="hibernate.*,javax.servlet.http.HttpServletRequest;"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<link rel="stylesheet" href="css/2.css" />

<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/global-min.css" type="text/css">
<link rel="stylesheet" href="css/base.css" type="text/css" />

<title>物品展示页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<%
  		List goodsList = (List)request.getAttribute("goodsList");
  		if(goodsList==null){
  			%>
  				  <jsp:forward page="error.jsp" />
  			<%
  		}
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
				<a class="a-float-left" href="login.jsp">登陆</a> <span
					class="vertical-line">|</span> <a class="a-float-left" href="#">注册</a>
				<%
            		}else{
            			%>

				<div data-toggle="arrowdown" id="arrow3" class="user-name">
					<a href="#">个人空间</a> <span class="down-icon"></span>
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
						<li><a href="wantChange.do">我想换的</a>
						</li>
						<li><a href="wantedChange.jsp">想换我的</a>
						</li>
						<li><a href="changetalk.jsp">正在协商</a>
						</li>
						<li><a href="exchanging.jsp">正在交换</a>
						</li>
						<li><a href="uploadGoods.jsp">上传物品</a>
						</li>
					</ul>
				</div>
				<%
            		}
            	 %>

			</div>
		</div>


	</div>
	<!--top-main-->
	<div style="height:40px;"></div>

	<div style="margin-left:100px">
		<img src="img/logo250.png">
	</div>

	<div id="page" class=" newsrp  s-page-wrapper">
		<div class="tb-container ">
			<div class="tb-wrapper">
				<div class="tb-wrapper-main">
					<div style="margin-left:100px;">
						<div class="row grid-view newsrp-gridcontent-el">
						
						<%
						if(goodsList.size()!=0){
							for(int i=0;i<goodsList.size();i++){
								Goods goods = (Goods)goodsList.get(i);	
							%>
							<!-- 商品部分 -->
							<div class="col item">
								<div class="item-box st-itembox">
									<div class="pic c-f-a-touch-tgr" >
										<p class="pic-box">
											<a href="goodsdetail.do?goodsId=<%out.print(goods.getGoodsId());%>" target="_blank" class="s220"> 
											<span style="position: relative;">
											<img src="uploadimg/hand.jpg" style="height:95%;width:95%"> </span>
											</a>
										</p>
									</div>
									<h3 class="summary">
										<p>物品名称: <a href="goodsdetail.do?goodsId=<%out.print(goods.getGoodsId());%>" target="_blank" title="物品名称" >
											<% out.print(goods.getGoodsName()); %>
										</a></p>
										
									</h3>

									<div class="row">
										<div class="col end loc">  </div>
									</div>

								</div>
							</div>
							<%
							}
						}else{
							%>
							<div style="margin-top:80px;margin-bottom:300px;">
								<h2>对不起，没有找到符合您的搜索要求的物品</h2>
							</div>
							<%
						}
						%>
							
							
							
							

						</div>

					</div>
				</div>
			</div>
		</div>


	</div>

	<%@ include file="common/footer.jsp"%>


	<script src="js/jquery_1.9.js"></script>
	<script src="js/main.js"></script>
	<script src="js/img-show.js"></script>
</body>

</html>
