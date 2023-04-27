package handler.recipe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import likes.likesService;
import likes.likesVo;
import recipe.RecipeBoardService;

public class RecipelikesHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		likesService service = new likesService();
		RecipeBoardService Rservice = new RecipeBoardService();
		if (!"${sessionScope.loginId}".equals(null)) {
			System.out.println(service.searchIdNum("${sessionScope.loginId}", num));
			if (!service.searchIdNum("${sessionScope.loginId}", num)) {
				service.insert(new likesVo("${sessionScope.loginId}", num,0));
				Rservice.addlike(num);
				
			}
		}		
		
		String view = "/recipe/recipe.jsp";
		return view;
	}

}
