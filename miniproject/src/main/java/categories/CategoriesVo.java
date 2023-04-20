package categories;

public class CategoriesVo {

	
	private int  cat_num;
	private	String cat_name;
	private	String cat_lnum;
	
	public CategoriesVo ()	{
		
	}

	public CategoriesVo(int cat_num, String cat_name, String cat_lnum) {
		super();
		this.cat_num = cat_num;
		this.cat_name = cat_name;
		this.cat_lnum = cat_lnum;
	}

	public int getCat_num() {
		return cat_num;
	}

	public void setCat_num(int cat_num) {
		this.cat_num = cat_num;
	}

	public String getCat_name() {
		return cat_name;
	}

	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}

	public String getCat_lnum() {
		return cat_lnum;
	}

	public void setCat_lnum(String cat_lnum) {
		this.cat_lnum = cat_lnum;
	}

	@Override
	public String toString() {
		return "CategoriesVo [cat_num=" + cat_num + ", cat_name=" + cat_name + ", cat_lnum=" + cat_lnum + "]";
	}
	
	
	
}
