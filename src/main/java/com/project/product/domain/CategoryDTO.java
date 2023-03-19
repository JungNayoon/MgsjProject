package com.project.product.domain;

public class CategoryDTO {

	private int cno;
	private String categoryName;
	private int categoryLevel;
	private int level;
	
	//이너 조인
	private String productName;
	private String productPrice;
	private String storedFileName;
	private int pno;

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getCategoryLevel() {
		return categoryLevel;
	}

	public void setCategoryLevel(int categoryLevel) {
		this.categoryLevel = categoryLevel;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getStoredFileName() {
		return storedFileName;
	}

	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}

	@Override
	public String toString() {
		return "CategoryDTO [cno=" + cno + ", categoryName=" + categoryName + ", categoryLevel=" + categoryLevel
				+ ", level=" + level + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", storedFileName=" + storedFileName + ", pno=" + pno + "]";
	}

	
}
