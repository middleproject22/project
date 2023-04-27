package handler.foodmanage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import handler.Handler;
import ingredient.IngredientService;
import ingredient.IngredientVo;

public class SearchHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		IngredientService service = new IngredientService();
		String name = request.getParameter("name"); 
		
		System.out.println(name);
		ArrayList<IngredientVo> list = service.getByNames(name); 

		JSONArray arr = new JSONArray();
		
		for(IngredientVo vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("ig_name", vo.getIg_name());
			arr.add(obj);
		}
		
		String txt = arr.toJSONString();
		response.setContentType("application/json");
		
		
		return "responsebody/"+txt;
		
		
	}

}
