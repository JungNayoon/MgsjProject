package com.project.order.service;

import java.util.List;

import com.project.order.domain.PaymentDTO;

public interface PaymentService {

	//결제 등록
	public void paymentWrite(PaymentDTO paymentDTO) throws Exception;
	
	//결제 내역 목록
	public List<PaymentDTO> paymentList(PaymentDTO paymentDTO) throws Exception;
}
