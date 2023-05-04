package handler.foodmanage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import handler.Handler;
import temp.TempService;
import temp.TempVo;

public class TempHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");		
		
		HttpSession session = request.getSession(false);
		String id = (String)session.getAttribute("loginId");
		String ingredient = request.getParameter("ingredient");
		TempService service = new TempService();
		ArrayList<TempVo> list = new ArrayList<>();
		
		int num = service.getCnt(id);
		request.setAttribute("cnt", num);
		
		service.add(new TempVo(0,id,ingredient));
		list.add(new TempVo(0,id,ingredient));
		
		JSONArray arr = new JSONArray();
		for(TempVo vo1 : list) {
			JSONObject obj = new JSONObject();
			obj.put("ingredient", vo1.getIngredient());
			arr.add(obj);
		}
		
		
		String txt = arr.toJSONString();
		
		
		
		return "responsebody/"+txt;
	}

}
