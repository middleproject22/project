package handler.foodlist;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foodlist.FoodListService;
import foodmanage.FoodManageVo;
import handler.Handler;
import ingredient.IngredientService;
import ingredient.IngredientVo;

public class CategoryHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int cat_num=Integer.parseInt( request.getParameter("cat_num"));
		FoodListService service = new FoodListService();
		ArrayList<FoodManageVo> list = service.getByCategories(cat_num);
		
		
		ArrayList<IngredientVo> listIng=new ArrayList<>();
		IngredientService serviceIng = new IngredientService();
		for(int i =0;i<list.size();i++) {
			FoodManageVo vo = list.get(i);
			System.out.println(vo);
			String name = vo.getIngredient();
			IngredientVo ingvo = serviceIng.getByName(name);
			System.out.println(name);
			listIng.add(ingvo);
			
		}
		System.out.println(listIng);

		request.setAttribute("list", list);
		request.setAttribute("listIng", listIng);
		
		return "/foodlist/mylist.jsp";
	}

}
