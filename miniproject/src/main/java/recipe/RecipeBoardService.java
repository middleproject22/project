package recipe;

import java.util.ArrayList;


public class RecipeBoardService {
	private RecipeBoardDao dao;
	
	public RecipeBoardService() {
		dao = new RecipeBoardDao();
	}
	
	public void insert(RecipeBoardVo vo) {
		dao.insert(vo);
	}
	
	public void addcnt(int num){
		dao.addCnt(num);
	}
	
	public void addlike(int num) {
		dao.addLikes(num);
	}
	
	public void addmp(int num){
		dao.addmp(num);
	}
	
	public ArrayList<RecipeBoardVo>selectByCnt() {
		return dao.selectAllcnt();
	}
	
	public ArrayList<RecipeBoardVo> selectByLikes() {
		return dao.selectAlllikes();
	}
	
	public ArrayList<RecipeBoardVo> selectAllName() {
		return dao.selectAllName();
	}
	
	public ArrayList<RecipeBoardVo> selectName(String name) {
		return dao.selectName(name);
	}
	
	public ArrayList<RecipeBoardVo> selectMat (String mat1,String mat2,String mat3) {
		return dao.selectMat(mat1, mat2, mat3);
	}
	
	public void Update(RecipeBoardVo vo){
		dao.Update(vo);
	}
	
	public int selectcnt(int num) {
		return dao.selectcnt(num);
	}
	
	public RecipeBoardVo SelectByNum(int num) {
	      return dao.SelectByNum(num);
	   }
	public RecipeBoardVo SelectByName(String name) {
		return dao.SelectByName(name);
	}
	
	public ArrayList<RecipeBoardVo> getByMn(){
		return dao.SelectFromMp();
	}
}
