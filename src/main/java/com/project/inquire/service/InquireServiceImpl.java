package com.project.inquire.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.inquire.dao.InquireDAO;
import com.project.inquire.domain.InquireDTO;

@Service
public class InquireServiceImpl implements InquireService {

	private static final Logger logger = LoggerFactory.getLogger(InquireServiceImpl.class);
	
	@Autowired
	private InquireDAO inquireDAO;
	
	// 제품 문의 등록
	@Override
	public void inquireWrite(InquireDTO inquireDTO) throws Exception {
		
		logger.info("제품 문의 등록 inquireWrite - Service");
		
		inquireDAO.inquireWrite(inquireDTO);
	}
	// 제품 문의 조회
	@Override
	public InquireDTO inquireView(int askNum) throws Exception {
		
		logger.info("제품 문의 조회 inquireView - Service");
		

		return inquireDAO.inquireView(askNum);
	}
	// 제품 문의 수정
	@Override
	public void inquireUpdate(InquireDTO inquireDTO) throws Exception {
		
		logger.info("제품 문의 수정 inquireUpdate - Service");
		
		inquireDAO.inquireUpdate(inquireDTO);
	}
	// 제품 문의 삭제
	@Override
	public void inquireDelete(int askNum) throws Exception {
		
		logger.info("제품 문의 삭제 inquireDelete - Service");
		
		inquireDAO.inquireDelete(askNum);
	}
	// 제품 문의 목록
	@Override
	public List<InquireDTO> inquireList(int pno) throws Exception {
		
		logger.info("제품 문의 목록 inquireList - Service");
		
		return inquireDAO.inquireList(pno);
	}
}
