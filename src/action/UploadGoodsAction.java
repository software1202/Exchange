package action;

import hibernate.Goods;
import hibernate.User;
import hibernate.UserDAO;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import sun.swing.FilePane;

import Biz.GoodsBiz;

import com.sun.faces.taglib.html_basic.InputSecretTag;

import form.UploadGoodsForm;


public class UploadGoodsAction extends Action{
	
	private GoodsBiz goodsbiz = new GoodsBiz();
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		try {
			HttpSession session = request.getSession();
			UploadGoodsForm upf = (UploadGoodsForm)form;
			FormFile image = upf.getImage();
			String goodsName = upf.getGoodsName();
			String brand = upf.getBrand();
			String dec = upf.getDescribe();
			String newd = upf.getNewDegree();
			
			String userId = (String)session.getAttribute("userId");
			System.out.println(userId+" "+goodsName+" "+brand+" "+dec+" "+newd);
			
			
			//存储图片
			//String realPath = this.getServlet().getServletContext().getRealPath("/ImgUpload");
			String realPath = "uploadimg";
			//String userId = session.getAttribute("userName").toString();
			//realPath = realPath + "/" + userId;
			File fpath = new File(realPath);
			if(!fpath.isDirectory()){
				 fpath.mkdirs();
			}
			//
		    String prefix=image.getFileName().substring(image.getFileName().lastIndexOf(".")+1);
			String imageName = (fpath.listFiles().length)+"."+ prefix;
			System.out.println(realPath+"/"+imageName);
			FileOutputStream foStream = new FileOutputStream(realPath+"/"+imageName);
			InputStream stream = image.getInputStream();
			int byteSRead =0;
			byte[] buffer = new byte[1024];
			while((byteSRead=stream.read(buffer,0,1024))!=-1){
				foStream.write(buffer,0,byteSRead);
				//System.out.println("----");
			}
			foStream.close();
			stream.close();
			image.destroy();
			
			//添加物品到数据库
			boolean tag =false;
			tag=goodsbiz.addGoods(userId,goodsName,"1234",brand,dec);
			if(tag){
				
				System.out.println("success");
			}
			else {
				
				System.out.println("false");
			}
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapping.findForward("success");
	}
}
