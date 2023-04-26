package handler.freeboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeboard.FreeBoardService;
import handler.Handler;

public class DeleteHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int fb_num = Integer.parseInt(request.getParameter("fb_num"));
		FreeBoardService service = new FreeBoardService();
		service.delFreeBoard(fb_num);
		return "/freeboard/fb_list.do";

	}

}
