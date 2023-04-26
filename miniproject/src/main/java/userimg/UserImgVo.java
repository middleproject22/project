package userimg;

public class UserImgVo {
	private String imgpath;
	
	public UserImgVo() {}

	public UserImgVo(String imgpath) {
		super();
		this.imgpath = imgpath;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	@Override
	public String toString() {
		return "UserImgVo [imgpath=" + imgpath + "]";
	}
	
	
}
