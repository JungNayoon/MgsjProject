package com.project.product.dao;

import java.util.List;

import com.project.product.domain.CategoryDTO;

public interface CategoryDAO {

	// 카테고리 등록
	public void categoryWrite(CategoryDTO categoryDTO) throws Exception;

	// 카테고리 조회
	public CategoryDTO categoryView(int cno) throws Exception;

	// 카테고리 수정
	public void categoryUpdate(CategoryDTO categoryDTO) throws Exception;

	// 카테고리 삭제
	public void categoryDelete(int cno) throws Exception;

	// 카테고리 목록
	public List<CategoryDTO> categoryList() throws Exception;

	// 카테고리 목록에 의한 상품 출력
	public List<CategoryDTO> categoryDetailProduct() throws Exception;
}
