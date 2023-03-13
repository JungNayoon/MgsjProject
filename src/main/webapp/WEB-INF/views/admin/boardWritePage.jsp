<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.project.member.domain.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${(memberInfo.userVerify == 128) && (memberInfo != null) }">
		<title>공지 게시글 조회</title>
	</c:when>
	<c:otherwise>
		<title>게시글 조회</title>
	</c:otherwise>
</c:choose>
</head>
<body>
	<c:choose>
		<c:when test="${(memberInfo.userVerify == 128) && (memberInfo != null) }">
			<h1>공지글 작성하기</h1>
		</c:when>
		<c:otherwise>
			<h1>게시글 작성하기</h1>
		</c:otherwise>
	</c:choose>
	<form method="post" action="/admin/boardWrite" autocomplete="off" role="form">

		<div>
			<label>게시글 제목 : </label>
			<input type="text" name="title">
		</div>

		<hr>
		<br>
		<c:choose>
			<c:when test="${(memberInfo.userVerify == 128) && (memberInfo != null) }">
				<div>
					<label>작성자 : </label>
					<input type="text" name="writer" value="" readonly="readonly">
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<label>작성자 : </label>
					<input type="text" name="writer" placeholder="비회원은 반드시 작성자를 입력해주세요">
				</div>
			</c:otherwise>
		</c:choose>

		<hr>
		<br>

		<div>
			<label>내용</label>
		</div>

		<br>
		<textarea rows="5" cols="50" class="boardTextarea" name="content" maxlength="2000"></textarea>
		<br>

		<c:choose>
			<c:when test="${(memberInfo.userVerify == 128) && (memberInfo != null) }">
				<button type="submit">공지올리기</button>
			</c:when>
			<c:otherwise>
				<button type="submit">게시글 작성하기</button>
			</c:otherwise>
		</c:choose>
	</form>

</body>
</html>