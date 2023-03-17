package com.project.product.dao;

import java.util.List;

import com.project.product.domain.ProductDTO;

public interface ProductDAO {
	
	// 상품 게시글 등록하기
	public void productWrite(ProductDTO productDTO) throws Exception;
	
	// 상품 게시글 삭제하기
	public void productDelete(int pno) throws Exception;
	
	// 상품 게시글 수정하기
	public void productUpdate(ProductDTO productDTO) throws Exception;
	
	// 상품 게시글 상세조회
	public ProductDTO productView(int pno) throws Exception;
	
	// 상품 게시글 목록
	public List<ProductDTO> productList() throws Exception;
	
	// -------------------------------------관리자-------------------------------------
	// 상품 목록 : 검색 + 페이징 + 리스트
	public List<ProductDTO> getProductList(int displayTotalContent, int pageContent, String searchType, String keyword) throws Exception;
	
	// 상품 검색 결과 갯수 출력
	public int totalSearchProduct(String searchType, String keyword) throws Exception;
}
