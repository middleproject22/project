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
		//로그인 세션 확인 ${sessionScope.loginId}
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("loginId");
		
		FoodListService service = new FoodListService();
		// dday 확인
		service.checkDate(id);
		// 리스트 목록 출력
		ArrayList<FoodManageVo> list = service.getbyId(id);
		//영양소 내용 꺼내기
		ArrayList<IngredientVo> listIng=new ArrayList<>();
		IngredientService serviceIng = new IngredientService();
		for(int i =0;i<list.size();i++) {
			FoodManageVo vo = list.get(i);
			String name = vo.getIngredient();
			IngredientVo ingvo = serviceIng.getByName(name);
			listIng.add(ingvo);
			
		}
		request.setAttribute("list", list);
		request.setAttribute("listIng", listIng);
		
		return "/foodlist/mylist.jsp";
	}

}
