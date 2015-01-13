<%@ page language="java" pageEncoding="UTF-8" import = "hibernate.*,javax.servlet.http.HttpServletRequest"%>

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
    <meta charset="GDK">
    <title>上传物品</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
	
	<link rel="stylesheet" href="css/trade.css"/>
	<link rel="stylesheet" href="css/global-min.css" type="text/css">
    <link rel="stylesheet" href="css/base.css" type="text/css" />
	<script type="text/javascript" src="js/deps.js"></script>
			
	<style type="text/css">
		.input_box{
			border: 1px solid #c1cde1;
			padding: 2px;
			width: 340px;
			font-size:15px;
		}
		.dec_box{
			border: 1px solid #c1cde1;
			padding: 2px;
			width: 340px;
			height:300px;
			font-size:15px;
		}
		.introduce_name{
			margin-right:12px;
			font-size:15px;
		}
		.inputTable{
			margin-left:180px;
			margin-top:60px;
		}
		.imgBox{
			width:300px;
			height:200px;
		}
		.form_label{
			margin-top:15px;
		}
		.btn{
		    margin-left:40%;
			background: #F22D00;
			cursor: pointer;
			height: 40px;
			border: 0;
			width: 100px;
		}
	</style>
	<script type="text/javascript">
function previewImage(file)
{
  var MAXWIDTH  = 340;
  var MAXHEIGHT = 210;
  var div = document.getElementById('preview');
  if (file.files && file.files[0])
  {
    div.innerHTML = '<img id=imghead>';
    var img = document.getElementById('imghead');
    img.onload = function(){
      var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
      img.width = rect.width;
      img.height = rect.height;
      img.style.marginLeft = rect.left+'px';
      img.style.marginTop = rect.top+'px';
    }
    var reader = new FileReader();
    reader.onload = function(evt){img.src = evt.target.result;}
    reader.readAsDataURL(file.files[0]);
  }
  else
  {
    var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
    file.select();
    var src = document.selection.createRange().text;
    div.innerHTML = '<img id=imghead>';
    var img = document.getElementById('imghead');
    img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
    var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
    status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
    div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;margin-left:"+rect.left+"px;"+sFilter+src+"\"'></div>";
  }
}
function clacImgZoomParam( maxWidth, maxHeight, width, height ){
    var param = {top:0, left:0, width:width, height:height};
    if( width>maxWidth || height>maxHeight )
    {
        rateWidth = width / maxWidth;
        rateHeight = height / maxHeight;
        if( rateWidth > rateHeight )
        {
            param.width =  maxWidth;
            param.height = Math.round(height / rateWidth);
        }else
        {
            param.width = Math.round(width / rateHeight);
            param.height = maxHeight;
        }
    }
    param.left = Math.round((maxWidth - param.width) / 2);
    param.top = Math.round((maxHeight - param.height) / 2);
    return param;
}
</script>
</head>
<body>
	<!--n-->
    <header class="mt-header">
    <article>
        <div class="mt-logo">
            <a title="换享网" href=""  ></a>
        </div>
        <nav class="mt-nav">
            <ul id="J_MtMainNav">
                <li>
                    <a href="project.html" >首页</a>
                    <i class="mt-arrow"></i>
                </li>
                <li class="selected">
                    <a href=""  target="_blank">个人主页</a>
                    <i class="mt-arrow"></i>
                </li> 
				<li>
                    <a href="" >账户设置</a>
                    <i class="mt-arrow"></i>
                </li>
                <li class="">
                    <a class="mt-nav-parent" href="" >消息</a>
                    <i class="mt-arrow"></i>
                </li>
            </ul> 
                <div class="search" id="J_Search" role="search">
                    <div class="search-panel search-sns-panel-field">
                        <form target="_blank" action="" name="search" id="J_TSearchForm" class="search-panel-focused">
                            <div class="search-button">
                                <button class="btn-search" type="submit">搜 索</button>
                            </div>
                            <div class="search-panel-fields">
                                <label for="q"></label>
                                <input id="q" name="q" accesskey="s" autofocus="true" autocomplete="off" x-webkit-speech=""
                                       x-webkit-grammar="builtin:translate">
                            </div>
                            <input type="hidden" name="commend" value="all">
                            <input type="hidden" name="ssid" value="s5-e" autocomplete="off">
                            <input type="hidden" name="search_type" value="mall" autocomplete="off">
                            <input type="hidden" name="sourceId" value="tb.index">
                            <input type="hidden" name="spm" value="a1z02.1.6856637.d4910789">
                            <!--[if lt IE 9]><s class="search-fix search-fix-panellt"></s><s class="search-fix search-fix-panellb"></s>
                            <![endif]-->
                        </form>
                    </div>
                </div>
        </nav>
    </article>
	</header>
	<!-- end vmcommon/mytaobao -->

<div id="layout-center" style="height:1000px">
    <div class="grid-c2">
        <div id="J_Col_Main" class="col-main">
            <div class="main-wrap">
                <div class="mt-ml-c1" >
					<!--薄膜，垫片-->
					<div class="mt-ml-shim"></div>
					<div id="wunai">
						<div id="main-content">
		
	<div class="bought-list">
	  <font size=5><b>上传物品</b></font>
	  <html:form action="/uploadGoods.do"
	  enctype="multipart/form-data" method="post"> 
	  <table class="inputTable">
	  	<tr style="height:220px;">
	  		<td>
	  		    <div id="preview">
    				<img  src="img/picture1.jpg" class="imgBox">
				</div>
	  		</td>
	  	</tr>
	  	<tr>
	  	  <td>
	  	  	<div class="form_label">
	  	  	  <label class="introduce_name">上传图片
              	<span class="req">*</span>：
              	(jpg,jpeg,png格式，不超过1M)
              </label>
            </div>
	  	</tr>
	  	<tr>
	  	  <td>
	  	  	 <div class="form_label">
	  	  	 <html:file property="image" onchange="previewImage(this)" style="border: 1px solid #c1cde1;padding: 3px;width: 340px;font-size:15px;"/>
	  	  	 </div>
	  	  </td>
	  	  <td style="width:200px">
	  	  	  <html:errors  property="noImage" />
	  	  </td>
	  	</tr>
	    <tr>
	      <td>
              <div class="form_label">
              	<label class="introduce_name">物品名称
              		<span class="req">*</span>:
              		（八个汉字以内）
              	</label>
              </div>
        	</td>
        </tr>
        <tr>
	      <td>
              <div class="form_label">
              	<%
              		String goodsName=(String)request.getAttribute("goodsName");
 					if(goodsName!=null){
 					 %>
 					 	<input type="text" class="input_box" name="goodsName" value="<%out.print(goodsName);%>"/><br/>   
 					 <%    
 					 }else{
 					 %>
 					 	<input type="text" class="input_box" name="goodsName" /><br/>   
 					 <% 
 					 }       
 		        %>
              	
              </div>
              
          </td>
          <td style="width:20px">
	  	  	  <html:errors  property="noGoodsName" />
	  	  </td>
        </tr>
        <tr>
          <td> 
              <div class="form_label">
              	<label class="introduce_name">类别
              		<span class="req">*</span>:
              	</label>
              </div>
          </td>
        </tr>
        <tr>
          <td> 
              <div class="form_label">
             <%
              		String brand=(String)request.getAttribute("brand");
 					if(brand!=null){
 					 %>
 					 	<input type="text" class="input_box" name="brand" value="<%out.print(brand);%>"/><br/>   
 					 <%    
 					 }else{
 					 %>
 					 	<input type="text" class="input_box" name="brand" /><br/>   
 					 <% 
 					 }       
               %>
              </div>
          </td>
          <td style="width:200px">
	  	  	  <html:errors  property="noBrand" />
	  	  </td>
        </tr>
         
        <tr>
          <td> 
              <div class="form_label">
              	<label class="introduce_name">描  述
              		<span class="req">*</span>:
              		（200字以内，如新旧程度，品牌，尺寸，价值，想换的物品等）
              	</label>
              </div>
          </td>
        </tr>
        <tr>
          <td> 
              <div class="form_label">
              <%
              		String description=(String)request.getAttribute("description");
                    if(description!=null){
                    %>
                      <input type="text" class="input_box" name="description" value="<%out.print(description);%>"/><br/>
                      <%
                    }
                    else
                    {
                    %>
                      <input type="text" class="input_box" name="description" /><br/> 
                      <%
                      }
               
              	%>
              </div>
          </td>
          <td style="width:200px">
	  	  	  <html:errors  property="noDec" />
	  	  </td>
        </tr>
        <tr>
        	<td>
        		<div class="form_label">
              	<input type="submit" class="btn" value ="上传"></submit>
              </div>
        		
        	</td>
        </tr>
       </table>
	</html:form>
	</div><!--end bought-list-->

	</div>
					</div>
				</div>
			</div>
		</div>
		<section id="J_Col_Sub" class="col-sub">
            <script type="text/javascript"> ___RecentVisitOn = true;  </script>
            		<aside class="mt-menu" id="J_MtSideMenu">
						<div class="mt-menu-tree">
							<dl class="mt-menu-item"  data-spm-max-idx="20">
								<dt class="fs14 mt-btn-go-setings" id="MTB_ItemsSetings">我的交换<span class="mt-menu-right-arr"><em></em></span></dt>
									<dd class="mt-menu-sub unfold fold J_MtSideTree">
										<a href="buy.html" >我想换的</a>
									</dd>
									<dd class="mt-menu-sub J_MtSideTree fold">
										<a href="sale.html">想换我的</a>
									</dd>
									<dd class="mt-menu-sub unfold fold J_MtSideTree">
										<a href="changetalk.html"  >交换协商</a>
									</dd>
									<dd class="mt-menu-sub unfold fold J_MtSideTree">
										<a href="exchange.html" >正在交换</a>
									</dd>
									<dt class="fs14 mt-btn-go-setings" id="MTB_ItemsSetings">我的关注<span class="mt-menu-right-arr"><em></em></span></dt>
									<dd class="mt-menu-sub unfold fold J_MtSideTree">
										<a href="attentionthing.html">关注物品</a>
									</dd>
									<dd class="mt-menu-sub J_MtSideTree fold">
										<a href=""  >关注用户</a>
									</dd>
								<dt class="fs14 mt-btn-go-setings" id="MTB_ItemsSetings">物品管理<span class="mt-menu-right-arr"><em></em></span></dt>
									<dd class="mt-menu-sub unfold fold J_MtSideTree">
										<a href="uploadthing.html" >上传物品</a>
									</dd>
									<dd class="mt-menu-sub J_MtSideTree fold">
										<a href="uploadrecord.html"  >上传记录</a>
									</dd>
								<dt class="fs14 mt-btn-go-setings" id="MTB_ItemsSetings">我的信息<span class="mt-menu-right-arr"><em></em></span></dt>
									
									<dd class="mt-menu-sub J_MtSideTree fold">
										<a href="gerenxinxi.html"  >个人信息</a>
									</dd>
									<dd class="mt-menu-sub unfold fold J_MtSideTree">
										<a href="password.html">修改密码</a>
									</dd>
									<dd class="mt-menu-sub unfold fold J_MtSideTree">
										<a href="renzheng.html">信息认证</a>
									</dd>
									<dd class="mt-menu-sub unfold fold J_MtSideTree">
										<a href="grademx.html">积分历史</a>
									</dd>
									<dd class="mt-menu-sub unfold fold J_MtSideTree">
										<a href=""  >修改收货地址</a>
									</dd>
									<dd class="mt-menu-sub unfold fold J_MtSideTree">
										<a href=""  >余额信息</a>
									</dd>
									<dd class="mt-menu-sub unfold fold J_MtSideTree">
										<a href=""  >留言信息</a>
									</dd>
									<dd class="mt-menu-sub unfold fold J_MtSideTree">
										<a href="webimformation.html">站内消息</a>
									</dd>
									<dd class="mt-menu-sub unfold fold J_MtSideTree">
										<a href="exchange records.html">交换记录</a>
									</dd>
									<dd class="mt-menu-sub unfold fold J_MtSideTree">
										<a href="complain.html">投诉</a>
									</dd>
							</dl>
						</div>
					</aside> 
		</section>
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
	


</body>
</html>
