package xml;

public class RecipeListVo {	
	private int num;
	private String RCP_NM;

	public RecipeListVo(int num, String rCP_NM) {
		super();
		this.num = num;
		RCP_NM = rCP_NM;
	}

	public RecipeListVo() {}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getRCP_NM() {
		return RCP_NM;
	}

	public void setRCP_NM(String rCP_NM) {
		RCP_NM = rCP_NM;
	}

	@Override
	public String toString() {
		return "RecipeListVo [num=" + num + ", RCP_NM=" + RCP_NM + "]";
	}

}
