package Member;

public class MemberVo {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String phonenum;
	private String imgpath;
	private int managenum;
	
	public MemberVo() {}

	public MemberVo(String id, String pwd, String name, String email, String phonenum, String imgpath, int managenum) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phonenum = phonenum;
		this.imgpath = imgpath;
		this.managenum = managenum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	public int getManagenum() {
		return managenum;
	}

	public void setManagenum(int managenum) {
		this.managenum = managenum;
	}

	@Override
	public String toString() {
		return "MemberVo [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", phonenum=" + phonenum
				+ ", imgpath=" + imgpath + ", managenum=" + managenum + "]";
	}
	
	
}
