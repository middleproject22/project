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
	public ArrayList<TempVo> getTempByName(String name) {
		return dao.selectByName(name);
		
	}
	public void outByName(String ingredient) {
		dao.deleteByName(ingredient);
		
	}
	public void outByNum(int num) {
		dao.deleteByNum(num);
		
	}
	public void outAll() {
		dao.deleteAll();
		
	}
	public int getCnt(String id) {
		return dao.cnt(id);
	}
	
}
