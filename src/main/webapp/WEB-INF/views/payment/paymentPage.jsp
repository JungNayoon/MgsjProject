<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>결제</title>

  <link rel="stylesheet" href="${contextPath}/resources/mainpage/main.css">
  <link rel="stylesheet" href="${contextPath}/resources/payment/payment.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
      <!--공통 헤더 영역-->
        
        
      <!-- 비공통 영역 -->
      <div class="payment-wrap">
        <form action="서버url" method="post" id="payment-form" name="payment-form">

          <div class="pay-title">
            <b>Payment</b>
          </div>
          
          <br>
          <!-- 주문시 주문정보  -->
          <div class="pay-product">
            <b class="pro-title product-name">상품명</b> <input type="text" id="product_name" name="product_name" value="${product_name}" readonly/>
            <br>
            <b class="pro-title">결제일자</b> <input type="text" id="order_date" name="order_date" value="${order_date}" readonly/>
            <br>
            <b class="pro-title">상품금액</b> <input type="text" id="product_name" name="product_name" value="${product_price}" readonly/>
          </div>
          <div class="pay-method">
            <b class="pro-title">결제수단</b> 
            <div class="pay-radio">
              <label><input id="pay-card" type="radio" name="paymethod" value="card">카드</label>
              <label><input id="pay-cash" type="radio" name="paymethod" value="cash">계좌이체</label>
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
              <b class="pro-title">유효기간</b> <input type="date" id="card_date" name="card_date"/>
            </div>
            <br>
            <div class="card-info">
              <b class="pro-title">카드번호</b> <input type="text" id="card_num" name="card_num"/>
              <b class="cd-pw">비밀번호</b><input type="number" id="card_pwd" name="card_pwd" placeholder="카드 비밀번호"/>
            </div>
          </div>
          
          <div class="payment-btn">
            <button type="button" onclick="payment()">결제하기</button>
          </div>
          
        </form>
        <hr>
        <div class="pay-bot">ezen.com</div>
      </div>
      <!-- 비공통 영역 -->
      
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
<script src="${contextPath}/resources/payment/payment.js"></script>
</html>