package foodmanage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import foodmanage.FoodManageService;
import foodmanage.FoodManageVo;
import temp.TempService;
import temp.TempVo;

/**
 * Servlet implementation class detail
 */
@WebServlet("/product/detail")
public class detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */			
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TempService service = new TempService();
		ArrayList<TempVo> list = service.getTemp();
		request.setAttribute("list", list);
			
			
		RequestDispatcher dis = request.getRequestDispatcher("/bang/detail.jsp");
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
