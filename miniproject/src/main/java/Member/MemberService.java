package Member;

public class MemberService {
	private MemberDao dao;
	
	public MemberService() {
		dao = new MemberDao();
	}
	
	public void Join(MemberVo vo) {
		dao.insert(vo);
	}
	public MemberVo getById(String id) {
		return dao.SelectById(id);
	}
	public void updatePwd(String pwd, String id) {
		dao.updatePwd(pwd, id);
	}
	public void imgUpdate(String imgpath,String id) {
		dao.updateImgPath(imgpath, id);
	}
	public void memberOut(String id) {
		dao.delete(id);
	}
	
	public void getAll() {
		dao.selectAll();
	}
	
	public MemberVo getByPnum(String pnum) {
		return dao.SelectByPnum(pnum);
	}

}
