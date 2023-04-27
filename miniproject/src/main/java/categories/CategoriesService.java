package categories;

import java.util.ArrayList;

public class CategoriesService {

	CategoriesDao dao ;
	
	public CategoriesService() {
		dao = new CategoriesDao();
	}
	
	public ArrayList<CategoriesVo> getCategories(){
		return dao.selectCategories();
	}
	public int getCat_num(String ingredient) {
		return dao.selectCat_num(ingredient);
	}
}
