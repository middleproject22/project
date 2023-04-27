package handler.recipelist;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import foodlist.FoodListService;
import foodmanage.FoodManageVo;
import handler.Handler;

public class ListHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("loginId");
		System.out.println(id);
		FoodListService service = new FoodListService();
		
		service.checkDate(id);
		ArrayList<FoodManageVo> list = service.getbyId(id);
		request.setAttribute("list", list);
		System.out.println(list);
		return "/recipelist/mylist.jsp";
	}

}
