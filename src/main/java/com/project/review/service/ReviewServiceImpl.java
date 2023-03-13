package com.project.review.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.review.dao.ReviewDAO;
import com.project.review.domain.ReviewBoardDTO;

@Service
public class ReviewServiceImpl implements ReviewService {

	private static final Logger logger = LoggerFactory.getLogger(ReviewServiceImpl.class);
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	//리뷰 등록 
	@Override
	public void reviewWrite(ReviewBoardDTO reviewBoardDTO) throws Exception {
		
		logger.info("리뷰 등록 reviewWrite - Service");
		
		
		reviewDAO.reviewWrite(reviewBoardDTO);
	}
	
	//리뷰 조회
	@Override
	public ReviewBoardDTO reviewView(int rvno) throws Exception {

		logger.info("리뷰 조회 reviewView - Service");
		
		return reviewDAO.reviewView(rvno);
	}
	
	//리뷰 수정
	@Override
	public void reviewUpdate(ReviewBoardDTO reviewBoardDTO) throws Exception {
		
		logger.info("리뷰 수정 reviewUpdate - Service");
		
		reviewDAO.reviewUpdate(reviewBoardDTO);
	}
	//리뷰 삭제
	@Override
	public void reviewDelete(int rvno) throws Exception {
		
		logger.info("리뷰 삭제 reviewDelete - Service");
		
		
		reviewDAO.reviewDelete(rvno);
	}
	
	//리뷰 목록
	@Override
	public List<ReviewBoardDTO> reviewList(int pno) throws Exception {
		
		logger.info("리뷰 목록 reviewList - Service");
		
		return reviewDAO.reviewList(pno);
	}
}
