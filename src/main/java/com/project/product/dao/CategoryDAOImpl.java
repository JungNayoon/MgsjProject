package com.project.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.product.domain.CategoryDTO;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	private static final Logger logger = LoggerFactory.getLogger(CategoryDAOImpl.class);

	@Autowired
	private SqlSession sqlSession;

	private static final String NAME_SPACE = "mappers.categoryMapper";

	// 카테고리 등록
	@Override
	public void categoryWrite(CategoryDTO categoryDTO) throws Exception {

		logger.info("카테고리 등록 categoryWrite - DAO");

		sqlSession.insert(NAME_SPACE + ".categoryWrite", categoryDTO);
	}

	//카테고리별 품목 조회
	@Override
	public List<CategoryDTO> categoryView(int cno) throws Exception {

		logger.info("카테고리 조회 categoryView - DAO");

		return sqlSession.selectList(NAME_SPACE + ".categoryView", cno);
	}

	// 카테고리 수정
	@Override
	public void categoryUpdate(CategoryDTO categoryDTO) throws Exception {

		logger.info("카테고리 수정 categoryUpdate - DAO");

		sqlSession.update(NAME_SPACE + ".categoryUpdate", categoryDTO);
	}

	// 카테고리 삭제
	@Override
	public void categoryDelete(int cno) throws Exception {

		logger.info("카테고리 삭제 categoryDelete - DAO");

		sqlSession.delete(NAME_SPACE + ".categoryDelete", cno);
	}

	// 카테고리 목록
	@Override
	public List<CategoryDTO> categoryList() throws Exception {

		logger.info("카테고리 목록 categoryList - DAO");

		return sqlSession.selectList(NAME_SPACE + ".categoryList");
	}

	// 카테고리 목록에 의한 세부 상품 출력
	@Override
	public List<CategoryDTO> categoryDetailProduct1() throws Exception {

		logger.info("카테고리 목록에 의한 상품출력 categoryDetailProduct - DAO");

		return sqlSession.selectList(NAME_SPACE + ".categoryDetailProduct1");
		
	}
	// 카테고리 목록에 의한 세부 상품 출력
	@Override
	public List<CategoryDTO> categoryDetailProduct2() throws Exception {
		
		logger.info("카테고리 목록에 의한 상품출력 categoryDetailProduct - DAO");

		return sqlSession.selectList(NAME_SPACE + ".categoryDetailProduct2");
		
	}

}
