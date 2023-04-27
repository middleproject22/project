package handler.recipelist;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import foodlist.FoodListService;
import foodmanage.FoodManageVo;
import handler.Handler;
import ingredient.IngredientService;
import ingredient.IngredientVo;

public class CategoryHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		//로그인 세션 확인 ${sessionScope.loginId}
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("loginId");
				
		int cat_lnum=Integer.parseInt( request.getParameter("cat_lnum"));
		FoodListService service = new FoodListService();
		ArrayList<FoodManageVo> list = service.getByCategories(id, cat_lnum);
//		ArrayList<IngredientVo> listIng=new ArrayList<>();
//
//		IngredientService serviceIng = new IngredientService();
//		for(int i =0;i<list.size();i++) {
//			FoodManageVo vo = list.get(i);
//			System.out.println(vo);
//			String name = vo.getIngredient();
//			IngredientVo ingvo = serviceIng.getByName(name);
//			System.out.println(name);
//			listIng.add(ingvo);
//			
//		}
		request.setAttribute("list", list);
		return "/recipelist/mylist.jsp";
	}

}
