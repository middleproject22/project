package foodmanage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import temp.TempService;
import temp.TempVo;

/**
 * Servlet implementation class temp
 */
@WebServlet("/product/temp")
public class temp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public temp() {
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
		
		HttpSession session = request.getSession(false);
		String id = (String)session.getAttribute("loginId");
		String ingredient = request.getParameter("ingredient");
		TempService service = new TempService();
		ArrayList<TempVo> list = new ArrayList<>();
		
		service.add(new TempVo(0,id,ingredient));
		list.add(new TempVo(0,id,ingredient));
		
		JSONArray arr = new JSONArray();
		for(TempVo vo1 : list) {
			JSONObject obj = new JSONObject();
			obj.put("ingredient", vo1.getIngredient());
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
