package com.project.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.member.domain.MemberDTO;
import com.project.product.domain.CartDTO;
import com.project.product.domain.ProductDTO;
import com.project.product.service.CartService;
import com.project.product.service.ProductService;

@Controller
public class CartController {

	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired
	private CartService cartService;

	@Autowired
	private ProductService productService;
/*
	// 장바구니 등록하기 페이지
	@RequestMapping(value = "/cart/cartWritePage", method = RequestMethod.GET)
	public String cartWritePage(@RequestParam("pno") int pno, Model model) throws Exception {

		logger.info("장바구니 등록하기 cartWritePage - Controller");

		// 제품 번호를 가져와서 입력시켜줘야한다...
		ProductDTO productView = productService.productView(pno);

		model.addAttribute("product", productView);

		return "/cart/cartWritePage";
	}

	@RequestMapping(value = "/cart/cartWritePage", method = RequestMethod.POST)
	@ResponseBody
	public boolean cartWritePage(
			@RequestParam("pno") int pno,
			@RequestParam ("userId") String userId,
			Model model,
			HttpServletRequest req
			) throws Exception {
		
		logger.info("장바구니 등록하기 cartWritePage - Controller");
		
		HttpSession session = req.getSession();
		
		MemberDTO memberLoginSession = (MemberDTO)session.getAttribute("memberInfo");
		
		if (memberLoginSession == null || memberLoginSession.getUserId() != userId) {
			
			return false;
			
		} else {
			
			return true;
		
		}
	}
*/
	// 장바구니 등록
	@ResponseBody
	@RequestMapping(value = "/cart/cartWrite", method = RequestMethod.POST)
	public boolean cartWrite(CartDTO cartDTO,
					@RequestParam ("pno") int pno,
					@RequestParam ("userId") String userId,
					HttpServletRequest req,
					HttpServletResponse resp) throws Exception {

		logger.info("장바구니 등록 cartWrite - Controller");
		
		HttpSession session = req.getSession();
		
		MemberDTO memberLoginSession = (MemberDTO)session.getAttribute("memberInfo");
		
		System.out.println("memberInfo의 값 ======" + memberLoginSession.getUserId());
		
		
		if (memberLoginSession == null || !memberLoginSession.getUserId().equals(userId)) {
			// 세션값이 없을때, 세션아이디값과 db에 있는 아이디값이 다를경우
			
			
			
			return false;
			
		} else {
			
			System.out.println(" 성공 ===== " + cartDTO);
		
			cartService.cartWrite(cartDTO);
			
			resp.sendRedirect("/product/productView?pno=" + pno);
			
			return true;
		}
		
	}

	// 장바구니 수정(비동기)
	// 앞단에서 장바구니 번호 받아오자
	@RequestMapping(value = "/cart/cartUpdate", method = RequestMethod.POST)
	public String cartUpdate(@RequestParam("cartNum") int cartNum, CartDTO cartDTO) throws Exception {

		logger.info("장바구니 수정 cartUpdate - Controller");

		cartService.cartUpdate(cartDTO);

		return "redirect:/cart/cartList?cartNum=" + cartNum;
	}

	// 장바구니 삭제
	// 장바구니 안의 항목 삭제
	@RequestMapping(value = "/cart/cartDelete", method = RequestMethod.POST)
	public String cartDelete(@RequestParam("cartNum") int cartNum) throws Exception {

		logger.info("장바구니 삭제 cartDelete - Controller");

		cartService.cartDelete(cartNum);

		return "redirect:/cart/cartList?cartNum=" + cartNum;
	}

	// 장바구니 목록
	@RequestMapping(value = "/cart/cartList", method = RequestMethod.GET)
	public void cartList(HttpServletRequest req, CartDTO cartDTO, Model model) throws Exception {

		logger.info("장바구니 목록 cartList - Controller");

		HttpSession session = req.getSession();

		MemberDTO memberLoginSession = (MemberDTO) session.getAttribute("memberInfo");

		cartDTO.setUserId(memberLoginSession.getUserId());

		List<CartDTO> cartList = cartService.cartList(cartDTO);

		model.addAttribute("cartList", cartList);

	}
}
