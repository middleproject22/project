package handler.recipe;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import recipe.RecipeBoardService;
import recipe.RecipeBoardVo;

public class RecipeAllDataHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		RecipeBoardService service = new RecipeBoardService();
		String view = "/recipe/searchrecipe.jsp";
		
		ArrayList<RecipeBoardVo> list = service.selectAllName();
		
		request.setAttribute("list", list);
		
		return view;
	}

}
