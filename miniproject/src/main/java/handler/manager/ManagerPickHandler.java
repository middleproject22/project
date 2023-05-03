package handler.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;

public class ManagerPickHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
		if(request.getMethod().equals("GET")) {
			
			view = "/recipe/managerpick.jsp";
			
		}
		
		return view;
	}

}
