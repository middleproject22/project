package handler.foodmanage;

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

		HttpSession session = request.getSession(false);
		FoodManageService service = new FoodManageService();
		CategoriesService catservice = new CategoriesService();
		TempService tempservice = new TempService();
		
		String id = (String)session.getAttribute("loginId");
		String ingredient = request.getParameter("ingredient");
		int cat_num = catservice.getCat_num(ingredient); 
		String date = request.getParameter("expiredate");
		int dday = 0; 
		int amount = 100;
		String content = request.getParameter("content");
		
		
//		System.out.println(id);
//		System.out.println(ingredient);  
//		System.out.println(cat_num);
//		System.out.println(date);
//		System.out.println(dday);
//		System.out.println(amount);
//		System.out.println(content);
		
		
		
		
		
		service.addFood(new FoodManageVo(0,id,ingredient,cat_num,null,null,dday,amount,content,date));
		
		
		
		
		
		
		tempservice.outByName(id);
		return 	"redirect:/foodlist/mylist.do" ;
	}

}
