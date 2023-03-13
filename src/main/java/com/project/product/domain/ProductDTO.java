package com.project.product.domain;

import java.util.Date;

public class ProductDTO {

	private int pno;
	private int cno;
	private String productName;
	private int productPrice;
	private int productStock;
	private String productDescription;
	private Date productRegDate;

	private String originFileName;
	private String storedFileName;
	private String storedThumbNail;

	// 이너 조인
	private String categoryName;

	public ProductDTO() {
		// 오버로딩 => 기본생성자 필수
	}

	// 파일세팅을 하기 위한 생성자
	public ProductDTO(String originFileName, String storedFileName, String storedThumbNail) {
		this.originFileName = originFileName;
		this.storedFileName = storedFileName;
		this.storedThumbNail = storedThumbNail;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductStock() {
		return productStock;
	}

	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public Date getProductRegDate() {
		return productRegDate;
	}

	public void setProductRegDate(Date productRegDate) {
		this.productRegDate = productRegDate;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	// 파일 업로드
	public String getOriginFileName() {
		return originFileName;
	}

	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}

	public String getStoredFileName() {
		return storedFileName;
	}

	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}

	public String getStoredThumbNail() {
		return storedThumbNail;
	}

	public void setStoredThumbNail(String storedThumbNail) {
		this.storedThumbNail = storedThumbNail;
	}

	@Override
	public String toString() {
		return "ProductDTO [pno=" + pno + ", cno=" + cno + ", productName=" + productName + ", productPrice=" + productPrice + ", productStock="
				+ productStock + ", productDescription=" + productDescription + ", productRegDate=" + productRegDate + ", originFileName="
				+ originFileName + ", storedFileName=" + storedFileName + ", storedThumbNail=" + storedThumbNail + ", categoryName=" + categoryName
				+ "]";
	}


}
