package foodmanage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import categories.CategoriesService;
import categories.CategoriesVo;
import ingredient.IngredientService;
import ingredient.IngredientVo;

/**
 * Servlet implementation class list
 */
@WebServlet("/product/list")
public class list extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public list() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IngredientService service = new IngredientService();
		CategoriesService service2 = new CategoriesService();
		
		
		ArrayList<IngredientVo> list =service.getAll();
		ArrayList<CategoriesVo> list2 =service2.getCategories();
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);

		
		RequestDispatcher dis = request.getRequestDispatcher("/bang/list.jsp");
		dis.forward(request, response);
	
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
