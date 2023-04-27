package handler.freeboard;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeboard.FreeBoardService;
import freeboard.FreeBoardVo;
import handler.Handler;

public class EditHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			response.setCharacterEncoding("UTF-8");
	    String view = null;
	    if (request.getMethod().equals("GET")) {
	        int fb_num = Integer.parseInt(request.getParameter("fb_num"));
	        FreeBoardService service = new FreeBoardService();
	        FreeBoardVo vo = service.getFreeBoard(fb_num);

	        request.setAttribute("vo", vo);
	        view = "/freeboard/fb_edit.jsp";
	    } else if (request.getMethod().equals("POST")) {
	        int fb_num = Integer.parseInt(request.getParameter("fb_num"));
	        String title = request.getParameter("title");
	        String content = request.getParameter("content");

	        FreeBoardService service = new FreeBoardService();
	        service.editFreeBoard(new FreeBoardVo(fb_num, null, null, title, content, 0));
	        view = "redirect:/freeboard/fb_detail.do?fb_num=" + fb_num;
	    }
	    
	    return view;
	}
}