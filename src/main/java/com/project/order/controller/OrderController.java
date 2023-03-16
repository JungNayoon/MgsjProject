package com.project.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.member.domain.MemberAddressDTO;
import com.project.member.domain.MemberDTO;
import com.project.order.domain.OrderDTO;
import com.project.order.domain.OrderDetailDTO;
import com.project.order.service.OrderService;
import com.project.product.domain.CartDTO;
import com.project.product.service.CartService;

@Controller
public class OrderController {

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	@Autowired
	private OrderService orderService;

	@Autowired
	private CartService cartService;

	// 주문 작성 페이지
	@RequestMapping(value = "/order/orderPage", method = RequestMethod.GET)
	public String orderWritePage(String userId, 
			CartDTO cartDTO, 
			MemberAddressDTO memberAddressDTO, 
			Model model, HttpServletRequest req)
			throws Exception {

		logger.info("주문 작성 페이지 orderWirtePage - Controller");

		HttpSession session = req.getSession();

		MemberDTO memberLoginSession = (MemberDTO) session.getAttribute("memberInfo");

		if(memberLoginSession == null) {
			
			return "/member/memberLoginPage";
			
		} else {
			
			MemberAddressDTO memadd = orderService.memAddress(memberLoginSession.getUserId());
			
			List<CartDTO> cartList = cartService.cartList(cartDTO);
			
			model.addAttribute("cartList", cartList);
			
			model.addAttribute("memberAddress", memadd);
			
			return "/order/orderPage";
		}

	}

	// 주문 내역 상세 조회
	@RequestMapping(value = "/order/orderView", method = RequestMethod.GET)
	public String orderView(@RequestParam("orderNum") int orderNum, HttpServletRequest req, Model model, OrderDTO orderDTO, String userId) throws Exception {

		logger.info("주문 조회 orderView - Controller");

		HttpSession session = req.getSession();

		MemberDTO memberLoginSession = (MemberDTO) session.getAttribute("memberInfo");

		orderDTO.setUserId(memberLoginSession.getUserId());
		
		OrderDTO orderdetail = orderService.orderView(orderNum, userId);
		
		model.addAttribute("orderDetailDTO", orderdetail);
		
		return "/order/orderFinish";
	}
	

	// 주문 목록(orderdetailDTO(주문내역), orderDTO(주문주소내역))
	// 결제 완료후 주문 내역창에서 나오는 리스트
	@RequestMapping(value = "/order/orderList", method = RequestMethod.GET)
	public void orderList(HttpServletRequest req, OrderDTO orderDTO, Model model) throws Exception {

		logger.info(" 주문 목록 orderList - Controller");

		HttpSession session = req.getSession();

		MemberDTO memberLoginSession = (MemberDTO) session.getAttribute("memberInfo");

		orderDTO.setUserId(memberLoginSession.getUserId());

		List<OrderDTO> orderList = orderService.orderList(orderDTO);

		model.addAttribute("orderList", orderList);

	}
	

}
