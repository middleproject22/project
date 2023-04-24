package handler.foodlist;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foodlist.FoodListService;
import foodmanage.FoodManageVo;
import handler.Handler;

public class CategoryHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int cat_num=Integer.parseInt( request.getParameter("cat_num"));
		FoodListService service = new FoodListService();
		ArrayList<FoodManageVo> list = service.getByCategories(cat_num);
		request.setAttribute("list", list);
		request.setAttribute("view", "/foodlist/mylist.jsp");		
		return null;
	}

}
