package com.project.product.domain;

public class CartDTO {
	private int cartNum;
	private int pno;
	private int productCnt;
	private String userId;

	private String productName;
	private int productPrice;
	
	/*
	private int totalPrice;
	
	//totalPrice에 저장될 값
	public CartDTO() {
		this.totalPrice = this.productCnt * this.productPrice;
	}
	*/
	public int getCartNum() {
		return cartNum;
	}

	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getProductCnt() {
		return productCnt;
	}

	public void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	/*
	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	*/

	@Override
	public String toString() {
		return "CartDTO [cartNum=" + cartNum + ", pno=" + pno + ", productCnt=" + productCnt + ", userId=" + userId
				+ ", productName=" + productName + ", productPrice=" + productPrice + "]";
	}
	

}
