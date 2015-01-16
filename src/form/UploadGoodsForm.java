package form;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;


public class UploadGoodsForm extends ActionForm{
	private FormFile image;
	private String goodsName;
	private String brand;
	private String userId;
	private String goodsDec;
	private String submenuName;
	private String submenuId;
	private String NewDegree;
	private String goodsId;
	
	
	
	public FormFile getImage() {
		return image;
	}



	public void setImage(FormFile image) {
		this.image = image;
	}



	public String getGoodsName() {
		return goodsName;
	}



	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}



	public String getBrand() {
		return brand;
	}



	public void setBrand(String brand) {
		this.brand = brand;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getGoodsDec() {
		return goodsDec;
	}



	public void setGoodsDec(String goodsDec) {
		this.goodsDec = goodsDec;
	}



	public String getSubmenuName() {
		return submenuName;
	}



	public void setSubmenuName(String submenuName) {
		this.submenuName = submenuName;
	}



	public String getSubmenuId() {
		return submenuId;
	}



	public void setSubmenuId(String submenuId) {
		this.submenuId = submenuId;
	}



	public String getNewDegree() {
		return NewDegree;
	}



	public void setNewDegree(String newDegree) {
		NewDegree = newDegree;
	}



	public String getGoodsId() {
		return goodsId;
	}



	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}



	@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		try {
			goodsName = new String(goodsName.getBytes("ISO-8859-1"),"UTF-8");
			//describe = new String(describe.getBytes("ISO-8859-1"),"UTF-8");
			//NewDegree = new String(NewDegree.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ActionErrors errors = new ActionErrors();
		if(image==null){
			errors.add("noImage",new ActionMessage("noImageError"));
			return errors;
		}
		if(goodsName.equals("")){
			
			errors.add("noGoodsName",new ActionMessage("noGoodsNameError"));
			return errors;
		}
		request.setAttribute("GoodsName", goodsName);
		//if(brand.equals("")){
		//	errors.add("noBrand",new ActionMessage("noBrandError"));
		//	return errors;
		//}
		//request.setAttribute("Brand", brand);
//		if(describe.equals("")){
//			errors.add("noDec",new ActionMessage("noDecError"));
//			return errors;
//		}
		request.setAttribute("Describe", goodsDec);
		return errors;
	}
}
