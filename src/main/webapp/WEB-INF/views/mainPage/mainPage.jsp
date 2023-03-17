<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var = "contextPath" value = "${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>MGSJ</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<!-- 반응형 기능 -->
<link rel="stylesheet" href="${contextPath}/resources/mainpage/main.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../pageIngredient/header.jsp" flush="false"></jsp:include>
	<!-- header -->

	<div class="wrap">
		<!-- banner -->
		<div class="small-container-ba">
			<div class="row">
				<div class="swiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img src="${pageContext.request.contextPath}/resources/mgsjimages/mainimages/banner01.jpg">
						</div>
						<div class="swiper-slide">
							<img src="${pageContext.request.contextPath}/resources/mgsjimages/mainimages/banner02.jpg">
						</div>
						<div class="swiper-slide">
							<img src="${pageContext.request.contextPath}/resources/mgsjimages/mainimages/banner03.jpg">
						</div>
						<div class="swiper-slide">
							<img src="${pageContext.request.contextPath}/resources/mgsjimages/mainimages/banner04.jpg">
						</div>
						<div class="swiper-slide">
							<img src="${pageContext.request.contextPath}/resources/mgsjimages/mainimages/banner05.jpg">
						</div>
					</div>
					<div class="swiper-pagination"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
					<div class="swiper-scrollbar"></div>
				</div>
			</div>
		</div>
		<!-- banner -->

		<!---------------------------------------- item ---------------------------------------->
		<div class="small-container">
			<h2 class="title">먹고사는 즐거움</h2>
			<div class="row">
				<!-- 
             private String originFileName;
			private String storedFileName;
			private String storedThumbNail;
           -->
				<c:forEach var="mainPageProductList" items="${mainPageProductList }">
					<div class="col-4">
						<a href="/product/productView?pno=${mainPageProductList.pno }">
							<img src="${mainPageProductList.storedFileName }" alt="상품이미지로딩실패" width="250px" height="250px">
						</a>
						<br>
						<a href="/product/productView?pno=${mainPageProductList.pno }" class="product_name"><b>${mainPageProductList.productName }</b></a>
						<br>
						<p class="product_price">${mainPageProductList.productPrice }원</p>
						<div class="rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-half-o"></i> <i class="fa fa-star-o"></i>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="small-container">
			<h2 class="title">많이 구매한 제품</h2>
			<div class="row">
				<c:forEach var="mainPageProductList" items="${mainPageProductList }">
					<div class="col-4">
						<img src="${mainPageProductList.storedFileName }" alt="상품이미지로딩실패">
						<br>
						<a href="/product/productView?pno=${mainPageProductList.pno }" class="product_name"><b>${mainPageProductList.productName }</b></a>
						<br>
						<p class="product_price">${mainPageProductList.productPrice }원</p>
						<div class="rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-o"></i>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

	</div>

	<!-- footer -->
	<jsp:include page="../pageIngredient/footer.jsp" flush="false"></jsp:include>
	<!-- footer -->


	<!-- 배너 js -->
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

</body>
</html>