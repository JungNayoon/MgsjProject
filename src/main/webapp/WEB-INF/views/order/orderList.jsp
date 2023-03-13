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
<html>
<head>
  <meta charset="UTF-8">


  <title>주문정보</title>

  <link rel="stylesheet" href="${contextPath}/resources/order/order.css">
  <script src="${contextPath}/resources/order/order.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

  <!--공통 헤더 영역-->
  <div id="header">
    <header>
        <div id="gnb">
            <!--상단 로고-->
            <a href="#">
                <h1>MGSJ</h1>
            </a>
            <!--검색창-->
            <div class="search">
                <button type="submit"><i class="bi bi-search" style="font-size: 25px;"></i></button>
                <input class="search_box" type="text" />
            </div>
            <!--유틸메뉴-->
            <div class="gnb-utilmenu">
                <a href="/login/login.html"><i class="bi bi-person-fill" style="font-size: 30px;"></i></a>
                <a href="/cart.html"><i class="bi bi-cart" style="font-size: 30px;"></i></a>
                <a href="#"><i class="bi bi-clock-history" style="font-size: 30px;"></i></a>
            </div>
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
                <li><a href="pickup.html#pickup-01">현재 픽업 가능</a></li>
                <li><a href="pickup.html#pickup-02">1시간 내 픽업 가능</a></li>
                <li><a href="pickup.html#pickup-03">3시간 내 픽업 가능</a></li>
            </ul>
        </div>
    </header>
</div>

  <div class="order-wrap">
    <h2>My주문내역</h2>
    <hr>
    <div class="order-det">
      <!-- 주문목록틀 -->
      <table width="100%">
        <caption>일반 주문내역</caption>
        <colgroup>
          <col width="60px" />
          <col width="150px"/>
          <col width="60px" />
          <col width="60px" />
          <col width="80px" />
          <col width="60px" />
        </colgroup>
        <thead>
          <tr>
            <th class="first">주문일자</th>
            <th scope="col">주문 상품 정보</th>
            <th scope="col">상품금액(수량)</th>
            <th scope="col">배송</th>
            <th scope="col">주문상태</th>
            <th scope="col">확정/취소/리뷰</th>
          </tr>
        </thead>
        <!-- 주문목록틀 -->
        
        <!-- 주문목록 데이터 -->
        <tbody>
        <c:forEach var = "orderList" items = "${orderList}">
          <tr>
            <!-- 주문일자 -->
            <td class="first" rowspan="1">
              
              <fmt:formatDate value = "${orderList.orderDate}" pattern = "yyyy-MM-dd"/>  <!-- 실전에선 주문일자 값을 받아와야됨 -->
             
            </td>
            <!-- 상품정보 -->
            <td>
              <div class="cont">
                <p>
                  <span class="ic-lowprice">
                    <em>최저가</em>
                  </span>
                </p>
                <p>
                  <a>${orderList.productName}</a> <!-- 상품 타이틀 이름 마찬가지로 상품 값을 받아와야함 htef=로 상품 클릭시 해당 url로 가게 -->
                </p>
                <!-- 상품 주문 옵션 -->
              </div>
            </td>
            <!-- 주문금액 -->
            <td>
              <p class="fnt-1">
                <strong>${orderList.productPrice}</strong><span> (${orderList.productCnt}개)</span>
              </p>
            </td>
            
            <!-- 배송비 -->
            <td rowspan="1">
              <p class="fnt-2">무료(Ezen통운)</p>
            </td>
            <!-- 배송 -->
            <td class="td-center">
              <span class="fc-blue">배송중</span>
              <span class="post-btn">
                <button class="open">배송조회</button>
                <div class="modal">
                  <div class="modal-content">
                    <label>배송현황</label>
                    <button class="close" type="submit">Close</button>
                  </div>
                </div>
                
                <script src="${contextPath}/resources/order/modal.js"></script>
              </span>
            </td>
            <!-- 주문상태 -->
            <td>
              <div class="ord-con">
                <button type ="button" class = "btn btn-warning" onclick ="deleteOrder('${orderList.orderNum}')">취소</button><br>
                <a href="/member/memberModifyPage">내정보</a><br>
                <a href="/product/productView?pno=${orderList.pno}"><button>리뷰</button></a>
              </div>
            </td>
          </tr>
          </c:forEach>
        </tbody>
        <!-- 주문목록 데이터 -->
      </table>
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
</body>
</html>