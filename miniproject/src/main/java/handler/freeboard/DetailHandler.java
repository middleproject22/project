package handler.freeboard;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.MemberService;
import Member.MemberVo;
import freeboard.FreeBoardService;
import freeboard.FreeBoardVo;
import freelike.FreeLikeService;
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
        HttpSession session = request.getSession(false);
        
        
        
        String id = (String)session.getAttribute("loginId");
        
        
        System.out.println(id);
        
        FreeBoardService service = new FreeBoardService();
        FreeLikeService likeservice = new FreeLikeService();
        MemberService mservice = new MemberService();
	    MemberVo mvo = mservice.getById(id);
	    System.out.println(mvo);
        int like=likeservice.getLike(fb_num);
        System.out.println("추천개수:"+like);
        FreeBoardVo vo = service.getFreeBoard(fb_num);
        service.cnt(fb_num);
        request.setAttribute("mvo", mvo);
        request.setAttribute("vo", vo);
        request.setAttribute("like", like);
        view = "/freeboard/fb_detail.jsp";
        
        return view;
    }
}