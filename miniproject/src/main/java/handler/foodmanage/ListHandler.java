package handler.foodmanage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import categories.CategoriesService;
import categories.CategoriesVo;
import handler.Handler;

public class ListHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		CategoriesService service = new CategoriesService();
		
		ArrayList<CategoriesVo> list =service.getCategories();
		request.setAttribute("list", list);
		
		
		
		
		return "/bang/list.jsp" ;
	}

}
