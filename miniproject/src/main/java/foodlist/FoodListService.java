package foodlist;

import java.util.ArrayList;

import foodmanage.FoodManageVo;

public class FoodListService {

	FoodListDao dao ;
	
	public FoodListService() {
		dao = new FoodListDao();
	}
	
	public ArrayList<FoodManageVo> getByCategories(String id,int cat_num) {
		return dao.selectByCategories(id,cat_num);
	}
	
	public void updateToday(String id) {
		System.out.println("service");
		dao.checkDate(id);
	}
	
	public void checkDate(String id) {
		dao.checkDate(id);
	}
	
	//남은 날짜별 식품 개수
	public int ddayThree(String id) {
		return dao.ddayThree(id);
	}
	
	public int ddaySeven(String id) {
		return dao.ddaySeven(id);
	}
	
	public int ddayetc(String id) {
		return dao.ddayetc(id);
	}
	
	//전체 식품 개수 구하기
	public int ddayAll(String id) {
		return dao.ddayAll(id);
	}
	
	public ArrayList<FoodManageVo> getbyId (String id) {
		return dao.selectById(id);
	}
	
	public void updateAmount(int amount, int num ) {
		dao.updateAmount(amount, num);
	}
	
}
