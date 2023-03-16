package com.project.order.domain;

import java.util.Date;

public class PaymentDTO {

	private int paymentNum;
	private int orderNum;
	private String paymentKind;
	private String paymentCard;
	private int paymentMoney;
	private Date paymentRegDate;

	// 이너 조인
	private String userId;

	public int getPaymentNum() {
		return paymentNum;
	}

	public void setPaymentNum(int paymentNum) {
		this.paymentNum = paymentNum;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public String getPaymentKind() {
		return paymentKind;
	}

	public void setPaymentKind(String paymentKind) {
		this.paymentKind = paymentKind;
	}

	public String getPaymentCard() {
		return paymentCard;
	}

	public void setPaymentCard(String paymentCard) {
		this.paymentCard = paymentCard;
	}

	public int getPaymentMoney() {
		return paymentMoney;
	}

	public void setPaymentMoney(int paymentMoney) {
		this.paymentMoney = paymentMoney;
	}

	public Date getPaymentRegDate() {
		return paymentRegDate;
	}

	public void setPaymentRegDate(Date paymentRegDate) {
		this.paymentRegDate = paymentRegDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "PaymentDTO [paymentNum=" + paymentNum + ", orderNum=" + orderNum + ", paymentKind=" + paymentKind
				+ ", paymentCard=" + paymentCard + ", paymentMoney=" + paymentMoney + ", paymentRegDate="
				+ paymentRegDate + ", userId=" + userId + "]";
	}

	

}
