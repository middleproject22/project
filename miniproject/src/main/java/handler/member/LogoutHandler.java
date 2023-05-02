package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;

public class LogoutHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		
		HttpSession session = request.getSession(false);
		session.invalidate();
		String view = "/mainindex/mainIndex.jsp";
		request.setAttribute("ck", "ck");
		request.setAttribute("msg", "로그아웃되었습니다.");
		
		return view;
	}

}
