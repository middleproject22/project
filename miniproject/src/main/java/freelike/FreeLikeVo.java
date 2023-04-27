package freelike;

public class FreeLikeVo {
	private String fb_num;
	private int fl_id;
	
	public FreeLikeVo() {
		
	}
	
	public FreeLikeVo(String fb_num, int fl_id) {
		this.fb_num = fb_num;
		this.fl_id = fl_id;
	}

	public String getFb_num() {
		return fb_num;
	}

	public void setFb_num(String fb_num) {
		this.fb_num = fb_num;
	}

	public int getFl_id() {
		return fl_id;
	}

	public void setFl_id(int fl_id) {
		this.fl_id = fl_id;
	}

	@Override
	public String toString() {
		return "FreeLikeVo [fb_num=" + fb_num + ", fl_id=" + fl_id + "]";
	}
	
	
}
