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
		// 요청 처리에 사용할 req, res를 파람으로 받고, 결과페이지 경로를 리턴값으로 반환
		// TODO Auto-generated method stub
		 try {
				request.setCharacterEncoding("UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
				response.setCharacterEncoding("UTF-8");
		String view = "";
		if (request.getMethod().equals("GET")) {//request.getMethod(): 요청 방식(get/post)값 반환
			request.setAttribute("view", "/freeboard/fb_add.jsp");
			view = "/freeboard/fb_add.jsp";
		} else {
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");		
			FreeBoardService service = new FreeBoardService();
			service.addFreeBoard(new FreeBoardVo(0, id, null, title, content, 0,0,0));
			request.setAttribute("ck", "ck");
			FreeBoardVo vo = service.page();
			int fb_num = vo.getFb_num();
			System.out.println(fb_num);
			
			view = "/freeboard/fb_detail.do?fb_num="+fb_num;
		}
		return view;
	}

}
