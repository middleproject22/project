package handler.recipe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;
import likes.likesService;
import likes.likesVo;
import recipe.RecipeBoardService;

public class RecipelikesHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));
		HttpSession session = request.getSession(false);
		String id = (String)session.getAttribute("loginId");
		System.out.println(num);
		likesService service = new likesService();
		RecipeBoardService Rservice = new RecipeBoardService();
		if (!id.equals(null)) {
			System.out.println(service.searchIdNum(id, num));
			if (!service.searchIdNum(id, num)) {
				service.insert(new likesVo(id, num,0));
				Rservice.addlike(num);
			}
		}		
		
		String view = "/recipe/recipe.jsp";
		return view;
	}

}