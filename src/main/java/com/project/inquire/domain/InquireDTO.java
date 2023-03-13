package com.project.inquire.domain;

import java.util.Date;

public class InquireDTO {

	private int askNum;
	private int pno; // [3] -> [4] 여기서 써먹어야함.
	private String askTitle;
	private String askContent;
	private Date askRegDate;
	
	//이너 조인
	private String categoryName;

	public int getAskNum() {
		return askNum;
	}

	public void setAskNum(int askNum) {
		this.askNum = askNum;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getAskTitle() {
		return askTitle;
	}

	public void setAskTitle(String askTitle) {
		this.askTitle = askTitle;
	}

	public String getAskContent() {
		return askContent;
	}

	public void setAskContent(String askContent) {
		this.askContent = askContent;
	}

	public Date getAskRegDate() {
		return askRegDate;
	}

	public void setAskRegDate(Date askRegDate) {
		this.askRegDate = askRegDate;
	}

	public String getProductName() {
		return categoryName;
	}

	public void setProductName(String productName) {
		this.categoryName = productName;
	}

	@Override
	public String toString() {
		return "InquireDTO [askNum=" + askNum + ", pno=" + pno + ", askTitle=" + askTitle + ", askContent=" + askContent
				+ ", askRegDate=" + askRegDate + ", categoryName=" + categoryName + "]";
	}

	
}
