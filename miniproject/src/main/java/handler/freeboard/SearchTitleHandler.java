package handler.freeboard;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeboard.FreeBoardService;
import freeboard.FreeBoardVo;
import handler.Handler;

public class SearchTitleHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		FreeBoardService service = new FreeBoardService();
		ArrayList<FreeBoardVo> list = service.getByTitle(title);
		System.out.println(title);
		request.setAttribute("list", list);
		System.out.println(list);
		return "/freeboard/fb_list.jsp";
	}

}
