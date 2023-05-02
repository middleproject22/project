package handler.recipe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import recipe.RecipeBoardService;

public class RecipeManagerPickHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		RecipeBoardService Rservice = new RecipeBoardService();
		Rservice.addmp(num);
		
		String view = "/recipe/recipe.jsp";
		return view;
	}

}
