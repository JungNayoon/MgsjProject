<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>주문 목록(간이)</title>
</head>
<body>
 <div align = "center">
 		<h1 style = "margin-bottom : 3px;">내 주문 목록</h1>
 		<font size="2" style="margin-bottom: 15px;">
			로그인 계정 : ${memberInfo.userId}
		</font>
		<table border = "1">
			<thead>
				<tr class = "warning">
					<th class = "col-sm-2  text-center">주문번호</th>
					<th class = "col-sm-2  text-center">회원아이디</th>
					<th class = "col-sm-2  text-center">주문일자</th>
					<th class = "col-sm-2  text-center">우편번호</th>
					<th class = "col-sm-2  text-center">상세주소1</th>
					<th class = "col-sm-2  text-center">상세주소2</th>
					<th class = "col-sm-2  text-center">수령인</th>
					<th class = "col-sm-2  text-center">수령인번호</th>	
					<th class = "col-sm-2  text-center">제품이름</th>	
					<th class = "col-sm-2  text-center">제품가격</th>	
					<th class = "col-sm-2  text-center">주문수량</th>
					<th class = "col-sm-2  text-center">주문제품 총가격</th>
				</tr>
			</thead>
			<tbody id = "order">
			<!-- 
			orderNum int AI PK 
			userNum int 
			userId varchar(20) 
			orderDate datetime 
			postAddress varchar(20) 
			detailAddress varchar(50) 
			detailAddress2 varchar(50) 
			recipient varchar(10) 
			recipientPhone varchar(15)
 			-->
			<c:forEach var = "orderList" items = "${orderList}">
				<tr>
					<td align = "center"><a href = "${contextPath}/order/orderView?orderNum=${orderList.orderNum}">${orderList.orderNum}</a></td>
					<td align = "center">${orderList.userId}</td>
					<td><fmt:formatDate value = "${orderList.orderDate}" pattern = "yyyy-MM-dd"/></td>
					<td align = "center">${orderList.postAddress}</td>
					<td align = "center">${orderList.detailAddress}</td>
					<td align = "center">${orderList.detailAddress2}</td>
					<td align = "center">${orderList.recipient}</td>
					<td align = "center">${orderList.recipientPhone}</td>
					<td align = "center">${orderList.productName}</td>
					<td align = "center">${orderList.productPrice}</td>
					<td align = "center">${orderList.productCnt}</td>
					<!-- 나중 사용을 위해서 이미지 이름과 경로 히든 처리 -->
					<c:set var= "total" value="${orderList.productPrice * orderList.productCnt}"/>
					<td align = "center" id = "total">${total}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<input type = "text" id = "totalPrice"/>
		
	</div>

</body>
</html>