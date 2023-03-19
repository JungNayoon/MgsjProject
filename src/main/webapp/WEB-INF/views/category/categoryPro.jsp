<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 정상적으로 로그인이 되었는지 확인할수있는 파라미터값 = result -->
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/category/category2.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../pageIngredient/header.jsp" flush="false"></jsp:include>
	<!-- header -->
	<!-- 
	categorydto 테이블
	categoryName	varchar(20)
	cno	int
	categoryLevel	int 
-->
	<!--비공통 영역-->
	<div class="category">
		<!-- 			<div class="category-right"> -->

		<!-- 				<div class="item"> -->
		<!-- 					<h1>Category 대분류</h1> -->
		<!-- 					<div class="category-left"> -->

		<!-- 				<ul class="tabs"> -->
		<!-- 					현재는 대분류 카테고리만 만듬, 소분류 카테고리 만들어야함 -->
		<%-- 					<c:forEach var="categoryList" items="${categoryList}"> --%>
		<%-- 						<c:if test="${categoryList.level == 1}"> --%>
		<%-- 							<li>${categoryList.categoryName}</li> --%>
		<%-- 						</c:if> --%>
		<%-- 					</c:forEach> --%>
		<!-- 				</ul> -->
		<!-- 			</div> -->
		<%-- 					<c:forEach var="categoryList" items="${categoryList}"> --%>
		<!-- 						대분류 카테고리, 소분류 카테고리를 클릭했을때 나올 상품 리스트 -->
		<%-- 						<c:if test="${categoryList.level == 1}"> --%>
		<!-- 							<div class="product_first"> -->
		<!-- 								<div class="product"> -->
		<%-- 									<img src="${contextPath}/resources/product/images/product_sample.png"> --%>
		<!-- 									<br> -->
		<%-- 									<a href="/product/productView?pno=${categoryList.pno}" class="product_name">${categoryList.productName}</a> --%>
		<!-- 									<br> -->
		<!-- 									<p class="product_price"> -->
		<%-- 										<fmt:formatNumber value="${categoryList.productPrice}" pattern="###,###,###" /> --%>
		<!-- 										원 -->
		<!-- 									</p> -->
		<!-- 								</div> -->
		<!-- 							</div> -->
		<%-- 						</c:if> --%>
		<%-- 					</c:forEach> --%>
		<!-- 				</div> -->
		<!-- 			</div> -->


		<div class="category-left">
			<div class="category-title">
				<h2>Category</h2>
				<br>
				<hr>
				<ul>
					<c:forEach var="categoryList1" items="${categoryList1}">
						<li>
							<a href="#" class="dropdown-btn">
								<c:out value="${categoryList1.categoryName}" />
							</a>
							<ul class="dropdown_menu dropdown_menu_end" style="display: none;">
								<c:forEach var="categoryList2" items="${categoryList2}">
									<c:if test="${categoryList2.categoryLevel == categoryList1.cno}">
										<li>
											<a href="/category/categoryPro?cno=${categoryList2.cno}" class="dorpdown-btn">
												<c:out value="${categoryList2.categoryName}" />
											</a>
										</li>
									</c:if>
								</c:forEach>
							</ul>
					</c:forEach>
					<li>
				</ul>
			</div>
		</div>
	
		<div class="small-container">

			<div class="row row-1">
				<h2>All Products</h2>
			</div>

		<c:forEach var = "categoryDTO" items = "${categoryDTO}">
			<div class="row">
				<div class="col-4">
					<a href="products-details.html">
						<img src="${categoryDTO.storedFileName}" alt="상품 이미지 로딩 실패">
					</a>
					<h4>${categoryDTO.productName}</h4>
					<p>${categoryDTO.productPrice}</p>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>

		<!-- footer -->
		<jsp:include page="../pageIngredient/footer.jsp" flush="false"></jsp:include>
		<!-- footer -->

		<script>
			var dropdown = document.getElementsByClassName ("dropdown-btn");
			var i;

			for (i = 0; i < dropdown.length; i++) {
				dropdown [i].addEventListener ("click" , function () {
					this.classList.toggle ("active");
					var dropdownContent = this.nextElementSibling;
					if (dropdownContent.style.display === "block") {
						dropdownContent.style.display = "none";
					} else {
						dropdownContent.style.display = "block";
					}
				});
			}
		</script>
</body>
</html>