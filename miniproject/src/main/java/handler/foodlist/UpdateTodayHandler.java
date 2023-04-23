package handler.foodlist;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foodlist.FoodListService;
import handler.Handler;

public class UpdateTodayHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		FoodListService service = new FoodListService();
		service.updateToday();
		return null;
	}

}
