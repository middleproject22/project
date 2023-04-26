package handler.foodlist;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foodlist.FoodListService;
import handler.Handler;

public class UpdateAmountHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int amount = Integer.parseInt(request.getParameter("amount"));
		int num = Integer.parseInt( request.getParameter("num"));
		FoodListService service = new FoodListService();
		service.updateAmount(amount,num);
		return "/foodlist/mylist.do?id=test";
		}
	

}
