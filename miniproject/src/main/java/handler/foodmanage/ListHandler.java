package handler.foodmanage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import categories.CategoriesService;
import categories.CategoriesVo;
import handler.Handler;
import temp.TempService;
import temp.TempVo;

public class ListHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession(false);
		
		String id = (String)session.getAttribute("loginId");
		
		CategoriesService service = new CategoriesService();
		
		ArrayList<CategoriesVo> list =service.getCategories();
		request.setAttribute("list", list);
		TempService service2 = new TempService();
		ArrayList<TempVo> list2 = service2.getTempByName(id);
		int num = service2.getCnt(id);
		
		request.setAttribute("temp", list2);
		request.setAttribute("cntnum", num);
		
		
		return "/foodmanage/list.jsp" ;
	}

}
