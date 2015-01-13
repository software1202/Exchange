package form;

import org.apache.struts.action.ActionForm;

public class ConfirmTradeForm extends ActionForm{
	
	private String tradeId;
	
	private String userId;

	public String getTradeId() {
		return tradeId;
	}

	public void setTradeId(String tradeId) {
		this.tradeId = tradeId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
