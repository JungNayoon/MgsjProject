package com.project.product.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.product.dao.CategoryDAO;
import com.project.product.domain.CategoryDTO;

@Service
public class CategoryServiceImpl implements CategoryService {

	private static final Logger logger = LoggerFactory.getLogger(CategoryServiceImpl.class);

	@Autowired
	private CategoryDAO categoryDAO;

	// 카테고리 등록
	@Override
	public void categoryWrite(CategoryDTO categoryDTO) throws Exception {

		logger.info("카테고리 등록 categoryWrite - Service");

		categoryDAO.categoryWrite(categoryDTO);
	}

	//카테고리별 품목 조회
	@Override
	public List<CategoryDTO> categoryView(int cno) throws Exception {

		logger.info("카테고리 조회 categoryView - Service");

		return categoryDAO.categoryView(cno);
	}

	// 카테고리 수정
	@Override
	public void categoryUpdate(CategoryDTO categoryDTO) throws Exception {

		logger.info("카테고리 수정 categoryUpdate - Serivce");

		categoryDAO.categoryUpdate(categoryDTO);
	}

	// 카테고리 삭제
	@Override
	public void categoryDelete(int cno) throws Exception {

		logger.info("카테고리 삭제 categoryDelete - Service");

		categoryDAO.categoryDelete(cno);
	}

	// 카테고리 목록
	@Override
	public List<CategoryDTO> categoryList() throws Exception {

		logger.info("카테고리 목록 categoryList - Service");

		return categoryDAO.categoryList();
	}

	// 카테고리 목록에 의한 1차 상품 출력
	@Override
	public List<CategoryDTO> categoryDetailProduct1() throws Exception {

		logger.info("카테고리 목록에 대한 1차 상품 출력 categoryDetailProduct1 - service");

		return categoryDAO.categoryDetailProduct1();
	}
	
	// 카테고리 목록에 대한 2차 상품 출력
	@Override
	public List<CategoryDTO> categoryDetailProduct2() throws Exception {

		logger.info("카테고리 목록에 대한 2차 상품 출력 categoryDetailProduct2 - service");
		
		return categoryDAO.categoryDetailProduct2();
	}
}
