package likes;

import java.util.ArrayList;

public class likesService {
	private likesDao dao;

	public likesService() {
		dao = new likesDao();
	}
	public void insert(likesVo vo) {
		dao.insert(vo);
	}
	
	public int addlikes(int num) {
		return dao.addlikes(num);
	}
	
	public ArrayList<likesVo> Maxlikes() {
		return dao.Maxlikes();
	}
	
	public boolean searchIdNum(String id, int num) {
		return dao.searchIdNum(id, num);
	}
}
