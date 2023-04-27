package freecomment;

import java.util.ArrayList;

public class FreeCommentService {
	private FreeCommentDao dao;
	public FreeCommentService() {
		dao = new FreeCommentDao();
	}
	
	public void addFreeComment(FreeCommentVo vo) {
		dao.insert(vo);
	}
	
	public ArrayList<FreeCommentVo> getCommentBoard(int num) {
		return dao.select(num);
	}
	
	public void delFreeComment(int num) {
		dao.delete(num);
	}
	
	public ArrayList<FreeCommentVo> getAll(){
		return dao.selectAll();
	}
}
