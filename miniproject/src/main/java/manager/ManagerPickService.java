package manager;

import java.util.ArrayList;

public class ManagerPickService {
	private ManagerPickDao dao;
	
	public ManagerPickService() {
		dao = new ManagerPickDao();
	}
	
	public void insert(ManagerPickVo vo) {
		dao.insert(vo);
	}
	
	public ArrayList<ManagerPickVo> getAll(){
		return dao.selectAll();
	}
	public ManagerPickVo getByNum(int seqnum) {
		return dao.selectByNum(seqnum);
	}
	public void delete(int seqnum) {
		dao.delete(seqnum);
	}
}
