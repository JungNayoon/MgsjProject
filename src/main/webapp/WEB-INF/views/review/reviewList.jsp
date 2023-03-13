<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 액션(코어)태그 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- EL태그로 쓸것을 미리 만들어놓는 좋은 습관 기억하자 -->
<%
request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Notice</title>
    <link rel="stylesheet" href="${contextPath}/resources/review/review.css">
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
                        <button type="submit"><i class="bi bi-search" style="font-size: 25px;"></i></button>
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
                            <a href="javascript:void(0)" class="dropbtn"><i class="bi bi-list"></i></a>
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
                        <li><a href="#">당일 배송 가능</a></li>
                        <li><a href="#">1시간 내 픽업 가능</a></li>
                        <li><a href="#">3시간 내 픽업 가능</a></li>
                    </ul>
                </div>
            </header>
        </div>

        <!--비공통 영역-->
        <div class="board_wrap">
            <div class="board-title">
                <strong>리뷰</strong>
                <p>리뷰 페이지입니다</p>
            </div>
            <div class="board-list-wrap">
                <div class="board-list">
                    <table class="table">
                       <tr>
                       <th>게시글번호</th>
                       <th>제목</th>
                       <th>작성자</th>
                       <th>작성날짜</th>
                       <th id="boardLevel">게시글레벨</th>
                      <c:forEach var = "reviewList" items = "${reviewList}">
                       <tr>
                            <td id="bno" name="rvno">${reviewList.rvno}</td>
                            <td id="title" name="rvTitle">${reviewList.rvTitle}</td>
                            <td id="writer" name="rvWriter">${reviewList.rvWriter }</td>
                            <td id="reg_date" name="rvRegDate"><fmt:formatDate value = "${reviewList.rvRegDate}" pattern = "yyyy-MM-dd"/></td>
                            <td id="boardLevel" name="boardLevel"></td>
                       </tr>
                       </c:forEach>
                    </table>
                    
                </div>
                <div class="board-paging">
                    <ul>
                        <li id="allprev"><a href="#">&#60;&#60;</a></li>
                        <li id="prev"><a href="#">&#60;</a></li>
                        <li><a href="#" class="on">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li id="next"><a href="#">&#62;</a></li>
                        <li id="allnext"><a href="#">&#62;&#62;</a></li>
                    
                    </ul>
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
                    <p><a href="mailto:3teamproject@example.com">3teamproject@example.com</a>&nbsp;&nbsp;| FAX : 02-0000-0000</p>
                    <address>&copy;Copyright 2023. ezen3projectteam. All rights reserved.</address>
                </div>
            </div>

        </footer>

    </div>

</body>
</html>