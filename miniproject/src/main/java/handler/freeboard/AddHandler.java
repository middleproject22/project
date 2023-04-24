package handler.freeboard;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeboard.FreeBoardService;
import freeboard.FreeBoardVo;
import handler.Handler;

public class AddHandler implements Handler {

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
			view = "/freeboard/add.jsp";
		
		}else {
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			
			FreeBoardVo vo = new FreeBoardVo(0, id, null, title, content, 0, 0, 0);
			FreeBoardService service = new FreeBoardService();
			service.addFreeBoard(vo);
			
			view = "redirect:/freeboard/detail.do";
		}
		return view;
	}

}