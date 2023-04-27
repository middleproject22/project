package xml;

public class RecipeVo {
	private String manual;
	private String img;
	public RecipeVo() {}
	public RecipeVo(String manual, String img) {
		super();
		this.manual = manual;
		this.img = img;
	}
	public String getManual() {
		return manual;
	}
	public void setManual(String manual) {
		this.manual = manual;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "RecipeVo [manual=" + manual + ", img=" + img + "]";
	}
	
	
}
