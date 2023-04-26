package userimg;

import java.util.ArrayList;

public class UserImgService {
	private UserImgDao dao;
	
	public UserImgService() {
		dao = new UserImgDao();
	}
	
	public ArrayList<UserImgVo> getAll(){
		return dao.selectAll();
	}
}
