<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.project.board.domain.PageIngredient" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 관리 페이지</title>
</head>
<link rel="stylesheet" type="text/css" href="/resources/admin/adminPage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<body>
<!-- header -->        
<jsp:include page="../pageIngredient/header.jsp" flush="false"></jsp:include>
<!-- header -->

	<div id="boardGroup">
		<h1>회원 목록</h1>
		<!-- 게시글 검색기능 -->
		<%
		PageIngredient pageIngredient = (PageIngredient) request.getAttribute("page");
		%>
		<div>
			<select class="searchType" name="searchType" onchange="changeInputTag()">
				<option value="userId" <%=pageIngredient.getSearchType().equals("userId") ? "selected" : ""%>>아이디</option>
				<option value="userName" <%=pageIngredient.getSearchType().equals("userName") ? "selected" : ""%>>이름</option>
				<option value="userVerify" <%=pageIngredient.getSearchType().equals("userVerify") ? "selected" : ""%>>회원유형</option>
			</select>
			<input type="text" id="keyword" class="keyword" name="keyword" value="<%=pageIngredient.getKeyword()%>" onkeyup="enterSearching();">
			<button id="searchingActivate" type="button" onclick="searchingActivate();">검색</button>
		</div>
		<!-- 게시글 검색기능 끝 -->
		<table>
			<thead>
				<tr>
					<th style="width: 80px;">회원번호</th>
					<th style="width: 300px;">아이디</th>
					<th style="width: 150px;">이름</th>
					<th style="width: 150px;">가입일</th>
					<th style="width: 80px;">성별</th>
					<th style="width: 150px;">회원유형</th>
				</tr>
			</thead>
			<tbody>
			<!-- 
			private String userId;
			private String userPwd;
			private String userName;
			private String userPhoneNumber;
			private String userEmail;
			private Date userJoinDate;
			private String userGender;
			private int userVerify;
			 -->
				<c:forEach items="${memberList }" var="memberList">
					<tr>
						<td>${memberList.userNum }</td>
						<td>
							<a href="/admin/memberView?userNum=${memberList.userNum }">${memberList.userId }</a>
						</td>
						<td>${memberList.userName }</td>
						<td>
							<fmt:formatDate value="${memberList.userJoinDate}" pattern="yyyy-MM-dd" />
						</td>
						<td>${memberList.userGender }</td>
						<c:choose>
							<c:when test="${memberList.userVerify == 128 }">
								<td>관리자</td>
							</c:when>
							<c:when test="${memberList.userVerify == 5 }">
								<td>판매자</td>
							</c:when>
							<c:otherwise>
								<td>일반회원</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		

		<!-- 페이징 시작 -->
		<%
		int selectedPageNum = (int) request.getAttribute("selectedPageNum");

		/* 이전페이지 버튼만들기 */
		if (pageIngredient.isPrevPage() == true) {
		%>
		<span>
			<a href="/admin/memberManagement?pageNum=<%=pageIngredient.getStartPage() - 1%><%=pageIngredient.getSearchTypeAndKeyword()%>">◀이전</a>
		</span>
		<%
		}

		/* 페이지 쫙(1,2,3,4...) 출력하기 */
		for (int i = pageIngredient.getStartPage(); i <= pageIngredient.getEndPage(); i++) {

		if (selectedPageNum != i) {
		%>
		<span>
			<a id="notSelectedPage" href="/admin/memberManagement?pageNum=<%=i%><%=pageIngredient.getSearchTypeAndKeyword()%>"><%=i%></a>
		</span>
		<%
		} else if (selectedPageNum == i) {
		%>
		<span>
			<b style="font-size: 22px"><%=i%></b>
		</span>
		<%
		}
		}

		/* 다음버튼 만들기 */
		if (pageIngredient.isNextPage() == true) {
		%>
		<span>
			<a href="/admin/memberManagement?pageNum=<%=pageIngredient.getEndPage() + 1%><%=pageIngredient.getSearchTypeAndKeyword()%>">다음▶</a>
		</span>
		<%
		}
		%>
		<!-- 페이징 끝 -->
	</div>
	
<!-- footer -->        
<jsp:include page="../pageIngredient/footer.jsp" flush="false"></jsp:include>
<!-- footer -->
</body>
<script type="text/javascript" src="/resources/admin/member/adminMember.js"></script>
</html>