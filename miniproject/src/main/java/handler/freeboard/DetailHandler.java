package handler.freeboard;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeboard.FreeBoardService;
import freeboard.FreeBoardVo;
import handler.Handler;

public class DetailHandler implements Handler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) {
        String view = "";
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        response.setCharacterEncoding("UTF-8");
        
        int fb_num = Integer.parseInt(request.getParameter("fb_num"));
        FreeBoardService service = new FreeBoardService();
        FreeBoardVo vo = service.getFreeBoard(fb_num);
        service.cnt(fb_num);
        request.setAttribute("vo", vo);
        view = "/freeboard/fb_detail.jsp";
        
        return view;
    }
}