package form;

import org.apache.struts.action.ActionForm;

public class SearchGoodsForm extends ActionForm{
	
	private String keyWord;
	
	private String type;

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
