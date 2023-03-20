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

<!-- 헤더 -->        
<jsp:include page="../pageIngredient/header.jsp" flush="false"></jsp:include>

<!-- My 주문내역 -->
  <div class="order-wrap">
    <div class="order_title">My주문내역</div>
    <br>
    <div class="order-det">
      <!-- 주문목록틀 -->
      <table>
        <colgroup>
          <col width="60px" />
          <col width="60px"/>
          <col width="150px" />
          <col width="60px" />
          <col width="80px" />
          <col width="60px" />
        </colgroup>
        <thead>
          <tr>
          	<th>NO</th>
            <th class="first">주문일자</th>
            <th scope="col">주문 상품 정보</th>
            <th scope="col">상품금액(수량)</th>
            <th scope="col">배송상태</th>
            <th scope="col">결제 상세 내역</th>
          </tr>
        </thead>
        <!-- 주문목록틀 -->
        
        <!-- 주문목록 데이터 -->
        <tbody>
        <c:forEach var = "orderList" items = "${orderList}">
          <tr>
          	<!-- 주문 번호 -->
          	<td class="first" rowspan="1">${orderList.orderNum}</td>
          
            <!-- 주문일자 -->
            <td class="first" rowspan="1">
              <fmt:formatDate value = "${orderList.orderDate}" pattern = "yyyy-MM-dd HH시 mm분 ss초"/>  <!-- 실전에선 주문일자 값을 받아와야됨 -->
            </td>
            
            <!-- 주문 상품 정보 -->
            <td>
              <div class="cont">
                <p>
                  <a href = "/product/productView?pno=${orderList.pno}">${orderList.productName}</a>
                </p>
                <p>
                </p>
              </div>
            </td>
            
            <!-- 상품금액(수량) -->
            <td>
              <p class="fnt-1">
                <strong>${orderList.productPrice * orderList.productCnt}</strong><span> (${orderList.productCnt}개)</span>
              </p>
            </td>
            
            <!-- 배송 -->
            <td class="td-center">
              <span class="fc-blue">배송중</span>
              <span class="post-btn">
              	<button class="open">배송조회</button>
                <div class="modal">
                  <div class="modal-content">
                  </div>
                </div>
                <script src="${contextPath}/resources/order/modal.js"></script>
              </span>
            </td>
            
            <!-- 결제 상세 내역 -->
            <td>
              <div class="ord-con">
              	<a href="/order/orderView?orderNum=${orderList.orderNum}"><button>결제 내역</button></a> 
              </div>
            </td>
            
          </tr>
          </c:forEach>
        </tbody>
      </table>
          
    </div>
  </div>

<!-- 푸터 -->
<jsp:include page="../pageIngredient/footer.jsp" flush="false"></jsp:include>
</body>
</html>