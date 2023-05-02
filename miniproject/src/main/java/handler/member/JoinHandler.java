package handler.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Member.MemberService;
import Member.MemberVo;
import handler.Handler;


public class JoinHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		
		if(request.getMethod().equals("GET")) {
			view = "/member/join.jsp";
		
		
		}else {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String pnum = request.getParameter("pnum");
			String imgpath = null;
			int managenum = 0;	
			
			MemberService service = new MemberService();
			MemberVo vo = new MemberVo(id, pwd, name, email, pnum, imgpath, managenum);
			MemberVo ckvo = service.getByPnum(pnum);
			if(ckvo == null) {
			service.Join(vo);
			view = "redirect:/mainindex/mainIndex.jsp";
			}else {
				request.setAttribute("ck", "ck");
				view = "/member/join.jsp";
			}
		}
		return view;
	}

}
