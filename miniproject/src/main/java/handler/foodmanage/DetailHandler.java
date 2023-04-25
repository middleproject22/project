package handler.foodmanage;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import temp.TempService;
import temp.TempVo;

public class DetailHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		TempService service = new TempService();
		ArrayList<TempVo> list = service.getTemp();
		request.setAttribute("list", list);
		
		return "/bang/detail.jsp";
	}

}
