package foodmanage;

import java.sql.Date;

public class FoodManageVo {
	
	

	private int fm_num;
	private String id;
	private String ingredient;
	private int cat_num; 
	private Date today;
	private Date expiredate;
	private int dday; 
	private int amount;
	private String memo;
				
				
	public FoodManageVo () {
					
	}
					

	public FoodManageVo(int fm_num, String id, String ingredient, int cat_num, Date today, Date expiredate, int dday,
			int amount, String memo) {
		super();
		this.fm_num = fm_num;
		this.id = id;
		this.ingredient = ingredient;
		this.cat_num = cat_num;
		this.today = today;
		this.expiredate = expiredate;
		this.dday = dday;
		this.amount = amount;
		this.memo = memo;
	}


	public int getFm_num() {
		return fm_num;
	}


	public void setFm_num(int fm_num) {
		this.fm_num = fm_num;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getIngredient() {
		return ingredient;
	}


	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}


	public int getCat_num() {
		return cat_num;
	}


	public void setCat_num(int cat_num) {
		this.cat_num = cat_num;
	}


	public Date getToday() {
		return today;
	}


	public void setToday(Date today) {
		this.today = today;
	}


	public Date getExpiredate() {
		return expiredate;
	}


	public void setExpiredate(Date expiredate) {
		this.expiredate = expiredate;
	}




	public int getDday() {
		return dday;
	}


	public void setDday(int dday) {
		this.dday = dday;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}


	public String getMemo() {
		return memo;
	}


	public void setMemo(String memo) {
		this.memo = memo;
	}


	@Override
	public String toString() {
		return "FoodManageVo [fm_num=" + fm_num + ", id=" + id + ", ingredient=" + ingredient + ", cat_num=" + cat_num
				+ ", today=" + today + ", expiredate=" + expiredate + ", dday=" + dday + ", amount=" + amount
				+ ", memo=" + memo + "]";
	}
	

	
	
}
