package handler.foodmanage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import handler.Handler;
import ingredient.IngredientService;
import ingredient.IngredientVo;
import temp.TempService;
import temp.TempVo;

public class SelectHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
	
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession(false);
		String id = (String)session.getAttribute("loginId");
		
		IngredientService service = new IngredientService();
		String name = request.getParameter("name"); 
		ArrayList<IngredientVo> list = new ArrayList<>(); 
		
	
		
		if (!name.equals("iii")) {
			list = service.getByMid(name);
			
		}else {
			list = service.getAll();
		}
		JSONArray arr = new JSONArray();
		
		for(IngredientVo vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("ig_name", vo.getIg_name());
			obj.put("ig_path", vo.getIg_path());
			arr.add(obj);
		}
		
		String txt = arr.toJSONString();
		response.setContentType("application/json");
		
		
		return "responsebody/"+txt;
	}

}
