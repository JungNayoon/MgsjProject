package com.project.member.domain;

import java.util.Date;

public class MemberDTO {

	private int userNum;
	private String userId;
	private String userPwd;
	private String userName;
	private String userPhoneNumber;
	private String userEmail;
	private Date userJoinDate;
	private String userGender;
	private int userVerify;
	private int userBirth;

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}

	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Date getUserJoinDate() {
		return userJoinDate;
	}

	public void setUserJoinDate(Date userJoinDate) {
		this.userJoinDate = userJoinDate;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public int getUserVerify() {
		return userVerify;
	}

	public void setUserVerify(int userVerify) {
		this.userVerify = userVerify;
	}

	public int getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(int userBirth) {
		this.userBirth = userBirth;
	}

	@Override
	public String toString() {
		return "MemberDTO [userNum=" + userNum + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", userPhoneNumber="
				+ userPhoneNumber + ", userEmail=" + userEmail + ", userJoinDate=" + userJoinDate + ", userGender=" + userGender + ", userVerify="
				+ userVerify + ", userBirth=" + userBirth + "]";
	}

}
