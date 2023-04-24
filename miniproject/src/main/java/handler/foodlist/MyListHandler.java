package handler.foodlist;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foodmanage.FoodManageService;
import foodmanage.FoodManageVo;
import handler.Handler;

public class MyListHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		FoodManageService service = new FoodManageService();
		ArrayList<FoodManageVo> list = service.getAll();
		request.setAttribute("list", list);
		request.setAttribute("view", "/foodlist/updatetoday.do");		
		return null;
	}

}
