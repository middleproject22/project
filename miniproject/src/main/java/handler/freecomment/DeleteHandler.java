package handler.freecomment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freecomment.FreeCommentService;
import handler.Handler;

public class DeleteHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int fc_num = Integer.parseInt(request.getParameter("fc_num"));
		FreeCommentService service = new FreeCommentService();
		service.delFreeComment(fc_num);
		return "/freeboard/fb_list.do";
	}

}
