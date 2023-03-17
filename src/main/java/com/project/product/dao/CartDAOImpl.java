package com.project.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.order.domain.OrderDetailDTO;
import com.project.product.domain.CartDTO;

@Repository
public class CartDAOImpl implements CartDAO {

	private static final Logger logger = LoggerFactory.getLogger(CartDAOImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAME_SPACE = "mappers.cartMapper";

	// 장바구니 등록
	@Override
	public void cartWrite(CartDTO cartDTO) throws Exception {
		
		logger.info("장바구니 등록 cartWrite - DAO");
		
		sqlSession.insert(NAME_SPACE + ".cartWrite", cartDTO);
	}
	
	// 장바구니 목록 주문목록으로 넘기기
	@Override
	public void cartOrder(OrderDetailDTO orderdetailDTO) throws Exception {
		
		logger.info("장바구니 목록 주문목록으로 넘기기 cartOrder - DAO");
		
		sqlSession.insert(NAME_SPACE + ".cartOrder", orderdetailDTO);
	}
	
	
	//장바구니 수정
	@Override
	public void cartUpdate(CartDTO cartDTO) throws Exception {

		logger.info("장바구니 수정 cartUpdate - DAO");
		
		sqlSession.update(NAME_SPACE + ".cartUpdate", cartDTO);
	}
	
	//장바구니 삭제
	@Override
	public void cartDelete(CartDTO cartDTO) throws Exception {

		logger.info("장바구니 삭제 cartDelete - DAO");
		
		sqlSession.delete(NAME_SPACE + ".cartDelete", cartDTO);
	}
	
	//장바구니 목록
	@Override
	public List<CartDTO> cartList(CartDTO cartDTO) throws Exception {

		logger.info("장바구니 목록 cartList - DAO");
		
		return sqlSession.selectList(NAME_SPACE + ".cartList", cartDTO);
	}
	
	
}
