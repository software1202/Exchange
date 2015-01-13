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
    <meta charset="GDK">
    <title>想换我的</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
	
	<link rel="stylesheet" href="css/trade.css"/>
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
	
	<div class="bought-list">
			<font size=5><b>想换我的</b></font>
			<table class="bought-table" id="J_BoughtTable" data-spm="9">
				<colgroup>
					<col class="baobei">
					<col class="price">
					<col class="quantity">
					<col class="item-operate">
					<col class="amount">
					<col class="trade-status">
					<col class="trade-operate">
				</colgroup>
				<thead>
					<tr class="col-name">
						<th class="baobei">宝贝</th>
						<th class="price">对方ID</th>
						<th class="quantity">数量</th>
						<th class="item-operate">商品操作</th>
						<th class="amount">时间</th>
						<th class="trade-status">
							<div class="trade-status">
								<div id="ks-component1860" class="bf-select bf-menu-button bf-button" tabindex="0" role="button" title="" aria-describedby="" aria-expanded="false" aria-haspopup="true" style="width: 86px; height: 15px; -webkit-user-select: none;">
									<div id="ks-content-ks-component1860" class="bf-select-content bf-menu-button-content bf-button-content" style="-webkit-user-select: none;">
										交易状态
									</div>
									<div class="bf-select-dropdown bf-menu-button-dropdown bf-button-dropdown">
										<div class="bf-select-dropdown-inner bf-menu-button-dropdown-inner bf-button-dropdown-inner">
										</div>
									</div>
								</div>
							</div>
						</th>
						<th class="trade-operate">交易操作</th>
					</tr>
		
					<tr class="sep-row"><td colspan="9"></td></tr>	
				
				</thead>

				
				
				<%
					TradeBiz tradeBiz = new TradeBiz();
					//显示订单的地方， 获取数据
				    List tradeList = tradeBiz.getUserWantedTradeList(userId);
					if(tradeList!=null&&tradeList.size()!=0){
						%> 
							<tbody  class="mainOrder830615123442932  success-order hover hover-finish-order">
						<%
						if(tradeList.size()%singlePageNum==0)
							pageNum = tradeList.size()/singlePageNum;
						else
						 	pageNum = tradeList.size()/singlePageNum+1;
						for(int i=(pageIndex-1)*singlePageNum;i<tradeList.size()&&i<(pageIndex)*singlePageNum;i++){
							Booking booking = (Booking)tradeList.get(i);
							User Auser = booking.getUserByBuserId();
							User Buser = booking.getUserByAuserId();
							Goods Bgoods = booking.getGoodsByBgoods();
							String tradeId = booking.getBookingId();
							
							String tradeBUserName = Buser.getUserNickName();
							tradeBUserName = new String(tradeBUserName.getBytes("ISO-8859-1"),"UTF-8");
							String tradeBUserId = Buser.getUserId();
							
							String AuserStatus = booking.getBstatus();
							String BuserStatus = booking.getAstatus();
							
							String BgoodsImgPath = Bgoods.getImage();
							String BgoodsId = Bgoods.getGoodsId();
							String BgoodsName = Bgoods.getGoodsName();
							//BgoodsName = new String(BgoodsName.getBytes("latin1"),"UTF-8");
							
							Date AapplyTime = booking.getAtime();
							
							
							%>
							<tr class="sep-row">
								<td colspan="7"></td>
							</tr>
							<tr class="order-hd">
								<td class="first">
									<div class="summary">
										 <span
											class="number last-item">交换编号：<em><% out.print(tradeId); %></em>
										</span>
									</div>
								</td>
								<td class="column" colspan="2"><span class="g-u">
								</span> <a target="_blank" class="shopname J_MakePoint" title="东方"><b>对方姓名：</b><% out.print(tradeBUserName);%></a>
								</td>
								<td class="column"/>
								<td class="last" colspan="3"></td>
							</tr>

							<tr id="item830615123442932"
								class="order-bd last     order-last">
								<td class="baobei">
								<a target="_blank" hidefocus="true"
									title="查看宝贝详情" href="" class="pic J_MakePoint">
										<img style="width:200px;height:120px"alt="查看宝贝详情" src="<% out.print(BgoodsImgPath);%>"> </a>
									<div class="desc">
										<p class="baobei-name">
											<a target="_blank" href="" class="J_MakePoint"
												data-point-url="http://gm.mmstat.com/listbought.2.6">
												<%out.print(BgoodsName); %> </a>
										</p>

									</div>
								</td>

								<td class="price" title="98.39"><i class="special-num"><%out.print(tradeBUserId); %></i>
								</td>

								<td class="quantity" title="1"><i class="special-num">1</i>
								</td>

								<td class="item-operate">
									<a href="goodsdetail.do?goodsId=<%out.print(BgoodsId);%>">物品详情</a>
									<input type="hidden" id="pioneerRulesType" value="">
								</td>

								<td class="amount" rowspan="1"><span class="dealtime"
									><% out.print(AapplyTime.toLocaleString()); %></span>
								</td>

								<td class="trade-status" rowspan="1"><span> <%
									if(BuserStatus.equals("01")&&AuserStatus.equals("03")){
										out.print("等待我方答复");
									}else if(BuserStatus.equals("02")){
										out.print("对方已取消");
									}else if(AuserStatus.equals("02")){
										out.print("我方已拒绝");
									}
								 %></span>  
								</td>

								<td class="trade-operate" rowspan=" 1 "><span
									class="skin-white"> 
								</span>
								<%	
									if(BuserStatus.equals("01")&&AuserStatus.equals("03")){
									%>
										<a href="javascript:formSubmit('startExchangeYes<%out.print(i+"");%>')" class="J_Rebuy">选择对方物品</a>
										<a href="javascript:formSubmit('startExchangeNo<%out.print(i+"");%>')" class="J_Rebuy">拒绝换享</a>
									<%
									}else{
									%>
										<a href="javascript:formSubmit('startExchange<%out.print(i+"");%>')" class="J_Rebuy">删除</a>
									<%
									}
								%>
								
								
								</td>
								
								<!--每一个订单的提交表单 -->
                				<form id="startExchangeYes<%out.print(i+"");%>" action="startExchange.do" method="post">
                					<input type="hidden" name="state" value="30">
                					<input type="hidden" name="userIdOfGoods" value="<%out.print(Buser.getUserId());%>">
                					<input type="hidden" name="tradeId" value="<%out.print(tradeId);%>">
                				</form>
                				
                				<form id="startExchangeNo<%out.print(i+"");%>" action="startExchange.do" method="post">
                					<input type="hidden" name="state" value="31">
                					<input type="hidden" name="tradeId" value="<%out.print(tradeId);%>">
                				</form>
                			
                				<!--  删除交换 -->
                				<form id="startExchange<%out.print(i+"");%>" action="startExchange.do" method="post">
                					<input type="hidden" name="state" value="32">
                					<input type="hidden" name="tradeId" value="<%out.print(tradeId);%>">
                				</form>
							</tr>
							
							<%
						}
						%>
						</tbody> 
						<tfoot>
							<tr class="sep-row"><td colspan="7"></td></tr>
							<tr class="toolbar toolbar-bottom">
								<td colspan="7">
							
								<div class="paging-box paging-full" id="J_trade_pagenation">
								

								<div class="total">
									<a href="javascript:pageSub()" class="J_CombinPay J_MakePoint toolbtn" id="prv">上一页</a>
									<a href="javascript:pageAdd()" class="J_CombinAgentPay J_MakePoint toolbtn" id="next">下一页</a>
								</div>
								<div class="total">
									共<%out.print(pageNum); %> 页，
								</div>
								<div class="form">
									<span class="text">当前是第<%out.print(pageIndex); %> 页</span>
								</div>
								<form id="pageNext" action="wantChange.do" method="post">
          							<input type="hidden" name="pageIndex" value="<%out.print(pageIndex+1);%>">
     							</form>
     							<form id="pagepre" action="wantChange.do" method="post">
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
								</td>
							</tr>
						</tfoot>
					<%
					}else{
						%>
							<tbody><tr><td style="font-size:20px;">对不起，没有其他小伙伴换享您的宝贝,快去上传更多有趣的产品吧！<td></tr></tbody>
						<%
					}
				%>

			</table>

	</div><!--end bought-list-->

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
