package form;

import org.apache.struts.action.ActionForm;

public class StartExchangeForm extends ActionForm{

	private String state;
	
	private String tradeId;
	
	private String goodsId;
	
	private String userIdOfGoods;

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getTradeId() {
		return tradeId;
	}

	public void setTradeId(String tradeId) {
		this.tradeId = tradeId;
	}

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	
	public String getUserIdOfGoods() {
		return userIdOfGoods;
	}
	
	public void setUserIdOfGoods(String userIdOfGoods) {
		this.userIdOfGoods = userIdOfGoods;
	}

}
