package com.project.product.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.order.domain.OrderDetailDTO;
import com.project.product.dao.CartDAO;
import com.project.product.domain.CartDTO;

@Service
public class CartServiceImpl implements CartService {

	private static final Logger logger = LoggerFactory.getLogger(CartServiceImpl.class);
	
	@Autowired
	private CartDAO cartDAO;
	
	//장바구니 등록
	@Override
	public void cartWrite(CartDTO cartDTO) throws Exception {
		
		logger.info("장바구니 등록 cartWrite - Service");
		
		cartDAO.cartWrite(cartDTO);
		
	}
	
	// 장바구니 목록 주문목록으로 넘기기
	@Override
	public void cartOrder(OrderDetailDTO orderdetailDTO) throws Exception {
		
		logger.info("장바구니 목록 주문목록으로 넘기기 cartOrder - Service");
		
		cartDAO.cartOrder(orderdetailDTO);
	}
	
	
	//장바구니 수정
	@Override
	public void cartUpdate(CartDTO cartDTO) throws Exception {
		
		logger.info("장바구니 수정 cartUpdate - Service");
		
		cartDAO.cartUpdate(cartDTO);
		
	}
	
	//장바구니 삭제
	@Override
	public void cartDelete(CartDTO cartDTO) throws Exception {
		
		logger.info("장바구니 삭제 cartDelete - Service");
		
		cartDAO.cartDelete(cartDTO);
		
	}
	
	//장바구니 목록
	@Override
	public List<CartDTO> cartList(CartDTO cartDTO) throws Exception {
		
		logger.info("장바구니 목록 cartList - Service");
		
		
		return cartDAO.cartList(cartDTO);
	}
	

}
