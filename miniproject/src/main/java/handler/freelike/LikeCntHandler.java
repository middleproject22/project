package handler.freelike;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeboard.FreeBoardService;
import freeboard.FreeBoardVo;
import freelike.FreeLikeService;
import freelike.FreeLikeVo;
import handler.Handler;

public class LikeCntHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
	    String view = "";
	    int num = Integer.parseInt(request.getParameter("num"));
	    FreeLikeService service = new FreeLikeService();
	    int likeCount = service.getLike(num);
	    request.setAttribute("likeCount", likeCount);
	    view = "/freeboard/fb_detail.jsp";
	    return view;

		
		
		}
	}
