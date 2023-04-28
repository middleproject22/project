package likes;

public class likesVo {
	private String id;
	private int seq_num;
	private int likes;
	
	public likesVo() {}
	
	public likesVo(String id, int seq_num) {
		super();
		this.id = id;
		this.seq_num = seq_num;
	}
	
	public likesVo(int likes) {
		super();
		this.likes = likes;
		
	}

	public likesVo(String id, int seq_num, int likes) {
		super();
		this.id = id;
		this.seq_num = seq_num;
		this.likes = likes;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getSeq_num() {
		return seq_num;
	}

	public void setSeq_num(int seq_num) {
		this.seq_num = seq_num;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	@Override
	public String toString() {
		return "likesVo [id=" + id + ", seq_num=" + seq_num + ", likes=" + likes + "]";
	}
	
}

