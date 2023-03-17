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
<link rel="stylesheet" href="${contextPath}/resources/category/category.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>

<body>
	<div class="wrap">
		<!--공통 헤더 영역-->
		<div id="header">
			<header>
				<div id="gnb">
					<!--상단 로고-->
					<h1>
						<a href="/mainPage/mainPage">MGSJ</a>
					</h1>
					<!--검색창-->
					<div class="search">
						<button type="submit">
							<i class="bi bi-search" style="font-size: 25px;"></i>
						</button>
						<input class="search_box" type="text" />
					</div>
					<!--유틸메뉴-->
					<div class="gnb-utilmenu">
						<a href="#">
							<i class="bi bi-person-fill" style="font-size: 30px;"></i>
						</a>
						<a href="#">
							<i class="bi bi-cart" style="font-size: 30px;"></i>
						</a>
						<a href="#">
							<i class="bi bi-clock-history" style="font-size: 30px;"></i>
						</a>
					</div>
				</div>
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
						<li>
							<a href="pickup.html#pickup-01">현재 픽업 가능</a>
						</li>
						<li>
							<a href="pickup.html#pickup-02">1시간 내 픽업 가능</a>
						</li>
						<li>
							<a href="pickup.html#pickup-03">3시간 내 픽업 가능</a>
						</li>
					</ul>
				</div>
			</header>
		</div>
		<!-- 
					categorydto 테이블
					categoryName	varchar(20)
					cno	int
					categoryLevel	int 
				-->
		<!--비공통 영역-->
		<div class="category">
			<div class="category-left">

				<ul class="tabs">
					<!-- 현재는 대분류 카테고리만 만듬, 소분류 카테고리 만들어야함 -->
					<c:forEach var="categoryList" items="${categoryList}">
						<c:if test="${categoryList.level == 1}">
							<li>${categoryList.categoryName}</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>

			<div class="category-right">

				<div class="item">
					<h1>Category</h1>
					<c:forEach var="categoryList" items="${categoryList}">
						<!-- 대분류 카테고리, 소분류 카테고리를 클릭했을때 나올 상품 리스트 -->
						<c:if test="${categoryList.level == 1}">
							<div class="product_first">
								<div class="product">
									<img src="${contextPath}/resources/product/images/product_sample.png">
									<br>
									<a href="/product/productView?pno=${categoryList.pno}" class="product_name">${categoryList.productName}</a>
									<br>
									<p class="product_price">
										<fmt:formatNumber value="${categoryList.productPrice}" pattern="###,###,###" />
										원
									</p>
								</div>
							</div>
						</c:if>
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


	<script type="text/javascript">
		function deleteReviewList ( cno ) {
			let deleteYN = confirm ( "카테고리를 삭제하시겠습니까?" );

			if ( deleteYN == true ) {
				alert ( "삭제되었습니다" );
				location.href = "/category/categoryDelete?cno=" + cno;
			} else {
				alert ( "삭제가 취소되었습니다." );
			}
		}

		//컨트롤러에서 데이터 받기
		var jsonData = JSON.parse ( '${categoryList}' );
		console.log ( jsonData );

		var cate1Arr = new Array ();
		var cate1Obj = new Object ();

		//1차 분류 셀렉트 박스에 삽입할 데이터
		for ( var i = 0; i < jsonData.length; i++ ) {

			if ( jsonData[i].level == 1 ) {
				cate1Obj = new Object (); //초기화
				cate1Obj.cno = jsonData[i].cno;
				cate1Obj.categoryName = jsonData[i].categoryName;
				cate1Arr.push ( cate1Obj );
			}
		}

		//1차 분류 셀렉트 박스에 데이터
		var cate1Select = $ ( '.category1' )
		for ( var i = 0; i < cate1Arr.length; i++ ) {
			/*	cate1Select.append("<option value='" + cate1Arr[i].cno + "'>"
						+ cate1Arr[i].categoryName + "</option>"); */
			cate1Select.append ( "<c:forEach items = '"cate1Arr[i]"'>" + cate1Arr.categoryName + "</c:forEach>" );
		}

		$ ( document ).on ( "change" , "select.category1" , function () {

			var cate2Arr = new Array ();
			var cate2Obj = new Object ();

			//2차 분류 셀렉트 박스
			for ( var i = 0; i < jsonData.length; i++ ) {

				if ( jsonData[i].level == 2 ) {
					cate2Obj = new Object ();
					cate2Obj.cno = jsonData[i].cno;
					cate2Obj.categoryName = jsonData[i].categoryName;
					cate2Obj.categoryLevel = jsonData[i].categoryLevel;

					cate2Arr.push ( cate2Obj );
				}
			}

			var cate2Select = $ ( "select.category2" );
			/* 
			for(var i = 0; i < cate2Arr.length; i++) {
				cate2Select.append("<option value = '" + cate2Arr[i].cno +"'>"
									+ cate2Arr[i].categoryName + "</option>")
			} */

			cate2Select.children ().remove ();

			$ ( "option:selected" , this ).each ( function () {

				var selectVal = $ ( this ).val ();
				cate2Select.append ( "<option value=''>전체</option>" );

				for ( var i = 0; i < cate2Arr.length; i++ ) {
					if ( selectVal == cate2Arr[i].categoryLevel ) {
						cate2Select.append ( "<option value='" + cate2Arr[i].cno + "'>" + cate2Arr[i].categoryName + "</option>" );
					}
				}
			} );

		} );
	</script>

</body>
</html>