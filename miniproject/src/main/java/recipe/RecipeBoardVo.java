package recipe;

public class RecipeBoardVo {
	private int seq_num;
	private String name;
	private String mat;
	private int cnt;
	private int likes;
	
	public RecipeBoardVo() {}

	public RecipeBoardVo(int seq_num, String name, int cnt, int likes) {
		super();
		this.seq_num = seq_num;
		this.name = name;
		this.cnt = cnt;
		this.likes = likes;
	}

	public RecipeBoardVo(int cnt) {
		super();
		this.cnt = cnt;
	}

	public RecipeBoardVo(int seq_num, String name, String mat, int cnt, int likes) {
		super();
		this.seq_num = seq_num;
		this.name = name;
		this.mat = mat;
		this.cnt = cnt;
		this.likes = likes;
	}

	public int getSeq_num() {
		return seq_num;
	}

	public void setSeq_num(int seq_num) {
		this.seq_num = seq_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMat() {
		return mat;
	}

	public void setMat(String mat) {
		this.mat = mat;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	@Override
	public String toString() {
		return "RecipeBoardVo [seq_num=" + seq_num + ", name=" + name + ", mat=" + mat + ", cnt=" + cnt + ", likes="
				+ likes + "]";
	}
	
	
	
}
