<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.project.member.domain.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${(memberInfo.userVerify == 128) && (memberInfo != null) }">
		<title>공지 게시글 작성</title>
	</c:when>
	<c:otherwise>
		<title>게시글 작성</title>
	</c:otherwise>
</c:choose>
<link rel="stylesheet" href="${contextPath}/resources/admin/boardWritePage.css">
</head>
<body>

<!-- 헤더 -->        
<jsp:include page="../pageIngredient/header.jsp" flush="false"></jsp:include>

<!-- 공지 게시글 작성 -->
<div class="board_wrap">

	<c:choose>
		<c:when test="${(memberInfo.userVerify == 128) && (memberInfo != null) }">
			<div class="board_title">공지글 작성하기</div>
		</c:when>
		<c:otherwise>
			<div class="board_title">게시글 작성하기</div>
		</c:otherwise>
	</c:choose>
	
	<form method="post" action="/admin/boardWrite" autocomplete="off" role="form">
		<!-- 작성자, 제목 -->
		<div class="row1">
			<table>
				<tr>
					<td class="table_title">게시글 제목</td>
					<td class="blank"><input type="text" name = "title"></td>
				</tr>
				<c:choose>
					<c:when test="${(memberInfo.userVerify == 128) && (memberInfo != null) }">
						<tr>
							<td class="table_title">작성자</td>
							<td class="blank"><input type="text" name="writer" value="${memberInfo.userId}" readonly="readonly"><td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="table_title">작성자</td>
							<td class="blank"><input type="text" name="writer" placeholder="비회원은 반드시 작성자를 입력해주세요"></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		
		<!-- 내용 -->
		<div class="row2">
			<table style="border-top:none;">
				<tr>
					<td class="table_title">내용</td>
					<td><textarea rows="15" cols="120" class="boardTextarea" name="content" maxlength="2000"></textarea></td>
				</tr>
			</table>
		</div>
		
		<!-- 버튼 -->
		<div class="row3">
			<c:choose>
				<c:when test="${(memberInfo.userVerify == 128) && (memberInfo != null) }">
					<button type="submit">공지올리기</button>
				</c:when>
				<c:otherwise>
					<button type="submit">게시글 작성하기</button>
				</c:otherwise>
			</c:choose>
		</div>
	</form>
</div>


<!-- 푸터 -->
<jsp:include page="../pageIngredient/footer.jsp" flush="false"></jsp:include>

</body>
</html>