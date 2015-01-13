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


//�������еĽ���Э������ݿ�ĸ���
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
		
		
		//ȷ���������Դ
		if(state.equals("10")){
			String flagTradeId = (String)session.getAttribute("flagTradeId");
			if(flagTradeId==null){
				//�û��뷢��һ��������Ҫ��Ʒid,����userId
				String goodsId = startExchangeForm.getGoodsId();
				String result = tradeBiz.addNewTrade(userId,goodsId);
				if(result.equals("103")){
					request.setAttribute("operator", "yes");
					return mapping.findForward("wantChange");
				}else if(result.equals("101")){
					//����Ʒ�ѱ�����
					request.setAttribute("addResult", "101");
				}else if(result.equals("102")){
					//���ܻ����Լ�����Ʒ
					request.setAttribute("addResult", "102");
				}
				request.setAttribute("goods", (new GoodsDAO()).findById(goodsId));
				return mapping.findForward("goodsDetail");
			}else{
				//�û���wanted���跢����
				String goodsId = startExchangeForm.getGoodsId();
				String result = tradeBiz.agreeExchange(flagTradeId, goodsId);
				System.out.println(result);//////////////////////////////////////////
				if(result.equals("103")){
					request.setAttribute("operator", "yes");
					session.removeAttribute("flagTradeId");
					return mapping.findForward("changeTalk");
				}else if(result.equals("101")){
					//����Ʒ�ѱ�����
					request.setAttribute("addResult", "101");
				}else if(result.equals("102")){
					//���ܻ����Լ�����Ʒ
					request.setAttribute("addResult", "102");
				}
				request.setAttribute("goods", (new GoodsDAO()).findById(goodsId));
				return mapping.findForward("goodsDetail");
				
			}
		}else if(state.equals("20")){
			//�û������뻻������ȡ��
			if(tradeBiz.deleteExchange(tradeId,userId)){
				request.setAttribute("operator", "yes");
				
			}else{
				request.setAttribute("operator", "no");
			}
			return mapping.findForward("wantChange");
		}else if(state.equals("30")){
			//�û��鿴һ�������û�����Ʒ,tradeId
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
			//�û��ܾ�һ�������û�����Ļ���
			if(tradeBiz.disagreeExchange(tradeId)){
				request.setAttribute("operator", "yes");
			}else{
				request.setAttribute("operator", "no");
			}
			return mapping.findForward("wantedChange");
		}else if(state.equals("32")){
			//�û����뻻�ҵ�����ɾ������
			if(tradeBiz.deleteExchange(tradeId,userId)){
				request.setAttribute("operator", "yes");
				return mapping.findForward("wantedChange");
			}else{
				request.setAttribute("operator", "no");
			}
			return mapping.findForward("wantedChange");
		}else if(state.equals("40")){
			//ȡ��
			if(tradeBiz.deleteExchange(tradeId,userId)){
				request.setAttribute("operator", "yes");
				
			}else{
				request.setAttribute("operator", "no");
			}
			return mapping.findForward("wantChange");
		}else if(state.equals("50")){
			//�û�ȷ���ջ�
		}
		
		
		return mapping.findForward("success");
	}
}
