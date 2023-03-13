package com.project.inquire.service;

import java.util.List;

import com.project.inquire.domain.InquireDTO;

public interface InquireService {

	//제품 문의 등록
	public void inquireWrite(InquireDTO inquireDTO) throws Exception;
	
	//제품 문의 조회
	public InquireDTO inquireView(int askNum) throws Exception;
	
	//제품 문의 수정
	public void inquireUpdate(InquireDTO inquireDTO) throws Exception;
	
	//제품 문의 삭제
	public void inquireDelete(int askNum) throws Exception;
	
	// 제품 문의 목록
	public List<InquireDTO> inquireList(int pno) throws Exception;
}
