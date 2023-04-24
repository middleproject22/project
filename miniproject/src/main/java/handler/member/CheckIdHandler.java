package handler.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import Member.MemberService;
import Member.MemberVo;
import handler.Handler;

public class CheckIdHandler implements Handler {

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
		
		String id = request.getParameter("id");
		String txt="";
		System.out.println(id);
		MemberService service = new MemberService();
		MemberVo vo = service.getById(id);
		System.out.println(vo);
		if(id == "") {
			String flag = "insertid"; 
			JSONObject obj = new JSONObject();
			obj.put("flag", flag);
			System.out.println(flag);
			 txt = obj.toJSONString();
		}else {
		boolean flag = (vo==null);
		JSONObject obj = new JSONObject();
		obj.put("flag", flag);
		System.out.println(flag);
		 txt = obj.toJSONString();
		}
		
		return "responsebody/" + txt;
	}

}
