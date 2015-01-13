package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import Biz.TradeBiz;

import form.ConfirmTradeForm;

public class ConfirmTradeAction extends Action{
		
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ConfirmTradeForm confirmTradeForm = (ConfirmTradeForm)form;
		String userId = confirmTradeForm.getUserId();
		String tradeId = confirmTradeForm.getTradeId();
		TradeBiz tradeBiz = new TradeBiz();
		String result = tradeBiz.confirmTrade(tradeId, userId);
		if(result.equals("101")||result.equals("102")){
			return mapping.findForward("changetalk");
		}else if(result.equals("103")){
			return mapping.findForward("exchanging");
		}else{
			return mapping.findForward("failed");
		}
	}
}
