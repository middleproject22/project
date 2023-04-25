package foodlist;

import java.util.ArrayList;

import foodmanage.FoodManageVo;

public class FoodListService {

	FoodListDao dao ;
	
	public FoodListService() {
		dao = new FoodListDao();
	}
	
	public ArrayList<FoodManageVo> getByCategories(int cat_num) {
		return dao.selectByCategories(cat_num);
	}
	
	public void updateToday(String id) {
		System.out.println("service");
		dao.checkDate(id);
	}
	
	public void checkDate(String id) {
		dao.checkDate(id);
	}
	
	public ArrayList<FoodManageVo> ddaySeven() {
		return dao.ddaySeven();
	}
	public ArrayList<FoodManageVo> getbyId (String id) {
		return dao.selectById(id);
	}
}
