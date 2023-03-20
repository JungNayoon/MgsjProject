package com.project.order.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.member.domain.MemberAddressDTO;
import com.project.order.domain.OrderDTO;
import com.project.order.domain.OrderDetailDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	private static final Logger logger = LoggerFactory.getLogger(OrderDAOImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAME_SPACE = "mappers.orderMapper";
	
	// 주문 등록
	@Override
	public void orderWrite(OrderDTO orderDTO) throws Exception {
		
		logger.info("주문 등록 orderWrite - DAO");
		
		sqlSession.insert(NAME_SPACE + ".orderWrite", orderDTO);
	}
	// 주문 조회
	@Override
	public OrderDTO orderView(int orderNum, String userId) throws Exception {
		
		logger.info("주문 조회 orderView - DAO");
		
		 Map<String, Object> paramMap = new HashMap<>();
		    paramMap.put("orderNum", orderNum);
		    paramMap.put("userId", userId);
		
		
	return sqlSession.selectOne(NAME_SPACE + ".orderView", paramMap);
	}
	// 주문 수정
	@Override
	public void orderUpdate(OrderDTO orderDTO) throws Exception {
		
		logger.info("주문 수정 orderUpdate - DAO");
		
		sqlSession.update(NAME_SPACE + ".orderUpdate", orderDTO);
	}
	// 주문 삭제
	@Override
	public void orderDelete(int orderNum) throws Exception {
	
		logger.info("주문 삭제 orderDelete - DAO");
		
		sqlSession.delete(NAME_SPACE + ".orderDelete", orderNum);
	}
	// 주문 목록
	@Override
	public List<OrderDTO> orderList(OrderDTO orderDTO) throws Exception {
		
		logger.info("주문 목록 orderList - DAO");

		
		return sqlSession.selectList(NAME_SPACE + ".orderList", orderDTO);
	}
	
	//주문 상세 목록
	@Override
	public List<OrderDetailDTO> orderDetailList(OrderDetailDTO orderDetailDTO) throws Exception {
		
		logger.info("주문 상세 목록 cartDetailList - DAO");
		
		return sqlSession.selectList(NAME_SPACE + ".orderDetailList", orderDetailDTO);
	}
	
	//회원 주소 조회
	@Override
	public MemberAddressDTO memAddress(String userId) throws Exception {
				
		
		logger.info("회원 주소 조회 memAddress - DAO");
		
		
		return sqlSession.selectOne(NAME_SPACE + ".memAddress", userId);
	}
	
	
}
