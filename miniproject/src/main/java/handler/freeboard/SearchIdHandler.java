package handler.freeboard;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeboard.FreeBoardService;
import freeboard.FreeBoardVo;
import handler.Handler;

public class SearchIdHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		 try {
				request.setCharacterEncoding("UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		// TODO Auto-generated method stub
		String id = request.getParameter("id");		
		FreeBoardService service = new FreeBoardService();
		ArrayList<FreeBoardVo> list = service.getById(id);
		request.setAttribute("list", list);
		System.out.println(list);
		return "/freeboard/fb_list.jsp";
	}
	
}
				
