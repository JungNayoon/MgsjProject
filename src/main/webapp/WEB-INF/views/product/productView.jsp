<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
<title>${productDTO.productName}</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="${contextPath}/resources/product/js/animatescroll.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/product/product.css">
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
					<c:choose>
						<c:when test="${(memberInfo.userVerify) == 128 && (memberInfo != null) }">
							<!-- 관리자 -->
							<div class="gnb-utilmenu">
								<a href="/member/memberLoginPage" title="관리자 회원 관리 페이지">
									<i class="bi bi-bookmark-star-fill" style="font-size: 30px;"></i>
								</a>
								<a href="/cart.html" title="관리자 상품 관리 페이지">
									<i class="bi bi-box-seam-fill" style="font-size: 30px;"></i>
								</a>
								<a href="#" title="로그 기록 확인 페이지">
									<i class="bi bi-clock-history" style="font-size: 30px;"></i>
								</a>
							</div>
						</c:when>
						<c:when test="${(memberInfo.userVerify) == 0 && (memberInfo != null) }">
							<!-- 회원 -->
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
						<c:when test="${(memberInfo.userVerify) == 5 && (memberInfo != null) }">
							<!-- 판매자 -->
							<div class="gnb-utilmenu">
								<a href="/member/memberModifyPage" title="판매자 정보 수정">
									<i class="bi bi-person-fill" style="font-size: 30px;"></i>
								</a>
								<a href="/cart/cartList" title="판매상품내역">
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
						<c:otherwise>
							<!-- 비회원 -->
							<div class="gnb-utilmenu">
								<a href="/member/memberLoginPage" title="로그인">
									<i class="bi bi-person-fill" style="font-size: 30px;"></i>
								</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>

				<!--네비게이션토글-->
				<div class="gnb-navmenu">
					<ul>
						<li class="dropdown">
							<a href="javascript:void(0)" class="dropbtn">
								<i class="bi bi-list"></i>
							</a>
							<div class="dropdown-content">
								<c:forEach var="categoryList" items="${categoryList}">
									<a href="#" id="cateName">${categoryList.categoryName}</a>
								</c:forEach>
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

		<!--product 작업부분 시작-->
		<div class="main">
			<!--product 간략한 정보-->
			<div class="contents_simple">
				<div class="location">
					<div class="location_label">
						<label>
							<a href="/mainPage/mainPage">Shoppingmall</a>
						</label>
						&nbsp; &gt;
						<label>
							<a href="#">${productDTO.categoryName}</a>
						</label>
					</div>
				</div>
				<div class="product">
					<div class="product_lft">
						<div class="product_img">
							<!-- 
							private String originFileName;
							private String storedFileName;
							private String storedThumbNail;
						 -->
							<img id="resultimg" src="${productDTO.storedFileName }">
						</div>

					</div>

					<div class="product_rgt">
						<form id="form-cart" action="/cart/cartWrite" method="post">
							<!-- cart에 필요한 데이터 -->
							<input type="hidden" name="userId" value="${memberInfo.userId}" />
							<div class="product_info">
								<div class="product_num">
									<input type="hidden" name="pno" value="${productDTO.pno}" />
									제품번호 : ${productDTO.pno}
								</div>
								<div class="product_name">${productDTO.productName}</div>
								<hr>
								<div class="product_price">
									<fmt:formatNumber value="${productDTO.productPrice}" pattern="###,###,###" />
									원
								</div>
								<hr>
								<div class="product_delivery">
									배송 정보 : 3일 내 도착예정
									<br>
									배송비 : 무료
								</div>
							</div>
							<div class="product_option">
								<div class="product_amount">
									<span>구매수량</span>
									<p class="amount_pm">
										<button type="button" class="plus">+&nbsp;</button>
										<input type="number" class="numbox" min="1" max="${productDTO.productStock}" value="1" name="productCnt" readonly="readonly" />
										&nbsp;
										<button type="button" class="minus">-</button>
									</p>
								</div>
								<div class="nextbtn">
									<div class="cart">
										<a>
											<button type="submit" class="cart">장바구니</button>
										</a>
									</div>
									<div class="buy">
										<a href="/order/orderList">바로구매</a>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!--product 상세한 정보-->
			<div class="contents_detail">
				<nav id="scrolltab">
					<ul>
						<li>
							<a href="#" onclick="$('#box1').animatescroll();">상품상세정보</a>
						</li>
						<li>
							<a href="#" onclick="$('#box2').animatescroll();">리뷰</a>
						</li>
						<li>
							<a href="#" onclick="$('#box3').animatescroll();">제품문의</a>
						</li>
					</ul>
				</nav>
				<div class="contents_detail_wrap">
					<div id="box1">
						<div class="titlearea">상품상세정보</div>
						<div>${productDTO.productName}</div>
						<div>${productDTO.productPrice}</div>
						<div>${productDTO.productDescription}</div>
						<fmt:formatDate value="${productDTO.productRegDate}" pattern="yyyy-MM-dd" />
					</div>
					<div id="box2">
						<div class="titlearea">리뷰</div>
						<table class="review" align="center">
							<c:forEach var="reviewList" items="${reviewList}">
								<tr>
									<td class="review_content">
										<p class="comment_title">제목 : ${reviewList.rvTitle}</p>
										<!--리뷰제목-->
										<p class="comment_product">상품명 : ${reviewList.productName}</p>
										<!--제품이름-->
										<p class="comment_summary">리뷰 내용: ${reviewList.rvContent}</p>
										<!--리뷰내용-->
									</td>
									<td class="review_info">
										<p>작성자 : ${reviewList.rvWriter}</p>
										<p>
											등록일 :
											<fmt:formatDate value="${reviewList.rvRegDate}" pattern="yyyy-MM-dd" />
										</p>
									</td>
								</tr>
							</c:forEach>
						</table>
						<ul class="btn-group pagination">
							<li>
								<a href="#">
									<span>
										<i class="bi bi-arrow-left"></i>
									</span>
								</a>
								<a href="#">
									<span>1</span>
								</a>
								<a href="#">
									<span>2</span>
								</a>
								<a href="#">
									<span>3</span>
								</a>
								<a href="#">
									<span>4</span>
								</a>
								<a href="#">
									<span>5</span>
								</a>
								<a href="#">
									<span>
										<i class="bi bi-arrow-right"></i>
									</span>
								</a>
							</li>
						</ul>
					</div>
					<div id="box3">
						<div class="titlearea">제품문의</div>
						<table class="ask">
							<tr>
								<th width="40px">번호</th>
								<th width="80px">제품이름</th>
								<th width="80px">답변상태</th>
								<th width="240px">제목</th>
								<th width="80px">등록일</th>
							</tr>

							<c:forEach var="inquireList" items="${inquireList}">

								<tr>
									<td>${inquireList.askNum}</td>
									<td>${inquireList.productName}</td>
									<td>답변완료</td>
									<td>${inquireList.askTitle}</td>
									<td>
										<fmt:formatDate value="${inquireList.askRegDate}" pattern="yyyy-MM-dd" />
									</td>
								</tr>

							</c:forEach>
						</table>
						<ul class="btn-group pagination">
							<li>
								<a href="#">
									<span>
										<i class="bi bi-arrow-left"></i>
									</span>
								</a>
								<a href="#">
									<span>1</span>
								</a>
								<a href="#">
									<span>2</span>
								</a>
								<a href="#">
									<span>3</span>
								</a>
								<a href="#">
									<span>4</span>
								</a>
								<a href="#">
									<span>5</span>
								</a>
								<a href="#">
									<span>
										<i class="bi bi-arrow-right"></i>
									</span>
								</a>
							</li>
						</ul>
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
	</div>
	<!--product 작업부분 끝-->
</body>
<script>

       $(".plus").click(function(){
 			var num = $(".numBox").val();
  	var plusNum = Number(num) + 1;
   
   if(plusNum >= ${productDTO.productStock}) {
    $(".numBox").val(num);
   } else {
    $(".numBox").val(plusNum);          
   }
  });
  
  $(".minus").click(function(){
   var num = $(".numBox").val();
   var minusNum = Number(num) - 1;
   
   if(minusNum <= 0) {
    $(".numBox").val(num);
   } else {
    $(".numBox").val(minusNum);          
   }
});

          /*썸네일 변경*/
          $(document).ready(function(){
              $('#thumbnail_1').click(function(){
                  $('#resultimg').attr('src', '${contextPath}/resources/product/images/product_sample1.png');
              });
              $('#thumbnail_2').click(function(){
                  $('#resultimg').attr('src', '${contextPath}/resources/product/images/product_sample2.png');
              });
              $('#thumbnail_3').click(function(){
                  $('#resultimg').attr('src', '${contextPath}/resources/product/images/product_sample3.png');
              });
              $('#thumbnail_4').click(function(){
                  $('#resultimg').attr('src', '${contextPath}/resources/product/images/product_sample4.png');
              });
          });

              /*scrolltab 상단에 고정하기*/
              const nav = document.querySelector('#scrolltab');
              const navTop = nav.offsetTop;
              function fixNav(){
                  if(window.scrollY >= navTop){
                      document.body.classList.add('fixed-nav');
                      document.body.style.paddingTop = nav.offsetHeight + 'px';
                  } else{
                      document.body.classList.remove('fixed-nav');
                      document.body.style.paddingTop = 0;
                  }
              }
              window.addEventListener('scroll', fixNav);

</script>

</html>