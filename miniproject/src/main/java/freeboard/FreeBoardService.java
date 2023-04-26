package freeboard;

import java.util.ArrayList;

public class FreeBoardService {
	private FreeBoardDao dao;
	public FreeBoardService() {
		dao = new FreeBoardDao();
	}
	
	public void addFreeBoard(FreeBoardVo vo) {
		dao.insert(vo);
	}
	
	public FreeBoardVo getFreeBoard(int num) {
		return dao.select(num);
	}
	

	public ArrayList<FreeBoardVo> getAll(){
		return dao.selectAll();
	}
	
	
	public void editFreeBoard(FreeBoardVo vo) {
		dao.update(vo);
	}
	
	public void delFreeBoard(int num) {
		dao.delete(num);
	}
	
	public void cnt(int num) {
		dao.cnt(num);
	}
}