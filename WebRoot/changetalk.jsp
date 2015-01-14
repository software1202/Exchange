<%@page import="Biz.TradeBiz"%>
<%@ page language="java" pageEncoding="UTF-8"import="java.util.*,hibernate.*" %>

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
    <title>交换协商</title>
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
			<font size=5><b>交换协商</b></font>
			<table class="bought-table" id="J_BoughtTable" data-spm="9">
				<colgroup>
					<col class="changeid">
					<col class="jiafang">
					<col class="yifang">
					<col class="changestarttime">
					<col class="changeway">

				</colgroup>
				<thead>
					<tr class="col-name">
						<th class="changeid">交换编号</th>
						<th class="jiafang">甲方</th>
						<th class="yifang">乙方</th>
						<th class="changestarttime">交换发起时间</th>
						<th class="changeway">交换状态</th>
						<th class="YON">是否交换</th>

					</tr>
		
				
				</thead>

				
				
				<%
					TradeBiz tradeBiz = new TradeBiz();
					List tradeList = tradeBiz.getChangeTalkTradeList(userId);
					//显示订单的地方， 获取数据
				    //List tradeList = (List)request.getAttribute("tradeList");
					if(tradeList!=null&&tradeList.size()!=0){
						%> 
							<tbody class="mainOrder830615123442932  success-order hover hover-finish-order">
						<%
						if(tradeList.size()%singlePageNum==0)
							pageNum = tradeList.size()/singlePageNum;
						else
						 	pageNum = tradeList.size()/singlePageNum+1;
						for(int i=(pageIndex-1)*singlePageNum;i<tradeList.size()&&i<(pageIndex)*singlePageNum;i++){
							Booking booking = (Booking)tradeList.get(i);
							User Auser = booking.getUserByAuserId();
							User Buser = booking.getUserByBuserId();
							Goods Agoods = booking.getGoodsByAgoods();
							Goods Bgoods = booking.getGoodsByBgoods();
							String tradeId = booking.getBookingId();
							
							String tradeBUserName = Buser.getUserNickName();
							tradeBUserName = new String(tradeBUserName.getBytes("ISO-8859-1"),"UTF-8");
							String tradeAUserName = Auser.getUserNickName();
							tradeAUserName = new String(tradeAUserName.getBytes("ISO-8859-1"),"UTF-8");
							String tradeBUserId = Buser.getUserId();
							String BuserStatus = booking.getBstatus();
							String AuserStatus = booking.getAstatus();
							
							String AgoodsImgPath = Agoods.getImage();
							String AgoodsId = Agoods.getGoodsId();
							String AgoodsName = Agoods.getGoodsName();
							
							String BgoodsImgPath = Bgoods.getImage();
							String BgoodsId = Bgoods.getGoodsId();
							String BgoodsName = Bgoods.getGoodsName();
							//BgoodsName = new String(BgoodsName.getBytes("latin1"),"UTF-8");
							
							String exstatus = booking.getExStatus();
							
							Date AapplyTime = booking.getAtime();
							
							
							%>
							<tr class="sep-row"></tr>
					<tr class="order-hd">
					<td class="column" colspan="1">
						
							<div class="summary">
								<span
									class="number last-item">&nbsp;&nbsp;&nbsp;&nbsp;<em><% out.print(tradeId); %></em>
								</span>
							</div>
						
					</td>
						<td class="column" colspan="1">
							<span class="g-u">	
							</span>
							<a target="_blank" class="shopname J_MakePoint" title="" ><%out.print(tradeAUserName); %></a>
						</td>

												<td class="column" colspan="1">
							<span class="g-u">	
							</span>
							<a target="_blank" class="shopname J_MakePoint" title="西方" ><%out.print(tradeBUserName); %></a>
						</td>
						<td class="column">
							<span class="ww-light ww-large" data-nick="西方" data-tnick="西方" data-display="inline" data-item="$bizOrder.itemID:830615123442932" data-point-url="http://gm.mmstat.com/listbought.1.13"><a href="" target="_blank" class="ww-inline ww-online" title="点此可以直接和卖家交流选好的宝贝，或相互交流网购体验，还支持语音视频噢。"></a></span>
						</td>
						<td class="last" colspan="2">
							
						</td>
					</tr>
   
   
					<tr id="item830615123442932" class="order-bd last     order-last">
						<td i class="promisemoney"><br></br></i>
						</td>
						<td class="baobei">
							<a target="_blank" hidefocus="true" title="查看宝贝详情" href="goodsdetail.do?goodsId=<%out.print(AgoodsId);%>"  >
								<img style="width:120px;height:100px" alt="查看宝贝详情" src="<%out.print(AgoodsImgPath);%>">
							</a>
							<div style="width:100%">
								<span>物品名称：<%out.print(AgoodsName); %></span>
							</div>
						</td>
						<td class="baobei">
							<a target="_blank" hidefocus="true" title="查看宝贝详情" href="goodsdetail.do?goodsId=<%out.print(BgoodsId);%>">
								<img style="width:120px;height:100px" alt="查看宝贝详情" src="<%out.print(BgoodsImgPath);%>">
							</a>
							<div style="width:100%">
								<span>物品名称：<%out.print(BgoodsName); %></span>
							</div>
						</td>

 

						<td class="amount" rowspan="1"><span class="dealtime"
									><% out.print(AapplyTime.toLocaleString()); %></span>
								</td>
 
 
						<td class="trade-status" rowspan="1"> 
							<%
								if(AuserStatus.equals("04")&&BuserStatus.equals("04")){
									if(exstatus.equals("00")){
										if(userId.equals(Auser.getUserId()))
											out.print("等待我方编辑交易信息");
										else{
											out.print("等待对方编辑交易信息");
										}
									}else if(exstatus.equals("01")){
										out.print("等待双方确认交易信息");
									}else if(exstatus.equals("02")){
										if(userId.equals(Auser.getUserId())){
											out.print("等待对方确认交易信息");
										}else{
											out.print("等待我方确认交易信息");
										}
									}else if(exstatus.equals("03")){
										if(userId.equals(Auser.getUserId())){
											out.print("等待我方确认交易信息");
										}else{
											out.print("等待对方确认交易信息");
										}
									}
								}else{
									if(userId.equals(Auser.getUserId())&&AuserStatus.equals("05")||(userId.equals(Buser.getUserId())&&BuserStatus.equals("05"))){
										out.print("我方已取消");
									}else if(userId.equals(Auser.getUserId())&&BuserStatus.equals("05")||(userId.equals(Buser.getUserId())&&AuserStatus.equals("05"))){
										out.print("对方已取消");
									}
								}
							 %>  
						</td>
						
						<td class="trade-operate" rowspan=" 1 ">
							<span class="skin-white">  </span>
							<%
							
							//未取消交易
							if(AuserStatus.equals("04")&&BuserStatus.equals("04")){
								if(exstatus.equals("00")){
									if(userId.equals(Auser.getUserId())){
									%>
										<a href="javascript:formSubmit('editTradeInformation<%out.print(i+"");%>')" class="J_Rebuy">编辑交易信息</a>
										<a href="javascript:formSubmit('stopExchange<%out.print(i+"");%>')" class="J_Rebuy">取消交易</a>
									<%
									}else{
									%>
										<a href="javascript:formSubmit('stopExchange<%out.print(i+"");%>')" class="J_Rebuy">取消交易</a>
									<%
									}
								}else if(exstatus.equals("01")){
									%>
										<a href="javascript:formSubmit('confirmTradeInformation<%out.print(i+"");%>')" class="J_Rebuy">确认交易信息</a>
										<a href="javascript:formSubmit('stopExchange<%out.print(i+"");%>')" class="J_Rebuy">取消交易</a>
									<%	
								}else if(exstatus.equals("02")){
									if(userId.equals(Auser.getUserId())){
										%>
										<a href="javascript:formSubmit('stopExchange<%out.print(i+"");%>')" class="J_Rebuy">取消交易</a>
										<%
									}else{
										%>
											<a href="javascript:formSubmit('confirmTradeInformation<%out.print(i+"");%>')" class="J_Rebuy">确认交易信息</a>
											<a href="javascript:formSubmit('stopExchange<%out.print(i+"");%>')" class="J_Rebuy">取消交易</a>
										<%
									}
								}else if(exstatus.equals("03")){
									if(userId.equals(Buser.getUserId())){
										%>
										<a href="javascript:formSubmit('stopExchange<%out.print(i+"");%>')" class="J_Rebuy">取消交易</a>
										<%
									}else{
										%>
											<a href="javascript:formSubmit('confirmTradeInformation<%out.print(i+"");%>')" class="J_Rebuy">确认交易信息</a>
											<a href="javascript:formSubmit('stopExchange<%out.print(i+"");%>')" class="J_Rebuy">取消交易</a>
										<%
									}
								}
							}else{
								%>
									<a href="javascript:formSubmit('stopExchange<%out.print(i+"");%>')" class="J_Rebuy">取消交易</a>
								<%
							}
							 %> 
						</td>
						<!--每一个订单的提交表单 -->
                				<form id="editTradeInformation<%out.print(i+"");%>" action="editTradeInformation.jsp" method="post">
                					<input type="hidden" name="tradeId" value="<%out.print(tradeId);%>">
                				</form>
                				<form id="confirmTradeInformation<%out.print(i+"");%>" action="confirmTradeInformation.jsp" method="post">
                					<input type="hidden" name="tradeId" value="<%out.print(tradeId);%>">
                					<input type="hidden" name="userId" value="<%out.print(userId);%>">
                				</form>
                				<!-- 取消交易 -->
                				<form id="stopExchange<%out.print(i+"");%>" action="startExchange.do" method="post">
                					<input type="hidden" name="state" value="40">
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
								<form id="pageNext" action="changetalk.jsp" method="post">
          							<input type="hidden" name="pageIndex" value="<%out.print(pageIndex+1);%>">
     							</form>
     							<form id="pagepre" action="changetalk.jsp" method="post">
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
							<tbody><tr><td style="font-size:20px;">对不起，您还没有换享其他小伙伴的宝贝,快去找找看吧！<td></tr></tbody>
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
