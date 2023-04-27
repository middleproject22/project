package handler.foodlist;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import foodlist.FoodListService;
import foodmanage.FoodManageVo;
import handler.Handler;
import ingredient.IngredientService;
import ingredient.IngredientVo;

public class MyListHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("loginId");
		System.out.println(id);
		FoodListService service = new FoodListService();
		service.checkDate(id);
		ArrayList<FoodManageVo> list = service.getbyId(id);
		//영양소 내용 꺼내기
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
