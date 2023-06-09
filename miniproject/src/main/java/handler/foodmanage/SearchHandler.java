package handler.foodmanage;

import java.io.UnsupportedEncodingException;
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
		

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		IngredientService service = new IngredientService();

		String name = request.getParameter("name"); 
		
		ArrayList<IngredientVo> list = service.getByNames(name); 
		
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
