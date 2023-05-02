package xml;

public class PageVo {
	private int startPage;
	private int endPage;
	private int pageNum;
	private int amount = 20;
	private int total;
	
	public void PageVo() {
		
	}

	public PageVo(int pageNum, int amount, int total) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
		this.total = total;
		
		this.endPage = (int)Math.ceil(this.pageNum * 0.1) * 10;
		
		this.startPage = this.endPage - 10 + 1;
	}

	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getPageNum() {
		return pageNum;
	}


	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	@Override
	public String toString() {
		return "PageVo [startPage=" + startPage + ", endPage=" + endPage + ", pageNum=" + pageNum + ", amount=" + amount
				+ ", total=" + total + "]";
	}
	
	
	
	
}
