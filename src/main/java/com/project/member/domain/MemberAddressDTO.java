package com.project.member.domain;

public class MemberAddressDTO {

	private String userId;
	private String postAddress;
	private String address;
	private String detailAddress;
	
	//이너 조인
	private int userPhoneNumber;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPostAddress() {
		return postAddress;
	}

	public void setPostAddress(String postAddress) {
		this.postAddress = postAddress;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public int getUserPhoneNumber() {
		return userPhoneNumber;
	}

	public void setUserPhoneNumber(int userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}

	@Override
	public String toString() {
		return "MemberAddressDTO [userId=" + userId + ", postAddress=" + postAddress + ", address=" + address
				+ ", detailAddress=" + detailAddress + ", userPhoneNumber=" + userPhoneNumber + "]";
	}


}
