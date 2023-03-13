package com.project.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.review.domain.ReviewBoardDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	private static final Logger logger = LoggerFactory.getLogger(ReviewDAOImpl.class);
 
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAME_SPACE = "mappers.reviewMapper";
	
	//리뷰 등록
	@Override
	public void reviewWrite(ReviewBoardDTO reviewBoardDTO) throws Exception {
		
		logger.info("리뷰 등록 reviewWrite - DAO");
		
		sqlSession.insert(NAME_SPACE + ".reviewWrite", reviewBoardDTO);
	}
	
	//리뷰 조회
	@Override
	public ReviewBoardDTO reviewView(int rvno) throws Exception {
		
		logger.info("리뷰 조회 reviewView - DAO");
		
		return sqlSession.selectOne(NAME_SPACE + ".reviewView", rvno);
	}
	//리뷰 수정
	@Override
	public void reviewUpdate(ReviewBoardDTO reviewBoardDTO) throws Exception {
		
		logger.info("리뷰 수정 reviewUpdate - DAO");
		
		sqlSession.update(NAME_SPACE + ".reviewUpdate", reviewBoardDTO);
	}
	
	//리뷰 삭제
	@Override
	public void reviewDelete(int rvno) throws Exception {
		
		logger.info("리뷰 삭제 reviewDelete - DAO");
		
		sqlSession.delete(NAME_SPACE + ".reviewDelete", rvno);
	}
	
	//리뷰 목록
	@Override
	public List<ReviewBoardDTO> reviewList(int pno) throws Exception {
		
		logger.info("리뷰 목록 reviewList - DAO");
		
		return sqlSession.selectList(NAME_SPACE + ".reviewList", pno);
	}
}
