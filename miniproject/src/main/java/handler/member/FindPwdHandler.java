package handler.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Member.MemberService;
import Member.MemberVo;
import handler.Handler;

public class FindPwdHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		String view = "/member/findAcc.jsp";
		String id = request.getParameter("id");
		String name =request.getParameter("name");
		String pnum = request.getParameter("pnum");
	
		
		MemberService service = new MemberService();
		MemberVo vo =  service.getById(id);
		
		if(id.equals(vo.getId()) &&  name.equals(vo.getName()) && pnum.equals(vo.getPhonenum())) {
			request.setAttribute("a",3);
			request.setAttribute("pwd", vo.getPwd());
			
		}else {
			request.setAttribute("a", 1);
			
		}
		return view;
	}

}
