<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 액션(코어)태그 --%>
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
<title>장바구니 목록</title>
</head>
<body>

	<div align="center">
		<h1 style="margin-bottom: 3px;">내 장바구니 목록</h1>
		<font size="2" style="margin-bottom: 15px;">
			로그인 계정 : ${memberInfo.userId }
		</font>
		<table border="1">
			<thead>
				<tr class="warning">
					<th class="col-sm-1 text-center cartNum" style = "display:none;">장바구니 등록 번호</th>
					<th class="col-sm-1 text-center productName">제품 이름</th>
					<th class="col-sm-1 text-center productPrice">제품 가격</th>
					<th class="col-sm-1 text-center productCnt">장바구니에 담은 제품 수량</th>
					<th class="col-sm-1 text-center">관리</th>
				</tr>
			</thead>
			<tbody>
				<!-- 
					cartdto
					cartNum	int	NO	PRI
					pno	int	NO	PRI
					productCnt	int	NO	
					
					productName String
					productPrice int
 				-->
				<c:forEach var="cartList" items="${cartList}">
					<tr>
						<td align="center" style = "display:none;">${cartList.cartNum}</td>
						<td align="center" style = "display:none;">${cartList.pno}</td>
						<td align="center"><a href="${contextPath}/product/productView?pno=${cartList.pno}">${cartList.productName}</a></td>
						<td align="center">${cartList.productPrice}</td>
						<td align="center">${cartList.productCnt}</td>
						<td align="center">
							<span>
								<a class="btn btn-sm btn-warning" href="javascript:updateCartList(${reviewList.rvno})">수정</a>
								|
								<a class="btn btn-sm btn-warning" href="javascript:deleteCartList('${cartList.cartNum}','${cartList.productName}')">삭제</a>
							</span>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button type="button" onclick= "location.href = '/'">계속 쇼핑하기</button>
		<button type="button" onclick = "location.href = '/order/orderList'">주문하기</button>
	</div>
	<script type="text/javascript">
		function deleteCartList(cartNum, productName){
			var deleteYN = confirm(productName + "을 삭제하시겠습니까?");
			
			if(deleteYN == true) {
				
				$.ajax({
					url : '/cart/cartDelete',
					type : 'POST', 
					data : {
						cartNum : cartNum
					},
					success : function(data) {
						alert("삭제되었습니다.");
						location.href = '/cart/cartList';
					},
					error : function(error) {
						alert("알 수 없는 오류가 발생하였습니다. \n 잠시 후에 다시 시도해주세요.");
					}	
				});
			} else { 
				alert("삭제가 취소되었습니다.");
			}
		}
	</script>

</body>
</html>