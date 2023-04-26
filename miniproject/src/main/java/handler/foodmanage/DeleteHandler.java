package handler.foodmanage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;
import temp.TempService;
import temp.TempVo;

public class DeleteHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {

		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");		
		
		HttpSession session = request.getSession(false);
		String id = (String)session.getAttribute("loginId");
		String ingredient = request.getParameter("ingredient");
		int num = Integer.parseInt(request.getParameter("num"));
		
		TempService service = new TempService();
		ArrayList<TempVo> list = new ArrayList<>();
		service.outByNum(0);
		
		
		list.add(new TempVo(0,id,ingredient));
		
		request.setAttribute("list", list);
		
		
		
		return "/bang/detail.jsp";
		
	}

}
