package temp;

public class TempVo {
	private int temp_num;
	private String id ;
	private String ingredient;
	
	public TempVo() {
		
	}

	public TempVo(int temp_num, String id, String ingredient) {
		super();
		this.temp_num = temp_num;
		this.id = id;
		this.ingredient = ingredient;
	}

	public int getTemp_num() {
		return temp_num;
	}

	public void setTemp_num(int temp_num) {
		this.temp_num = temp_num;
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

	@Override
	public String toString() {
		return "TempVo [temp_num=" + temp_num + ", id=" + id + ", ingredient=" + ingredient + "]";
	}

	
	
	
	

}
