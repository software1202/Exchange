package form;

import org.apache.struts.action.ActionForm;

public class SearchGoodsForm extends ActionForm{
	
	private String keyWord;

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
}
