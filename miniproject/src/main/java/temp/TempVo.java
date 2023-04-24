package temp;

public class TempVo {
	
	private String id ;
	private String ingredient;
	
	public TempVo(String id, String ingredient) {
		super();
		this.id = id;
		this.ingredient = ingredient;
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
		return "TempVo [id=" + id + ", ingredient=" + ingredient + "]";
	}
	
	
	

}
