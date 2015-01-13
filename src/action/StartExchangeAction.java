package action;

import java.util.List;

import hibernate.GoodsDAO;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import Biz.GoodsBiz;
import Biz.TradeBiz;

import form.StartExchangeForm;


//处理所有的交换协议对数据库的更改
public class StartExchangeAction extends Action{
	
	private TradeBiz tradeBiz = new TradeBiz();
	
	private GoodsBiz goodsBiz = new GoodsBiz();
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String userId = (String)request.getSession().getAttribute("userId");
		if(userId==null){
			return mapping.findForward("noLogin");
		}
		
		
		StartExchangeForm startExchangeForm = (StartExchangeForm)form;
		HttpSession session = request.getSession();
		String state = startExchangeForm.getState();
		String tradeId = startExchangeForm.getTradeId();
		
		
		//确定请求的来源
		if(state.equals("10")){
			String flagTradeId = (String)session.getAttribute("flagTradeId");
			if(flagTradeId==null){
				//用户想发起一个换享，需要物品id,发起userId
				String goodsId = startExchangeForm.getGoodsId();
				String result = tradeBiz.addNewTrade(userId,goodsId);
				if(result.equals("103")){
					request.setAttribute("operator", "yes");
					return mapping.findForward("wantChange");
				}else if(result.equals("101")){
					//该物品已被换享
					request.setAttribute("addResult", "101");
				}else if(result.equals("102")){
					//不能换享自己的物品
					request.setAttribute("addResult", "102");
				}
				request.setAttribute("goods", (new GoodsDAO()).findById(goodsId));
				return mapping.findForward("goodsDetail");
			}else{
				//用户在wanted步骤发起换享
				String goodsId = startExchangeForm.getGoodsId();
				String result = tradeBiz.agreeExchange(flagTradeId, goodsId);
				System.out.println(result);//////////////////////////////////////////
				if(result.equals("103")){
					request.setAttribute("operator", "yes");
					session.removeAttribute("flagTradeId");
					return mapping.findForward("changeTalk");
				}else if(result.equals("101")){
					//该物品已被换享
					request.setAttribute("addResult", "101");
				}else if(result.equals("102")){
					//不能换享自己的物品
					request.setAttribute("addResult", "102");
				}
				request.setAttribute("goods", (new GoodsDAO()).findById(goodsId));
				return mapping.findForward("goodsDetail");
				
			}
		}else if(state.equals("20")){
			//用户在我想换的里面取消
			if(tradeBiz.deleteExchange(tradeId,userId)){
				request.setAttribute("operator", "yes");
				
			}else{
				request.setAttribute("operator", "no");
			}
			return mapping.findForward("wantChange");
		}else if(state.equals("30")){
			//用户查看一个其他用户的物品,tradeId
//			if(tradeBiz.agreeExchange(tradeId)){
//				request.setAttribute("operator", "yes");
//				
//			}else{
//				request.setAttribute("operator", "no");
//			}
//			return mapping.findForward("wantedChange");
			String userIdOfGoods = startExchangeForm.getUserIdOfGoods();
			List goodsList=goodsBiz.getUserAllGoods(userIdOfGoods);
			request.setAttribute("goodsList", goodsList);
			session.setAttribute("flagTradeId", tradeId);
			System.out.println("flagTradeId : yes");
			return mapping.findForward("showGoods");
		}else if(state.equals("31")){
			//用户拒绝一个其他用户发起的换享
			if(tradeBiz.disagreeExchange(tradeId)){
				request.setAttribute("operator", "yes");
			}else{
				request.setAttribute("operator", "no");
			}
			return mapping.findForward("wantedChange");
		}else if(state.equals("32")){
			//用户在想换我的里面删除交易
			if(tradeBiz.deleteExchange(tradeId,userId)){
				request.setAttribute("operator", "yes");
				return mapping.findForward("wantedChange");
			}else{
				request.setAttribute("operator", "no");
			}
			return mapping.findForward("wantedChange");
		}else if(state.equals("40")){
			//取消
			if(tradeBiz.deleteExchange(tradeId,userId)){
				request.setAttribute("operator", "yes");
				
			}else{
				request.setAttribute("operator", "no");
			}
			return mapping.findForward("wantChange");
		}else if(state.equals("50")){
			//用户确认收货
		}
		
		
		return mapping.findForward("success");
	}
}
