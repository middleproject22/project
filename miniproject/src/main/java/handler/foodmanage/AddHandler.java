package handler.foodmanage;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import categories.CategoriesService;
import foodmanage.FoodManageService;
import foodmanage.FoodManageVo;
import handler.Handler;
import temp.TempService;

public class AddHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(false);
		FoodManageService service = new FoodManageService();
		CategoriesService catservice = new CategoriesService();
		TempService tempservice = new TempService();
		
		String id = (String)session.getAttribute("loginId");
		String[] arringredient = request.getParameterValues("ing");
		
		String[] arrdate = request.getParameterValues("expiredate");
		int dday = 0; 
		int amount = 100;
		String content = request.getParameter("content");
		
		for(int i = 0; i<arringredient.length;i++) {
			String ingredient = arringredient[i];
			int cat_num = catservice.getCat_num(ingredient);
			String date = arrdate[i];
			service.addFood(new FoodManageVo(0,id,ingredient,cat_num,null,null,dday,amount,content,date));
			System.out.println(id);
			System.out.println(ingredient);  
			System.out.println(cat_num);
			System.out.println(date);
			System.out.println(dday);
			System.out.println(amount);
			System.out.println(content);
		}
		
		
		tempservice.outByName(id);
		
		
		return 	"redirect:/foodlist/mylist.do" ;
	}

}
