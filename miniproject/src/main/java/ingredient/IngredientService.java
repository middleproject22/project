package ingredient;

import java.util.ArrayList;

public class IngredientService {
	
	
	IngredientDao dao ;
	public IngredientService() {
		dao = new IngredientDao();
	}
	
	
	public ArrayList<IngredientVo> getAll(){
		return dao.selectAll();
	}
	public IngredientVo getByName(String name){
		return dao.selectByName(name);
	}
	
	
	
	
}
