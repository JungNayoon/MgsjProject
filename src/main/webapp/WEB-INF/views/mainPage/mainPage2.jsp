<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MgsjMall</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="/resources/mainpage/main.css">
</head>
<body>
	<div class="wrap">
		<!--공통 헤더 영역-->
		<div id="header">
			<header>
				<div id="gnb">
					<!--상단 로고-->
					<div class="mgsjlogo" align="center">
						<a href="/mainPage/mainPage">
							<img src="/resources/mainpage/MGSJlogo.png" width="125px" height="125px">
						</a>
					</div>
					<!--검색창-->
					<div class="search" align="center">
						<div>
							<i class="bi bi-search" style="font-size: 40px;"></i>
							<input class="search_box" type="text" />
						</div>
					</div>
					<!--유틸메뉴-->
					<c:choose>
						<%-- 관리자 --%>
						<c:when test="${(memberInfo.userVerify) == 128}">
							<div class="gnb-utilmenu">
								<a href="/admin/memberManagement?pageNum=1" title="관리자 회원 관리 페이지">
									<i class="bi bi-bookmark-star-fill" style="font-size: 30px;"></i>
								</a>
								<a href="/admin/productManagement?pageNum=1" title="관리자 상품 관리 페이지">
									<i class="bi bi-box-seam-fill" style="font-size: 30px;"></i>
								</a>
								<a href="#" title="로그 기록 확인 페이지">
									<i class="bi bi-clock-history" style="font-size: 30px;"></i>
								</a>
								<a href="javascript:memberLogout()" title="로그아웃">
									<i class="bi bi-door-open" style="font-size: 30px;"></i>
								</a>
							</div>
						</c:when>
						<%-- 회원 --%>
						<c:when test="${(memberInfo.userVerify) == 0 }">
							<div class="gnb-utilmenu">
								<a href="/member/memberModifyPage" title="회원정보수정">
									<i class="bi bi-person-fill" style="font-size: 30px;"></i>
								</a>
								<a href="/cart/cartList" title="주문내역">
									<i class="bi bi-cart" style="font-size: 30px;"></i>
								</a>
								<a href="#" title="활동 기록">
									<i class="bi bi-clock-history" style="font-size: 30px;"></i>
								</a>
								<a href="javascript:memberLogout()" title="로그아웃">
									<i class="bi bi-door-open" style="font-size: 30px;"></i>
								</a>
							</div>
						</c:when>
						<%-- 판매자 --%>
						<c:when test="${(memberInfo.userVerify) == 5 }">
							<div class="gnb-utilmenu">
								<a href="/member/memberModifyPage" title="판매자 정보 수정">
									<i class="bi bi-person-fill" style="font-size: 30px;"></i>
								</a>
								<a href="/cart/cartList" title="판매상품내역">
									<i class="bi bi-cart" style="font-size: 30px;"></i>
								</a>
								<a href="/product/productWritePage" title="판매상품등록 및 관리하기">
									<i class="bi bi-check-all" style="font-size: 30px;"></i>
								</a>
								<a href="#" title="활동 기록">
									<i class="bi bi-clock-history" style="font-size: 30px;"></i>
								</a>
								<a href="javascript:memberLogout()" title="로그아웃">
									<i class="bi bi-door-open" style="font-size: 30px;"></i>
								</a>
							</div>
						</c:when>
						<%-- 비회원 --%>
						<c:otherwise>
							<div class="gnb-utilmenu">
								<a href="/member/memberLoginPage" title="로그인">
									<i class="bi bi-person-fill" style="font-size: 30px;"></i>
								</a>
							</div>
						</c:otherwise>
					</c:choose>

					<!--네비게이션토글-->
					<div class="gnb-navmenu">
						<ul>
							<li class="dropdown">
								<a href="javascript:void(0)" class="dropbtn">
									<i class="bi bi-list"></i>
								</a>
								<div class="dropdown-content">
									<a href="#">식품</a>
									<a href="#">의류</a>
									<a href="#">생활용품</a>
									<a href="#">반려동물</a>
									<a href="#">아동</a>
									<a href="#">가전/디지털</a>
									<a href="#">스포츠</a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</header>
		</div>

		<!--비공통 영역-->
		<div id="main">
			<div class="contents">
				<!--배너-->
				<div class="banner">
					<div class="slideshow-container">
						<a class="prev" onclick="plusSlides(-1)">&lt;</a>
						<a class="next" onclick="plusSlides(1)">&gt;</a>
						<div class="mySlides fade">
							<img src="${pageContext.request.contextPath}/resources/mgsjimages/mainimages/banner1.jpg">
						</div>
						<div class="mySlides fade">
							<img src="${pageContext.request.contextPath}/resources/mgsjimages/mainimages/banner2.jpg">
						</div>
						<div class="mySlides fade">
							<img src="${pageContext.request.contextPath}/resources/mgsjimages/mainimages/banner3.jpg">
						</div>
						<div class="mySlides fade">
							<img src="${pageContext.request.contextPath}/resources/mgsjimages/mainimages/banner4.jpg">
						</div>
						<div class="mySlides fade">
							<img src="${pageContext.request.contextPath}/resources/mgsjimages/mainimages/banner5.jpg">
						</div>
						<div class="mySlides fade">
							<img src="${pageContext.request.contextPath}/resources/mgsjimages/mainimages/banner6.jpg">
						</div>

						<div class="dots" style="text-align: center">
							<span class="dot" onclick="currentSlide(1)"></span>
							<span class="dot" onclick="currentSlide(2)"></span>
							<span class="dot" onclick="currentSlide(3)"></span>
							<span class="dot" onclick="currentSlide(4)"></span>
							<span class="dot" onclick="currentSlide(5)"></span>
							<span class="dot" onclick="currentSlide(6)"></span>
						</div>

					</div>
				</div>

				<!--핫딜-->
				<div class="item4">
					<div class="hotdeal">
						<img src="${pageContext.request.contextPath}/resources/mgsjimages/mainimages/백수커햄.png">
					</div>
				</div>
			</div>

			<!--상품-->
			<div class="item">
				<p>ITEM</p>
				<div class="product_list_box">
					<c:forEach var="mainPageProductList" items="${mainPageProductList }">
						<div class="product">
							<div>
								<img src="${mainPageProductList.storedFileName }" alt="상품이미지로딩실패">
								<br>
								<a href="/product/productView?pno=${mainPageProductList.pno }" class="product_name">${mainPageProductList.productName }</a>
								<br>
								<p class="product_price">${mainPageProductList.productPrice }원</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

		</div>
	</div>
	<!--푸터 영역-->
	<footer>
		<div class="company">
			<div class="corporate">
				<span>고객센터</span>
				<i class="bi bi-headset"></i> <i>1234-5678</i>
			</div>
			<div class="corporate-txt">
				<p>대표자 : 이젠3조 | 서울특별시 종로구 | 사업자등록번호 : 000-00-00000</p>
				<br>
				<p>
					<a href="mailto:3teamproject@example.com">3teamproject@example.com</a>
					&nbsp;&nbsp;| FAX : 02-0000-0000
				</p>
				<address>&copy;Copyright 2023. ezen3projectteam. All rights reserved.</address>
			</div>
		</div>
	</footer>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/mainpage/main.js"></script>
</body>
</html>
