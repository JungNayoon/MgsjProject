<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.project.member.domain.MemberDTO"%>
<%
String cp = request.getContextPath();
request.setCharacterEncoding("UTF-8");

//쿠키 가져오기
Cookie[] ck = request.getCookies();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/pageIngredient/header/logout.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/resources/pageIngredient/header/header.css">
<link rel="stylesheet" href="/resources/pageIngredient/header/hambuger.css">
</head>
<body>
	<div class="header">
		<div class="container">
			<div class="navbar">
				<div class="logo">
					<a href="/mainPage/mainPage">
						<img src="/resources/pageIngredient/header/header-img/logo2.png" width="125px">
					</a>
				</div>

				<nav>
					<c:choose>
						<c:when test="${(memberInfo.userVerify) == 128 && (memberInfo != null) }">
							<%-- 관리자 --%>
							<ul id="MenuItems">
								<li>
									<a href="/admin/memberManagement?pageNum=1" title="관리자 회원 관리 페이지">
										<i class="bi bi-bookmark-star-fill" style="font-size: 30px;"></i>
									</a>
								</li>
								<li>
									<a href="/admin/productManagement?pageNum=1" title="관리자 상품 관리 페이지">
										<i class="bi bi-box-seam-fill" style="font-size: 30px;"></i>
									</a>
								</li>
								<li>
									<a href="#" title="로그 기록 확인 페이지">
										<i class="bi bi-clock-history" style="font-size: 30px;"></i>
									</a>
								</li>
								<li>
									<a href="javascript:memberLogout()" title="로그아웃">
										<i class="bi bi-door-open" style="font-size: 30px;"></i>
									</a>
								</li>
							</ul>
						</c:when>
						<c:when test="${(memberInfo.userVerify) == 0 && (memberInfo != null) }">
							<%-- 회원 --%>
							<ul id="MenuItems">
								<li>
									<a href="/member/memberModifyPage" title="회원정보수정">
										<i class="bi bi-person-fill" style="font-size: 30px;"></i>
									</a>
								</li>
								<li>
									<a href="/cart/cartList" title="주문내역">
										<i class="bi bi-cart" style="font-size: 30px;"></i>
									</a>
								</li>
								<li>
									<a type="button" title="활동기록" onclick="openHistory()">
										<i class="bi bi-clock-history" style="font-size: 30px;"></i>
									</a>
								</li>
								<li>
									<a href="javascript:memberLogout()" title="로그아웃">
										<i class="bi bi-door-open" style="font-size: 30px;"></i>
									</a>
									<!--최근 본 상품-->
									<div id="mySidenav" class="sidenav">
										<div class="sidenav_top">
											<a href="javascript:void(0)" class="closebtn" onclick="closeHistory()">&times;</a>
											<p>최근 본 상품</p>
										</div>

										<div class="sidenav_main">
											<div>
												<%
												if (ck != null) {
													for (Cookie c : ck) {
														if (c.getName().indexOf("sname") != -1) {
													out.println(java.net.URLDecoder.decode(c.getValue(), "UTF-8") + "<br>");
														}
													}
												}
												%>
											</div>
										</div>
									</div>
									<!--최근 본 상품-->
								</li>
							</ul>
						</c:when>
						<c:when test="${(memberInfo.userVerify) == 5 && (memberInfo != null) }">
							<%-- 판매자 --%>
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
							<ul id="MenuItems">
								<%-- 비회원 --%>
								<li>
									<a href="/member/memberLoginPage" title="로그인">
										<i class="bi bi-person-fill" style="font-size: 30px;"></i>
									</a>
								</li>
							</ul>
						</c:otherwise>
					</c:choose>
				</nav>

				<img src="/resources/pageIngredient/header/header-img/menu.png" class="menu-icon" onclick="menutoggle()">
			</div>
		</div>
	</div>
	<div id="header">
		<div class="ham-wrap">

			<input type="checkbox" id="check_box" />
			<label for="check_box">
				<span></span>
				<span></span>
				<span></span>
			</label>


			<!--상품카테고리 -->
			<div id="side_menu">
				<aside id="left">
					<h2>카테고리</h2>
					<ul>
						<li>
							<a href="./cloth.html" target="iframe1">
								<strong>과일</strong>
							</a>
							<ul class="dropdown_menu dropdown_menu_end">
								<li>
									<a href="#">사과/배</a>
								</li>
								<li>
									<a href="#">딸기/블루베리</a>
								</li>
								<li>
									<a href="#">귤/만감류</a>
								</li>
								<li>
									<a href="#">수박/멜론/참외</a>
								</li>
								<li>
									<a href="#">건과일</a>
								</li>
							</ul>
						<li>
							<a href="./food.html" target="iframe1">
								<strong>육류</strong>
							</a>
							<ul class="dropdown_menu dropdown_menu_end_1">
								<li>
									<a href="#">정육</a>
								</li>
								<li>
									<a href="#">계란/알류</a>
								</li>
								<li>
									<a href="#">닭/오리</a>
								</li>
								<li>
									<a href="#">소고기</a>
								</li>
								<li>
									<a href="#">돼지고기</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="./life.html" target="iframe1">
								<strong>야채</strong>
							</a>
							<ul class="dropdown_menu dropdown_menu_end_2">
								<li>
									<a href="#">양파/마늘/파</a>
								</li>
								<li>
									<a href="#">쌈채소</a>
								</li>
								<li>
									<a href="#">고추/피망</a>
								</li>
								<li>
									<a href="#">나물류</a>
								</li>
								<li>
									<a href="#">샐러드용</a>
								</li>
							</ul>
						</li>
					</ul>
				</aside>
			</div>


			<!--네비게이션토글-->
			<nav>
				<ul>
					<li>
						<a href="/order/orderList">My Order</a>
					</li>
					<li>
						<a href="/announcement/announcement?pageNum=1">NOTICE</a>
					</li>
					<li>
						<a href="/inquire/inquireList">Q &amp; A</a>
					</li>
				</ul>
			</nav>
			<!--네비게이션토글 끝-->



		</div>
	</div>
	<!------------js for toggle menu-------------->
	<script>
		let MenuItems = document.getElementById ( "MenuItems" );

		MenuItems.style.maxHeight = "0px";

		function menutoggle () {
			if ( MenuItems.style.maxHeight == "0px" ) {
				MenuItems.style.maxHeight = "200px"
			} else {
				MenuItems.style.maxHeight = "0px";
			}
		}
	</script>

</body>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/pageIngredient/header/history.js"></script>
</html>