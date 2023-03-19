package com.project.product.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.product.dao.ProductDAO;
import com.project.product.domain.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService { 

	private static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Autowired
	private ProductDAO productDAO;

	//상품 게시글 등록하기
	@Override
	public void productWrite(ProductDTO productDTO) throws Exception {

		logger.info("상품 게시글 등록하기 productWrite - Service");
		
		productDAO.productWrite(productDTO);
	}
	//상품 게시글 삭제하기
	@Override
	public void productDelete(int pno) throws Exception {

		logger.info("상품 게시글 삭제하기 productDelete - Service");
		
		productDAO.productDelete(pno);
	}
	
	//상품 게시글 수정하기
	@Override
	public void productUpdate(ProductDTO productDTO) throws Exception {

		logger.info("상품 게시글 수정하기 productUpdate - Service");
		
		productDAO.productUpdate(productDTO);
	}
	
	//상품 게시글 상세 조회
	@Override
	public ProductDTO productView(int pno) throws Exception {

		logger.info("상품 게시글 상세조회 productDetail - Service");
		
		return productDAO.productView(pno);
	}
	
	//상품 게시글 목록
	@Override
	public List<ProductDTO> productList() throws Exception {

		logger.info("상품 게시글 목록 조회 productList - Service");
		
		return productDAO.productList();
	}
	
	// -------------------------------------관리자-------------------------------------
	// 상품 목록 : 검색 + 페이징 + 리스트
	@Override
	public List<ProductDTO> getProductList(int displayTotalContent, int pageContent, String searchType, String keyword) throws Exception {
		
		logger.info("상품 전체 리스트 출력(관리자)");
		
		return productDAO.getProductList(displayTotalContent, pageContent, searchType, keyword);
	}
	
	// 검색 결과 갯수 출력
	@Override
	public int totalSearchProduct(String searchType, String keyword) throws Exception {
		
		logger.info("검색 결과에 따른 상품 목록 출력 (관리자)");
		
		return productDAO.totalSearchProduct(searchType, keyword);
	}
	
	// 관리자 상품 삭제
	@Override
	public void adminProductDelete(int pno) throws Exception {
		
		logger.info("관리자 상품 삭제 service");
		
		productDAO.adminProductDelete(pno);
		
	}
}
