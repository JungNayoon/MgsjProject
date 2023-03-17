package com.project.order.dao;

import java.util.List;

import com.project.member.domain.MemberAddressDTO;
import com.project.order.domain.OrderDTO;
import com.project.order.domain.OrderDetailDTO;

public interface OrderDAO {
	
	//주문 등록
	public void orderWrite(OrderDTO orderDTO) throws Exception;
	
	//주문 조회
	public OrderDTO orderView(int orderNum, String userId) throws Exception;
	
	//주문 수정
	public void orderUpdate(OrderDTO orderDTO) throws Exception;
	
	//주문 삭제
	public void orderDelete(int orderNum) throws Exception;
	
	//주문 목록
	public List<OrderDTO> orderList(OrderDTO orderDTO) throws Exception;
	
	//주문 상세 목록
	public List<OrderDetailDTO> orderDetailList(OrderDetailDTO orderDetailDTO) throws Exception;
	
	//회원 주소 조회
	public MemberAddressDTO memAddress(String userId) throws Exception;
	


}
