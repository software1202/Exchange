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
	<%@ include file="common/top_main.jsp" %>

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
		
	<%@ include file="common/left.jsp" %>
	
	<%@ include file="common/footer.jsp" %>
	


</body>
</html>
