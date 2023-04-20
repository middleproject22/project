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
	
	//원글 목록 검색
	public ArrayList<FreeBoardVo> getAll(){
		return dao.selectAll();
	}
	
	//댓글 검색
	public ArrayList<FreeBoardVo> getReps(int parent){
		return dao.selectReps(parent);
	}
	
	public void editFreeBoard(FreeBoardVo vo) {
		dao.update(vo);
	}
	
	public void delFreeBoard(int num) {
		dao.delete(num);
	}
}