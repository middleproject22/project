package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.MemberService;
import handler.Handler;

public class OutHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view ="redirect:/mainindex/mainIndex.do";
		
		HttpSession session = request.getSession(false);
		String id = (String)session.getAttribute("loginId");
		
		MemberService service = new MemberService();
		service.memberOut(id);
		session.invalidate();
		
		return view;
	}

}
