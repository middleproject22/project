package handler.foodlist;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import foodlist.FoodListService;
import foodmanage.FoodManageService;
import handler.Handler;

public class DeleteHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		//로그인 세션 확인 ${sessionScope.loginId}
				HttpSession session = request.getSession(false);
				String id = (String) session.getAttribute("loginId");

		int num = Integer.parseInt( request.getParameter("num"));
		FoodManageService service = new FoodManageService();
		service.deleteFood(num);
		
		FoodListService fservice = new FoodListService();
		int red = fservice.ddayThree(id);
		int yellow = fservice.ddaySeven(id);
		int green = fservice.ddayetc(id);
		int[] dday = {red,yellow,green};
		session.setAttribute("dday", dday);
		
		return "/foodlist/mylist.do";
	}

}
