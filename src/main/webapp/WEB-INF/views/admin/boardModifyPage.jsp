<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.project.member.domain.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
<link rel="stylesheet" href="${contextPath}/resources/board/boardView/boardModifyPage.css">
<style type="text/css">
input[name=userId] {
	border: none;
}

input[name=userId]:hover {
	border: none;
	pointer-events: none;
}
</style>
</head>
<body>
<!-- header -->        
<jsp:include page="../pageIngredient/header.jsp" flush="false"></jsp:include>
<!-- header -->

<div class="board_wrap">
	<!-- 
		private int bno;
		private String writer;
		private String title;
		private String content;
		private Date regDate;
		private int readCount;
	 -->
	<%
	MemberDTO memberInfo = (MemberDTO) session.getAttribute("memberInfo");

	if (memberInfo.getUserVerify() == 128) {
	%>
	<h1>${boardDTO.bno }. 공지게시글 수정</h1>
	<%
	} else {
	%>
	<h1>${boardDTO.bno }. 게시글 수정</h1>
	<%
	}
	%>
	<form action="/admin/boardModify" method="post">
		
		<!-- 작성자, 제목 -->
		<div class="row1">
			<table>
				<tr>
					<td class="table_title">게시글 번호</td>
					<td class="blank"><input type="text" name="bno" value="${boardDTO.bno }"></td>
				</tr>
				<tr>
					<td class="table_title">게시글 제목</td>
					<td class="blank"><input type="text" name="title" value="${boardDTO.title }"></td>
				</tr>
				<tr>
					<td class="table_title">작성자</td>
					<td class="blank"><input type="text" name="writer" value="${boardDTO.writer }" readonly="readonly">
				</tr>
			</table>
		</div>

		<br>

		<!-- 내용 -->
		<div class="row2">
			<table style="border-top:none;">
				<tr>
					<td class="table_title">내용</td>
					<td><textarea rows="15" cols="120" class="boardTextarea" name="content" maxlength="2000">${boardDTO.content }</textarea></td>
				</tr>
			</table>
		</div>


		<!-- 버튼 -->
		<div class="row3">
			<%
			if (memberInfo.getUserVerify() == 128) {
			%>
			<button type="submit">공지글 수정하기</button>
			<%
			} else {
			%>
			<button type="submit">게시글 수정하기</button>
			<%
			}
			%>
		</div>
	</form>
</div>

<!-- footer -->        
<jsp:include page="../pageIngredient/footer.jsp" flush="false"></jsp:include>
<!-- footer -->   
</body>
</html>