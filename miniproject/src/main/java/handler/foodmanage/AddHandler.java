package handler.foodmanage;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import categories.CategoriesService;
import foodlist.FoodListService;
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
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		
		
		
		
		FoodManageService service = new FoodManageService();
		FoodListService fservice = new FoodListService();
		CategoriesService catservice = new CategoriesService();
		TempService tempservice = new TempService();
		
		
		String id = (String)session.getAttribute("loginId");
		
		int red = fservice.ddayThree(id);
		int yellow = fservice.ddaySeven(id);
		int green = fservice.ddayetc(id);
		int[] dday = {red,yellow,green};
		
		
		String[] arringredient = request.getParameterValues("ing");
		
		String[] arrdate = request.getParameterValues("expiredate");
		int ddday = 0; 
		int amount = 100;
		String content = request.getParameter("content");
		
		session.setAttribute("dday", dday);
		
		
		for(int i = 0; i<arringredient.length;i++) {
			String ingredient = arringredient[i];
			int cat_num = catservice.getCat_num(ingredient);
			String date = arrdate[i];
			service.addFood(new FoodManageVo(0,id,ingredient,cat_num,null,null,ddday,amount,content,date));
		}
		
		
		tempservice.outByName(id);
		
		
		return 	"redirect:/foodlist/mylist.do" ;
	}

}
