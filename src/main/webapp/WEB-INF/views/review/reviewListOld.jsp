<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 정상적으로 로그인이 되었는지 확인할수있는 파라미터값 = result -->
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 목록(간이)</title>
</head>
<body>
	<div align="center">
		<h1>n번 상품 리뷰</h1>
		<table border="1">
			<thead>
				<tr class="warning">
					<th class="col-sm-1 text-center rvno">리뷰 번호</th>
					<th class="col-sm-1 text-center pno">제품 번호(관리자만 보면 됨)</th>
					<th class="col-sm-1 text-center rv-Title">리뷰 제목</th>
					<th class="col-sm-1 text-center rv-Writer">리뷰 작성자</th>
					<th class="col-sm-1 text-center rv-RegDate">리뷰 작성일</th>
					<th>관리버튼</th>
				</tr>
			</thead>
			<tbody>
				<!-- 
					reviewboarddto 테이블
					rvno	int	NO	PRI
					pno	int	NO	PRI
					rvTitle	varchar(50)	NO	
					rvContent	text	NO	
					rvWriter	varchar(50)	NO	
					rvRegDate	datetime	NO	
			-->
				<c:forEach var = "reviewList" items = "${reviewList}">
				<tr>
					<td align = "center">${reviewList.rvno}</td>
					<td align = "center">${reviewList.pno}</td>
					<td align = "center" title = "${reviewList.rvContent}"><a href = "${contextPath}/review/reviewView?rvno=${reviewList.rvno}">${reviewList.rvTitle}</a></td>
					<td align = "center">${reviewList.rvWriter}</td>
					<td><fmt:formatDate value = "${reviewList.rvRegDate}" pattern = "yyyy-MM-dd"/></td>
					<td align="center"><a class="btn btn-sm btn-warning" href="javascript:deleteReviewList(${reviewList.rvno})">삭제</a>
				</tr>
				</c:forEach>
			</tbody>
		</table>

		<div>
			<button type="button" onclick="location.href = '/review/reviewWritePage'">리뷰 작성</button>
		</div>
	</div>
	<script>
		function deleteReviewList(rvno) {
			let deleteYN = confirm("삭제할까요?");
			if (deleteYN == true) {
				alert("삭제되었습니다.");
				location.href = "/review/reviewDelete?rvno=" + rvno;
			} else {
				alert("삭제가 취소되었습니다.");
			}
		}
	</script>
</body>
</html>