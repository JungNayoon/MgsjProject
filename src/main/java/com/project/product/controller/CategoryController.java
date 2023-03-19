package com.project.product.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.product.domain.CategoryDTO;
import com.project.product.service.CategoryService;

import net.sf.json.JSONArray;

@Controller
public class CategoryController {

	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);

	@Autowired
	private CategoryService categoryService;

	// 카테고리 등록 페이지
	@RequestMapping(value = "/category/categoryWritePage", method = RequestMethod.GET)
	public String categoryWritePage() throws Exception {

		logger.info("카테고리 등록 categoryWritePage - Controller");

		return "/category/categoryWritePage";
	}

	// 카테고리 등록
	@RequestMapping(value = "/category/categoryWrite", method = RequestMethod.POST)
	public String categoryWrite(CategoryDTO categoryDTO) throws Exception {

		logger.info("카테고리 등록하기 categoryWrite - Controller");

		categoryService.categoryWrite(categoryDTO);

		return "redirect:/category/categoryList";

	}

	// 카테고리별 품목 조회
	@RequestMapping(value = "/category/categoryPro", method = RequestMethod.GET)
	public void categoryView(@RequestParam("cno") int cno, Model model, CategoryDTO categorydto) throws Exception {

		logger.info("카테고리별 상품 조회 categoryView - Controller");

		List<CategoryDTO> categoryDTO = categoryService.categoryView(cno);

		List<CategoryDTO> categoryList1 = categoryService.categoryDetailProduct1();

		List<CategoryDTO> categoryList2 = categoryService.categoryDetailProduct2();

		model.addAttribute("categoryList1", categoryList1);

		model.addAttribute("categoryList2", categoryList2);

		model.addAttribute("categoryDTO", categoryDTO);

	}

	// 카테고리 수정
	@RequestMapping(value = "/category/categoryUpdate", method = RequestMethod.POST)
	public String categoryUpdate(CategoryDTO categoryDTO) throws Exception {

		logger.info("카테고리 수정 categoryUpdate - Controller");

		categoryService.categoryUpdate(categoryDTO);

		return "redirect:/category/categoryList";
	}

	// 카테고리 삭제
	@RequestMapping(value = "/category/categoryDelete", method = RequestMethod.POST)
	public String categoryDelete(int cno) throws Exception {

		logger.info("카테고리 삭제 categoryDelete - Controller");

		categoryService.categoryDelete(cno);

		return "redirect:/category/categoryList";

	}

	// 카테고리 목록에 대한 상품 출력
	@RequestMapping(value = "/pageIngredient/header", method = RequestMethod.GET)
	public void categoryList(Model model) throws Exception {

		logger.info("카테고리 목록 categoryList - Controller");

		List<CategoryDTO> categoryList1 = categoryService.categoryDetailProduct1();

		List<CategoryDTO> categoryList2 = categoryService.categoryDetailProduct2();

		model.addAttribute("categoryList1", categoryList1);

		model.addAttribute("categoryList2", categoryList2);

	}

}
