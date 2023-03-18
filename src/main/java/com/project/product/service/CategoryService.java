package com.project.product.service;

import java.util.List;

import com.project.product.domain.CategoryDTO;

public interface CategoryService {

	// 카테고리 등록
	public void categoryWrite(CategoryDTO categoryDTO) throws Exception;

	//카테고리별 품목 조회
	public List<CategoryDTO> categoryView(int cno) throws Exception;

	// 카테고리 삭제
	public void categoryDelete(int cno) throws Exception;

	// 카테고리 수정
	public void categoryUpdate(CategoryDTO categoryDTO) throws Exception;

	// 카테고리 목록
	public List<CategoryDTO> categoryList() throws Exception;

	// 카테고리 목록에 대한 1차 상품 출력
	public List<CategoryDTO> categoryDetailProduct1() throws Exception;
	
	// 카테고리 목록에 대한 2차 상품 출력
	public List<CategoryDTO> categoryDetailProduct2() throws Exception;
}
