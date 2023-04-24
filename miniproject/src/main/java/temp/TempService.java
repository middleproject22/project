package temp;

public class TempService {

	TempDao dao ;
	
	public TempService() {
		dao = new TempDao();
	}
	
	public void add(TempVo vo) {
		dao.insert(vo);
		
	}
	public void out(String ingredient) {
		dao.delete(ingredient);
		
	}
	public void outAll() {
		dao.deleteAll();
		
	}
}
