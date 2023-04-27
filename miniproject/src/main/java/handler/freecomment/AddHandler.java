package handler.freecomment;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import freecomment.FreeCommentService;
import freecomment.FreeCommentVo;
import handler.Handler;

public class AddHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
    try {
		request.setCharacterEncoding("UTF-8");
	} catch (UnsupportedEncodingException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
		response.setCharacterEncoding("UTF-8");
    String view = "";
    FreeCommentService service = new FreeCommentService();

	if(request.getMethod().equals("GET")){
			int fb_num = Integer.parseInt(request.getParameter("fb_num"));
			System.out.println(fb_num);
			ArrayList<FreeCommentVo> list = service.getCommentBoard(fb_num);
			System.out.println(list);
			JSONArray arr = new JSONArray();
			for(int i = 0; i<list.size();i++) {
				JSONObject obj = new JSONObject();
				obj.put("fc_num", list.get(i).getFc_num());
		        obj.put("fc_id", list.get(i).getFc_id());
		        obj.put("fb_num", list.get(i).getFb_num());
		        obj.put("fc_content", list.get(i).getFc_content());
		        obj.put("date", list.get(i).getFc_date()+"");
		       arr.add(obj);
			}
			String txt = arr.toJSONString();// json 객체를 문다열 표기로 변환
			System.out.println(txt);
			view = "responsebody/"+txt;
			
    }
	else{
        String fc_id = request.getParameter("fc_id");
        String fc_content = request.getParameter("fc_content");
        int fb_num = Integer.parseInt(request.getParameter("fb_num"));
        
        service.addFreeComment(new FreeCommentVo(0, fc_id, fb_num, fc_content, null));
        view = "/freeboard/fb_detail.do?fb_num="+fb_num;
      
    }return view;
}

}