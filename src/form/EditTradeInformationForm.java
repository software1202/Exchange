package form;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class EditTradeInformationForm extends ActionForm{
	
	private String tradeWay;
	
	private String tradeMoney;
	
	private String tradeId;
	
	public String getTradeId() {
		return tradeId;
	}

	public void setTradeId(String tradeId) {
		this.tradeId = tradeId;
	}

	public String getTradeWay() {
		return tradeWay;
	}

	public void setTradeWay(String tradeWay) {
		this.tradeWay = tradeWay;
	}

	public String getTradeMoney() {
		return tradeMoney;
	}

	public void setTradeMoney(String tradeMoney) {
		this.tradeMoney = tradeMoney;
	}

	
	
	
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		if(tradeMoney.equals("")){
			errors.add("noTradeMoney",new ActionMessage("noTradeMoneyError"));
			return errors;
		}
		try {
			BigDecimal money = new BigDecimal(tradeMoney);
			if(money.compareTo(new BigDecimal("0"))<0||tradeMoney.length()>8){
				errors.add("tradeMoneyFault",new ActionMessage("tradeMoneyFaultError"));
				return errors;
			}
		} catch (Exception e) {
			errors.add("tradeMoneyFault",new ActionMessage("tradeMoneyFaultError"));
			return errors;
		}
		//System.out.println(tradeWay);
		if(tradeWay==null||!(tradeWay.equals("01")||tradeWay.equals("02"))){
			errors.add("noTradeWay",new ActionMessage("noTradeWayError"));
			return errors;
		}
		return errors;
	}
}
