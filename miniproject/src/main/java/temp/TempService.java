package temp;

import java.util.ArrayList;

public class TempService {

	TempDao dao ;
	
	public TempService() {
		dao = new TempDao();
	}
	
	public void add(TempVo vo) {
		 dao.insert(vo);
		
	}
	public ArrayList<TempVo> getTemp() {
		return dao.select();
		
	}
	public void out(String ingredient) {
		dao.delete(ingredient);
		
	}
	public void outAll() {
		dao.deleteAll();
		
	}
}
