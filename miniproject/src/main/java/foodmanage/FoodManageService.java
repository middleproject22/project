package foodmanage;

import java.util.ArrayList;

public class FoodManageService {

	FoodManageDao dao ;
	
	public FoodManageService() {
		dao = new FoodManageDao();
	}
	
	public void addFood(FoodManageVo vo) {
		dao.insert(vo);
	}
	public void editFood(FoodManageVo vo) {
		dao.update(vo);
	}
	public void deleteFood(int num) {
		dao.delete(num);
	}
	public FoodManageVo getFood(int num) {
		return dao.select(num);
	}
	public ArrayList<FoodManageVo> getAll() {
		return dao.selectAll();
	}

	public ArrayList<FoodManageVo> getByCategories(int num) {
		return dao.selectByCategoies(num);
	}
	public ArrayList<FoodManageVo> getByName(String name) {
		return dao.selectByName(name);
	}
}
	
	
