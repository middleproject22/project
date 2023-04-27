package handler.recipe;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import recipe.RecipeBoardService;
import recipe.RecipeBoardVo;

public class RecipeNameHandler implements Handler {

	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		String rcpnm = request.getParameter("rcp");
		String view= "/recipe/namelist.jsp";
		RecipeBoardService service = new RecipeBoardService();
		ArrayList<RecipeBoardVo> list = service.selectName(rcpnm);
		
		request.setAttribute("list", list);
		
		return view;
	}

}
