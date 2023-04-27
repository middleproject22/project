package freecomment;

import java.sql.Date;

public class FreeCommentVo {
	private int fc_num;
	private String fc_id;
	private int fb_num;
	private String fc_content;
	private Date fc_date;
	
	public FreeCommentVo() {
		
	}

	public FreeCommentVo(int fc_num, String fc_id, int fb_num, String fc_content, Date fc_date) {
		this.fc_num = fc_num;
		this.fc_id = fc_id;
		this.fb_num = fb_num;
		this.fc_content = fc_content;
		this.fc_date = fc_date;
	}

	public int getFc_num() {
		return fc_num;
	}

	public void setFc_num(int fc_num) {
		this.fc_num = fc_num;
	}

	public String getFc_id() {
		return fc_id;
	}

	public void setFc_id(String fc_id) {
		this.fc_id = fc_id;
	}

	public int getFb_num() {
		return fb_num;
	}

	public void setFb_num(int fb_num) {
		this.fb_num = fb_num;
	}

	public String getFc_content() {
		return fc_content;
	}

	public void setFc_content(String fc_content) {
		this.fc_content = fc_content;
	}

	public Date getFc_date() {
		return fc_date;
	}

	public void setFc_date(Date fc_date) {
		this.fc_date = fc_date;
	}

	@Override
	public String toString() {
		return "FreeCommentVo [fc_num=" + fc_num + ", fc_id=" + fc_id + ", fb_num=" + fb_num + ", fc_content="
				+ fc_content + ", fc_date=" + fc_date + "]";
	}

	
}