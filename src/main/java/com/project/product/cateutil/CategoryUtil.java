package com.project.product.cateutil;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.project.product.domain.CategoryDTO;
import com.project.product.service.CategoryService;

public class CategoryUtil {
	
	@Autowired
	private CategoryService categoryService;
	
	// 카테고리 출력 메소드
	public void totalCate(Model model) throws Exception {

		List<CategoryDTO> categoryList1 = categoryService.categoryDetailProduct1();

		List<CategoryDTO> categoryList2 = categoryService.categoryDetailProduct2();

		model.addAttribute("categoryList1", categoryList1);

		model.addAttribute("categoryList2", categoryList2);
	}
}
