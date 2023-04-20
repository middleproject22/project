package freeboard;

import java.sql.Date;

public class FreeBoardVo {
	private int fb_num;
	private String id;
	private Date w_date;
	private String title;
	private String content;
	private int likes;
	private int cnt;
	private int parent;
	
	public FreeBoardVo() {
		
	}

	public FreeBoardVo(int fb_num, String id, Date w_date, String title, String content, int likes, int cnt,
			int parent) {
		super();
		this.fb_num = fb_num;
		this.id = id;
		this.w_date = w_date;
		this.title = title;
		this.content = content;
		this.likes = likes;
		this.cnt = cnt;
		this.parent = parent;
	}

	public int getFb_num() {
		return fb_num;
	}

	public void setFb_num(int fb_num) {
		this.fb_num = fb_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getW_date() {
		return w_date;
	}

	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	@Override
	public String toString() {
		return "FreeBoardVo [fb_num=" + fb_num + ", id=" + id + ", w_date=" + w_date + ", title=" + title + ", content="
				+ content + ", likes=" + likes + ", cnt=" + cnt + ", parent=" + parent + "]";
	}

}
