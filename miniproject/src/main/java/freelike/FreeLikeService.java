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

	    public int getLike(int fb_num) {
	        return dao.selectLike(fb_num);
	    }

	    public FreeLikeVo getLikeByNum(int fb_num, String fl_id) {
	        return dao.selectByNum(fb_num, fl_id);
	    }
}
