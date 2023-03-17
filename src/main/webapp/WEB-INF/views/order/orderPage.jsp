<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%-- 액션(코어)태그 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- EL태그로 쓸것을 미리 만들어놓는 좋은 습관 기억하자 -->
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>주문 조회</title>
<link rel="stylesheet" href="${contextPath}/resources/order/order2.css">
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














		<form action="/payment/paymentWrite" method="post">
			<div class="container" align="center">
				<div class="main">
					<div class="titlearea">
						<p>주문하기</p>
					</div>
					<div class="orderarea">
						<div class="order_lft">
							<div class="itemcheck">
								<ul class="checkbtn1">
									<li>
										<span class="checkall">
											<input type="checkbox" id="allchk" name="allchk" />
											<label>전체선택</label>
										</span>
									</li>
								</ul>
								
							</div>

							<div class="itemview">
								<table>
									<colgroup>
										<col style="width: 70px">
										<col style="width: 140px">
										<col style="width: 210px">
										<col style="width: 140px">
										<col style="width: 140px">
									</colgroup>

									<tbody>
										<c:set var="total" value="0" />
										<c:forEach var="cartList" items="${cartList}">
											<tr>
												<td class="itemview_chk"><input type="checkbox" id="chkbox" name="chkbox" class="test" data-pno="${cartList.pno}"></td>
												<td class="itemview_thum"><a href="/product.html">
														<img src="/resources/product/images/product_sample.png">
													</a></td>
												<td class="itemview_info">

													<div>
														<!--  <span>제품번호 : </span><span class="product_num">00000</span><br> -->
														<span class="product_name">
															<input type = "hidden" name = "pno" value = "${cartList.pno}">
															<a href="${contextPath}/product/productView?pno=${orderDetailList.pno}">${cartList.productName}</a>
														</span>
													</div>

												</td>
												<td class="itemview_price">

													<div>
														<span>금액 : <input type = "text" name = "productPrice" value = "${cartList.productPrice}"></span>
														<span>원</span>
													</div>
													<div class="input-group">
														<span>주문개수 :</span>
														<input type="number" class="input-number" min="1" name="productCnt" value="${cartList.totalCnt}" onkeydown="javascript: return event.keyCode == 69 ? false : true" readonly="readonly">
													</div>
												</td>
											</tr>
											<c:set var="total" value="${total + (cartList.productPrice * cartList.totalCnt)}" />
										</c:forEach>
									</tbody>
								</table>
							</div>

							<div class="payment-wrap">

								<br> <br>
								<div class="pay-title">
									<b>Payment</b>
								</div>
								<%
								// order_date : value 출력용
								SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
								Calendar payCal = Calendar.getInstance();
								String paymentDate = date.format(payCal.getTime());
								%>
								<br>
								<!-- 주문시 주문정보  -->
								<div class="pay-product">
									<b class="pro-title">결제일자</b> <input type="text" id="order_date" value="<%=paymentDate.toString()%>" readonly /> <br>
									<div class="pay-method">
										<b class="pro-title">결제수단</b>
										<div class="pay-radio">
											<!-- 자바스크립트로 라디오타입의 value값을 따와서 text할 예정 -->
											<label>
												<input id="pay-card" type="radio" name="paymentKind" value ="카드" checked>카드
											</label>
											<label>
												<input id="pay-cash" type="radio" name="paymentTransfer" value = "계좌이체">계좌이체
											</label>
										</div>
									</div>
								</div>

								<div class="card-container">
									<div class="card-sel">
										<b class="pro-title">카드선택</b>
										<select>
											<option value="hyundai">현대카드</option>
											<option value="lotte">롯데카드</option>
											<option value="ezen">이젠카드</option>
										</select>
										<b class="pro-title">유효기간</b> <input type="date" id="card_date" name="card_date" />
									</div>
									<br>
									<div class="card-info">
										<b class="pro-title">카드번호</b> <input type="text" id="card_num" name="paymentCard" /> <b class="cd-pw">비밀번호</b><input type="number" id="card_pwd" name="card_pwd" placeholder="카드 비밀번호" />
									</div>
								</div>

								<div class="payment-btn">
									<button type="button" onclick="payment()">결제하기</button>
								</div>
							</div>
						</div>
					</div>


					<div class="userInfo">
						<div class="form-group">
							<div>
								<h2 align="center">주소 확인</h2>
							</div>
						</div>
						<!-- SELECT  c.pno, p.productName, p.productPrice, c.productCnt, member.userId -->

						<div class="form-group">
							<label for="subject" class="col-sm-2 control-label">회원아이디</label>
							<div class="col-sm-10">
								<input type="text" name="userId" maxlength="200" value="${memberInfo.userId}" readOnly>
							</div>
						</div>
						<div class="form-group">
							<label for="writer" class="col-sm-2 control-label">우편번호</label>
							<div class="col-sm-2">
								<input type="Number" class="checkDel" id="postAddress" name="postAddress" value="${memberAddress.postAddress}" maxlength="200" />
							</div>
						</div>
						<div class="form-group">
							<label for="writer" class="col-sm-2 control-label">상세주소1</label>
							<div class="col-sm-2">
								<input type="text" class="checkDel" id="detailAddress" name="detailAddress" value="${memberAddress.address}" maxlength="200" />
							</div>
						</div>
						<div class="form-group">
							<label for="writer" class="col-sm-2 control-label">상세주소2</label>
							<div class="col-sm-2">
								<input type="text" class="checkDel" id="detailAddress2" name="detailAddress2" value="${memberAddress.detailAddress}" maxlength="200" />
							</div>
						</div>
						<div class="form-group">
							<label for="writer" class="col-sm-2 control-label">수령인</label>
							<div class="col-sm-2">
								<input type="text" class="checkDel" id="recipient" name="recipient" value="${memberInfo.userId}" maxlength="200" />
							</div>
						</div>
						<div class="form-group">
							<label for="writer" class="col-sm-2 control-label">수령인 전화번호</label>
							<div class="col-sm-2">
								<input type="Number" class="checkDel" id="recipientPhone" name="recipientPhone" value="${memberAddress.userPhoneNumber}" maxlength="200" />
							</div>
						</div>

						<br> <input type='checkbox' id='my_checkbox' onclick='toggleTextbox(this)' />배송지 정보 직접입력
					</div>

					<!-- 유저 정보 저장 박스 끝 -->


					<div class="order_rgt">
						<div class="order_price">
							<div class="order_itemprice">
								<span>주문금액</span>
								<span>
									<c:out value="${total}" />
									원
								</span>
							</div>
							<div class="order_deliveryprice">
								<span>배송비</span>
								<span>3,000원</span>
							</div>
						</div>
						<hr>
						<div class="order_sum">
							<span>결제예정금액</span>
							<span><input type = "number" name = "paymentMoney" value = "${total}">${total + 3000}원</span>/span>
						</div>
						<a href="/payment/paymentPage">
							<button type="submit" class="btn_pay">
								<span>결제하기</span>
							</button>
						</a>
						<a href="/cart/cartList">
							<button type="button" class="btn_cart">
								<span>장바구니로 이동</span>
							</button>
						</a>
					</div>
				</div>

			</div>
		</form>
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

	<script>
		 $("#allchk").click(function(){
				var chk = $("#allchk").prop("checked");
			
				if(chk) {
					$(".test").prop("checked", true);
				} else {
					$(".test").prop("checked", false);
				}
			
			}); 
		
		
		function toggleTextbox(checkbox) {
			 
			var userInfoText = document.querySelectorAll('.checkDel');
			
			
			for (let i = 0; i < userInfoText.length; i++) {
					/* userInfoText[i].textContent = ""; */
					if(userInfoText[i].id == "postAddress") {
						userInfoText[i].value = checkbox.checked ? "" : '${memberAddress.postAddress}';
					} else if(userInfoText[i].id == "detailAddress") {
						userInfoText[i].value = checkbox.checked ? "" : '${memberAddress.address}';
					} else if(userInfoText[i].id == "detailAddress2") {
						userInfoText[i].value = checkbox.checked ? "" : '${memberAddress.detailAddress}';
					} else if(userInfoText[i].id == "recipient") {
						userInfoText[i].value = checkbox.checked ? "" : '${memberInfo.userId}';
					} else if(userInfoText[i].id == "recipientPhone") {
						userInfoText[i].value = checkbox.checked ? "" : '${memberAddress.userPhoneNumber}';
					}
				}
			}
			
		const groups = document.querySelectorAll('.input-group');

		        groups.forEach(group => {
		          const input = group.querySelector('.input-number');
		          const increaseBtn = group.querySelector('.btn-increase');
		          const decreaseBtn = group.querySelector('.btn-decrease');

		          increaseBtn.addEventListener('click', () => {
		            input.value = parseInt(input.value) + 1;
		          });

		          decreaseBtn.addEventListener('click', () => {
		            input.value = parseInt(input.value) - 1;
		          });
		        });
		        
		
		</script>
</body>
</html>