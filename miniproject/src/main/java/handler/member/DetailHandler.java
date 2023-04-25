package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.MemberService;
import Member.MemberVo;
import handler.Handler;

public class DetailHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("loginId");
		if(request.getMethod().equals("GET")) {
			MemberService service = new MemberService();
			MemberVo vo = service.getById(id);
			request.setAttribute("vo", vo);
			
			view = "/member/detail.jsp";
			
		}else{
			String pwd = request.getParameter("pwd");
			MemberService service= new MemberService();
			service.updatePwd(pwd, id);
			
			request.setAttribute("ck","ck");
			view = "redirect:/member/detail.do";
			
		}
		
		return view;
		
	}

}
