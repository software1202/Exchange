package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import Biz.TradeBiz;

import form.EditTradeInformationForm;

public class EditTradeInformationAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		EditTradeInformationForm informationForm = (EditTradeInformationForm)form;
		String tradeMoney = informationForm.getTradeMoney();
		String tradeWay = informationForm.getTradeWay();
		String tradeId = informationForm.getTradeId();
		TradeBiz tradeBiz = new TradeBiz();
		if(tradeBiz.editTradeInformation(tradeId, tradeWay, new Integer(tradeMoney))){
			return mapping.findForward("success");
		}else{
			return mapping.findForward("failed");
		}
	}
}
