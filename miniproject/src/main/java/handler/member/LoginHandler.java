package handler.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.MemberService;
import Member.MemberVo;
import foodlist.FoodListService;
import handler.Handler;

public class LoginHandler implements Handler {

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
			view = "/member/login.jsp";
		}else {
			String id = request.getParameter("id");
			String pwd =request.getParameter("pwd");
			
			MemberService service = new MemberService();
			FoodListService fservice = new FoodListService();
			int red = fservice.ddayThree(id);
			int yellow = fservice.ddaySeven(id);
			int green = fservice.ddayetc(id);
			int[] dday = {red,yellow,green};
			MemberVo vo = service.getById(id);
			
			if( vo !=null && pwd.equals(vo.getPwd())) {
				HttpSession session = request.getSession();
				if(vo.getManagenum()==1) {
					session.setAttribute("loginId", id);
					session.setAttribute("manager", "manager");
					session.setAttribute("img", vo.getImgpath());
					session.setAttribute("dday", dday);
					view = "/mainindex/mainIndex.jsp";
					request.setAttribute("ck", "ck");
					request.setAttribute("msg", "로그인되었습니다.");
				}else {
					session.setAttribute("loginId", id);
					session.setAttribute("img", vo.getImgpath());
					session.setAttribute("dday", dday);
					view = "/mainindex/mainIndex.jsp";
					request.setAttribute("ck", "ck");
					request.setAttribute("msg", "로그인되었습니다.");
				}
			}else {
				request.setAttribute("ck", "ck");
				request.setAttribute("msg", "아이디 혹은 비밀번호가 일치하지 않습니다.");
				view = "/member/login.jsp";
			}
		}
		
		
		return view;
	}

}
