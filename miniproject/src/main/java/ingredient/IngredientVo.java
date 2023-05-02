package ingredient;

public class IngredientVo {
	private String ig_name;
	private String ig_cc;
	private int ig_kcal;
	private int ig_pt;
	private int ig_fat;
	private int ig_car;
	private int ig_sug;
	private int ig_nat;
	private String ig_path;
								
	public IngredientVo() {		
	}							
								
	public IngredientVo(String ig_name, String ig_cc, int ig_kcal, int ig_pt, int ig_fat, int ig_car, int ig_sug,
			int ig_nat) {
		super();
		this.ig_name = ig_name;
		this.ig_cc = ig_cc;
		this.ig_kcal = ig_kcal;
		this.ig_pt = ig_pt;
		this.ig_fat = ig_fat;
		this.ig_car = ig_car;
		this.ig_sug = ig_sug;
		this.ig_nat = ig_nat;
	}

	
	
	public IngredientVo(String ig_name, String ig_cc, int ig_kcal, int ig_pt, int ig_fat, int ig_car, int ig_sug,
			int ig_nat, String ig_path) {
		super();
		this.ig_name = ig_name;
		this.ig_cc = ig_cc;
		this.ig_kcal = ig_kcal;
		this.ig_pt = ig_pt;
		this.ig_fat = ig_fat;
		this.ig_car = ig_car;
		this.ig_sug = ig_sug;
		this.ig_nat = ig_nat;
		this.ig_path = ig_path;
	}

	public String getIg_path() {
		return ig_path;
	}

	public void setIg_path(String ig_path) {
		this.ig_path = ig_path;
	}

	public String getIg_name() {
		return ig_name;
	}

	public void setIg_name(String ig_name) {
		this.ig_name = ig_name;
	}

	public String getIg_cc() {
		return ig_cc;
	}

	public void setIg_cc(String ig_cc) {
		this.ig_cc = ig_cc;
	}

	public int getIg_kcal() {
		return ig_kcal;
	}

	public void setIg_kcal(int ig_kcal) {
		this.ig_kcal = ig_kcal;
	}

	public int getIg_pt() {
		return ig_pt;
	}

	public void setIg_pt(int ig_pt) {
		this.ig_pt = ig_pt;
	}

	public int getIg_fat() {
		return ig_fat;
	}

	public void setIg_fat(int ig_fat) {
		this.ig_fat = ig_fat;
	}

	public int getIg_car() {
		return ig_car;
	}

	public void setIg_car(int ig_car) {
		this.ig_car = ig_car;
	}

	public int getIg_sug() {
		return ig_sug;
	}

	public void setIg_sug(int ig_sug) {
		this.ig_sug = ig_sug;
	}

	public int getIg_nat() {
		return ig_nat;
	}

	public void setIg_nat(int ig_nat) {
		this.ig_nat = ig_nat;
	}

	@Override
	public String toString() {
		return "IngredientVo [ig_name=" + ig_name + ", ig_cc=" + ig_cc + ", ig_kcal=" + ig_kcal + ", ig_pt=" + ig_pt
				+ ", ig_fat=" + ig_fat + ", ig_car=" + ig_car + ", ig_sug=" + ig_sug + ", ig_nat=" + ig_nat + "]";
	}
	
	
	
}
