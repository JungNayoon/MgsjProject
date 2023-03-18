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
<!--헤더-->
<jsp:include page="../pageIngredient/header.jsp" flush="false"></jsp:include>
<!--주문 완료-->
<div class="wrap">
    <div class="title1">주문/결제</div><br>
    <div class="title2">MGSJ를 이용해주셔서 감사합니다.</div>
    <br>
    <!-- 주문번호/일자 -->
    <div class="info_area">
        <div class="info_head">
            <h3>상품</h3>
        </div>
        <div class="info_cont">
            <table>
                <tr>
                    <td style="width: 200px;">제품번호</td>
                    <td>${orderDetailDTO.orderNum}</td>
                </tr>
                <tr>
                    <td>제품이름</td>
                    <td>${orderDetailDTO.productName}&nbsp;외 ...</td>
                </tr>
                <tr>
                    <td>가격</td>
                    <td>${orderDetailDTO.productPrice * orderDetailDTO.totalCnt}&nbsp;원</td>
                </tr>
            </table>
        </div>
    </div>

    <!-- 배송지 -->
    <div class="info_area">
        <div class="info_head">
            <h3>배송지 정보</h3>
        </div>
        <div class="info_cont">
            <table>
                <tr>
                    <td style="width: 200px;">배송지정보</td>
                    <td>${orderDetailDTO.recipient}</td>
                </tr>
                <tr>
                    <td>수취인전화번호</td>
                    <td>${orderDetailDTO.recipientPhone}</td>
                </tr>
                <tr>
                    <td>우편번호</td>
                    <td>${orderDetailDTO.postAddress}</td>
                </tr>
                <tr>
                    <td>주소</td>
                </tr>
            </table>
        </div>
    </div>

    <!-- 결제정보 -->
    <div class="info_area">
        <div class="info_head">
            <h3>결제</h3>
        </div>
        <div class="info_cont">
            <table>
                <tr>
                    <td style="width: 200px;">결제정보</td>
                    <td>${orderDetailDTO.paymentKind }</td>
                </tr>
                <tr>
                    <td>카드정보</td>
                    <td>${orderDetailDTO.paymentCard }</td>
                </tr>
                <tr>
                    <td>승인일시</td>
                    <td><fmt:formatDate value = '${orderDetailDTO.paymentRegDate}' pattern = 'yyyy년 MM월 dd일'/></td>
                </tr>
            </table>
        </div>
    </div>

    <!--결제금액-->
    <div class="info_total">
     	<c:set var = "total" value = "${orderDetailDTO.productPrice * orderDetailDTO.totalCnt}"/>
            <div>결제금액 :</div><div><c:out value = "${total + 3000}"/>&nbsp;원</div>
    </div>

    <div>
        <a href="/order/orderList"><button>주문목록</button></a>
    </div>
</div>

<!--푸터-->
<jsp:include page="../pageIngredient/footer.jsp" flush="false"></jsp:include>
</body>
</html>
