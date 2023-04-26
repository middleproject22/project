package foodmanage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import ingredient.IngredientService;
import ingredient.IngredientVo;

/**
 * Servlet implementation class select
 */
@WebServlet("/product/select")
public class select extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public select() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		IngredientService service = new IngredientService();
		String name = request.getParameter("name"); 
		ArrayList<IngredientVo> list = new ArrayList<>(); 
		
		if (!name.equals("iii")) {
			list = service.getByName(name);
			
		}else {
			list = service.getAll();
		}
		
		JSONArray arr = new JSONArray();
		
		for(IngredientVo vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("ig_name", vo.getIg_name());
			arr.add(obj);
		}
		
		String txt = arr.toJSONString();
		response.getWriter().append(txt);
		
		}
		
		
		
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
