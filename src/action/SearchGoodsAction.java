package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.SearchGoodsForm;

import Biz.GoodsBiz;

public class SearchGoodsAction extends Action{

	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		SearchGoodsForm searchGoodsForm = (SearchGoodsForm)form;
		String keyWord = searchGoodsForm.getKeyWord();
		String type = searchGoodsForm.getType();
		List goodsList;
		if(keyWord.equals("")){
			keyWord = new String(keyWord.getBytes("ISO-8859-1"),"UTF-8");
			GoodsBiz goodsBiz = new GoodsBiz();
			goodsList = goodsBiz.getGoodsListByKeyWord(keyWord);
		}else{
			GoodsBiz goodsBiz = new GoodsBiz();
			goodsList = goodsBiz.getGoodsListByType(type);
		}
		request.setAttribute("goodsList", goodsList);
		return mapping.findForward("success");
	}
}
