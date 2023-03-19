package com.project.inquire.domain;

import java.util.Date;

public class InquireFileDTO {
	
	private int askFileNumber;
	private int askNum;
	private String originFileName;
	private String storedFileName;
	private String storedThumbNail;
	private int fileSize;
	private Date fileRegDate;

	public int getAskFileNumber() {
		return askFileNumber;
	}

	public void setAskFileNumber(int askFileNumber) {
		this.askFileNumber = askFileNumber;
	}

	public int getAskNum() {
		return askNum;
	}

	public void setAskNum(int askNum) {
		this.askNum = askNum;
	}

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

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public Date getFileRegDate() {
		return fileRegDate;
	}

	public void setFileRegDate(Date fileRegDate) {
		this.fileRegDate = fileRegDate;
	}

}
