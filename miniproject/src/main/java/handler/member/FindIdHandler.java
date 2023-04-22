package handler.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Member.MemberService;
import Member.MemberVo;
import handler.Handler;

public class FindIdHandler implements Handler {

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
		
		String pnum = request.getParameter("pnum");
		String name = request.getParameter("name");
		MemberService service = new MemberService();
		MemberVo vo = service.getByPnum(pnum);
		String view ="";
		
		if(vo==null || !pnum.equals(vo.getPhonenum()) || !name.equals(vo.getName())) {
			request.setAttribute("a", 1);
			view ="/member/findAcc.jsp";
		}else if(pnum.equals(vo.getPhonenum())&& name.equals(vo.getName())) {
			request.setAttribute("id", vo.getId());
			request.setAttribute("a", 2);
			view = "/member/findAcc.jsp";
		}
		
			return view;
	}

}
