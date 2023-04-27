package freelike;

public class FreeLikeVo {
	private String fl_id;
	private int fb_num;
	
	public FreeLikeVo() {
		
	}

	public FreeLikeVo(String fl_id, int fb_num) {
		this.fl_id = fl_id;
		this.fb_num = fb_num;
	}

	public String getFl_id() {
		return fl_id;
	}

	public void setFl_id(String fl_id) {
		this.fl_id = fl_id;
	}

	public int getFb_num() {
		return fb_num;
	}

	public void setFb_num(int fb_num) {
		this.fb_num = fb_num;
	}

	@Override
	public String toString() {
		return "FreeLikeVo [fl_id=" + fl_id + ", fb_num=" + fb_num + "]";
	}

	
}
