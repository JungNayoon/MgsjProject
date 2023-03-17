<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>주문완료</title>
  <link rel="stylesheet" href="${contextPath}/resources/order/order-finish.css">
</head>
<script src="${contextPath}/resources/order/order-finish.js"></script>
<body>
  <div class="wrap">
    <h2>주문/결제</h2>
    <p>Ezen을 이용해주셔서 감사합니다.</p>
    <hr/>

    <div class="order">
      <!-- <div class="order-cont">
      </div> -->
      <div class="order-list">
        <p class="order-cont">결제내역</p>
        <div class="order-de">
        <c:set var = "total" value = "${orderDetailDTO.productPrice * orderDetailDTO.totalCnt}"/>
          <!-- 주문번호/일자 -->
          <p>제품번호 : ${orderDetailDTO.orderNum}</p>
          <p>제품이름 : ${orderDetailDTO.productName}&nbsp;외 ...</p>
          <p>가격 : ${orderDetailDTO.productPrice * orderDetailDTO.totalCnt}</p>
          <!-- <c:out value = "${total + 3000}"/> -->
          <hr/>
          <!-- 배송지 -->
          <span>배송지정보 : </span>
          <a>${orderDetailDTO.recipient}</a>
           <br>
           <br>
          <span>수취인 전화번호 : </span>
          <a>${orderDetailDTO.recipientPhone}</a>
          <hr/>
          <span> **수취인 주소** </span>
           <br>
           <br>
          <span>우편번호 : </span>
          <a>${orderDetailDTO.postAddress}</a>
          <br>
          <br>
          <span>주소 : </span>
          <a>${orderDetailDTO.detailAddress}&nbsp;${orderDetailDTO.detailAddress2}</a>
          <br>
          <hr/>
          <!-- 결제정보 -->
          <p>결제정보 : ${orderDetailDTO.paymentKind }</p>
          <p>카드정보 : ${orderDetailDTO.paymentCard }</p>
          <p>승인일시 : <fmt:formatDate value = '${orderDetailDTO.paymentRegDate}' pattern = 'yyyy년 MM월 dd일'/></p>
          <hr/>
          <!-- 주문상품 -->
        </div>
        <!-- 금액 -->
        <div class="order-last">
          <p>결제금액 : <c:out value = "${total + 3000}"/>&nbsp;원</p>
        </div>
      </div>
      <a href="/order/orderList"><button>주문목록</button></a>
    </div>
  </div>
</body>
</html>

