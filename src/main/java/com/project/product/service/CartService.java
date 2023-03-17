package com.project.product.service;

import java.util.List;

import com.project.order.domain.OrderDetailDTO;
import com.project.product.domain.CartDTO;

public interface CartService {

	//장바구니 등록
	public void cartWrite(CartDTO cartDTO) throws Exception;
	
	// 장바구니 목록 주문목록으로 넘기기
	public void cartOrder(OrderDetailDTO orderdetailDTO) throws Exception;
	
	//장바구니 수정
	public void cartUpdate(CartDTO cartDTO) throws Exception;
	
	//장바구니 삭제
	public void cartDelete(CartDTO cartDTO) throws Exception;
	
	//장바구니 목록
	public List<CartDTO> cartList(CartDTO cartDTO) throws Exception;
	
	
}
