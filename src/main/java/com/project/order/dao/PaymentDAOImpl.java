package com.project.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.order.domain.PaymentDTO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {

	private static final Logger logger = LoggerFactory.getLogger(PaymentDAOImpl.class);

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAME_SPACE = "mappers.paymentMapper";
	
	
	//결제 등록
	@Override
	public void paymentWrite(PaymentDTO paymentDTO) throws Exception {
		
		logger.info("결제 등록 paymentWrite - DAO");

		sqlSession.insert(NAME_SPACE + ".paymentWrite", paymentDTO);
	}
	
	//결제 내역 목록
	@Override
	public List<PaymentDTO> paymentList(PaymentDTO paymentDTO) throws Exception {
		
		logger.info("결제 내역 목록 paymentList - DAO");
		
		return sqlSession.selectList(NAME_SPACE + ".paymentList", paymentDTO);
	}
}
