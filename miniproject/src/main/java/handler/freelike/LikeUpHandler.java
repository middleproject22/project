package handler.freelike;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freelike.FreeLikeService;
import freelike.FreeLikeVo;
import handler.Handler;

public class LikeUpHandler implements Handler {

	FreeLikeService service = new FreeLikeService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
	    String view = "";
		
    try {
		request.setCharacterEncoding("UTF-8");
	} catch (UnsupportedEncodingException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
		response.setCharacterEncoding("UTF-8");
		int fb_num = Integer.parseInt(request.getParameter("fb_num"));
		String fl_id = request.getParameter("fl_id");
		System.out.println("fb_num : "+fb_num);
		System.out.println("fl_id : "+fl_id);
		
		
		
//		FreeLikeVo vo = new FreeLikeVo(fl_id,fb_num);
		FreeLikeVo vo  = service.getLikeByNum(fb_num, fl_id);
		FreeLikeVo getVo = new FreeLikeVo(fl_id,fb_num);
	
		
		System.out.println("1111111111111");
		if( vo == null ) {// VO = db에 있는값, db에 값이 없으면 추천
	
			System.out.println("3333333333333333");
			//해야될것 : 체크해서 없으면 등록 추천 업
			service.addLike(getVo);
		}
		else { // db에 값이 있으면 추천 
			//해야될것 : 체크해서 있으면 삭제 
			System.out.println("2222222");
			service.removeLike(getVo);
		}
		
		int likenum = service.getLike(fb_num);
		System.out.println("444얘는 무조건 찍히는 얘 정상적이라면 ");
		 view = "responsebody/"+likenum;
		return view;
		
	}
		
	}