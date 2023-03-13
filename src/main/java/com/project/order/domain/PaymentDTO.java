package com.project.order.domain;

import java.util.Date;

public class PaymentDTO {

	private int orderNum;
	private String paymentSet;
	private String paymentCard;
	private int paymentMoney;
	private Date paymentRegDate;
	
	
	//이너 조인
	private String userId;
	
	
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getPaymentSet() {
		return paymentSet;
	}
	public void setPaymentSet(String paymentSet) {
		this.paymentSet = paymentSet;
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
		return "PaymentDTO [orderNum=" + orderNum + ", paymentSet=" + paymentSet + ", paymentCard=" + paymentCard
				+ ", paymentMoney=" + paymentMoney + ", paymentRegDate=" + paymentRegDate + ", userId=" + userId + "]";
	}
	
	
	
}
