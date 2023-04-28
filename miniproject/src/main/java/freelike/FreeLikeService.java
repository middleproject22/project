package freelike;

public class FreeLikeService {
	private FreeLikeDao dao;
	public FreeLikeService() {
		dao = new FreeLikeDao();
}
	
	 public void addLike(FreeLikeVo vo) {
	        dao.insert(vo);
	    }

	    public void removeLike(FreeLikeVo vo) {
	        dao.delete(vo);
	    }

	    public int getLike(int num) {
	        return dao.selectLike(num);
	    }

	    public FreeLikeVo getLikeByNum(int num, String id) {
	        return dao.selectByNum(num, id);
	    }
}
