package com.project.inquire.domain;

import java.util.Date;

public class AnswerDTO {

	private int ansNum;
	private int askNum;
	private String ansTitle;
	private String ansContent;
	private Date ansRegDate;

	public int getAnsNum() {
		return ansNum;
	}

	public void setAnsNum(int ansNum) {
		this.ansNum = ansNum;
	}

	public int getAskNum() {
		return askNum;
	}

	public void setAskNum(int askNum) {
		this.askNum = askNum;
	}

	public String getAnsTitle() {
		return ansTitle;
	}

	public void setAnsTitle(String ansTitle) {
		this.ansTitle = ansTitle;
	}

	public String getAnsContent() {
		return ansContent;
	}

	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}

	public Date getAnsRegDate() {
		return ansRegDate;
	}

	public void setAnsRegDate(Date ansRegDate) {
		this.ansRegDate = ansRegDate;
	}

	@Override
	public String toString() {
		return "AnswerDTO [ansNum=" + ansNum + ", askNum=" + askNum + ", ansTitle=" + ansTitle + ", ansContent=" + ansContent + ", ansRegDate="
				+ ansRegDate + "]";
	}

}
