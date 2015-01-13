package action;

import hibernate.Goods;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import Biz.GoodsBiz;
import form.GoodsdetailForm;


public class GoodsdetailAction extends Action {

	
	private GoodsBiz goodsbiz = new GoodsBiz();
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		try {
			
			
			  GoodsdetailForm gdf = (GoodsdetailForm)form;
			  
			  Goods goods = goodsbiz.getGoods(gdf.getGoodsId());
			  
			  
			  request.setAttribute("goods",goods);
			  
			
			  
		    } catch (Exception e) {
			  e.printStackTrace();
		      }
		return mapping.findForward("success");
	}
}
