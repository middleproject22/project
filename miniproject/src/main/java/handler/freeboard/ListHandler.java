package handler.freeboard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import freeboard.FreeBoardService;
import freeboard.FreeBoardVo;
import handler.Handler;

public class ListHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		FreeBoardService service = new FreeBoardService();
		ArrayList<FreeBoardVo> list = service.getAll();
		request.setAttribute("list", list);
		System.out.println(list);
		return "/freeboard/fb_list.jsp";
	}

}
