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
<meta charset="UTF-8">
<title>제품 목록(간이)</title>
</head>
<body>
<!-- header -->
<jsp:include page="../pageIngredient/header.jsp" flush="false"></jsp:include>

<div align = "center">
		
		<table border = "1">
			<thead>
				<tr class = "warning">
					<th class = "col-sm-2  text-center">제품번호</th>
					<th class = "col-sm-2  text-center">카테고리번호</th>
					<th class = "col-sm-2  text-center">제품이름</th>
					<th class = "col-sm-2  text-center">제품가격</th>
					<th class = "col-sm-2  text-center">제품재고</th>		
					<th class = "col-sm-2  text-center">등록날짜</th>	
					<th class = "col-sm-2  text-center">관리</th>		
				</tr>
			</thead>
			<tbody>
 
				<c:forEach var = "productList" items = "${productList}">
				<tr>
					<td align = "center">${productList.pno}</td>
					<td align = "center">${productList.cno}</td>
					<!-- 제목에 마우스를올리면 내용이 말풍선으로 보인다. -->
					<td align = "center" title = "${productList.productDescription}"><a href = "${contextPath}/product/productView?pno=${productList.pno}">${productList.productName}</a></td>
					<td align = "center">${productList.productPrice}</td>
					<td align = "center">${productList.productStock}</td>
					<td align = "center"><fmt:formatDate value = "${productList.productRegDate}" pattern = "yyyy-MM-dd"/></td>
					<td align = "center"><a class="btn btn-sm btn-warning" href="javascript:deleteProductList('${productList.pno}')">삭제</a>
					<!-- 나중 사용을 위해서 이미지 이름과 경로 히든 처리 -->
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<button type = "button" onclick = "location.href = '/product/productWritePage'">상품 등록하기</button>
	
	</div>
	
	<!-- footer -->
	<jsp:include page="../pageIngredient/footer.jsp" flush="false"></jsp:include>
	<script type="text/javascript">
		function deleteProductList(pno) {
			let deleteYN = confirm("제품을 삭제할까요?");
			
			if(deleteYN == true) {
				alert("제품이 삭제되었습니다.");
				location.href = "/product/productDelete?pno=" + pno;
			} else {
				alert("제품 삭제를 취소하였습니다.");
			}
		}
	
	</script>

</body>
</html>