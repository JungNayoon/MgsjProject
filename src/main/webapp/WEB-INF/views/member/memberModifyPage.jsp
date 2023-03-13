<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 페이지</title>
<link rel="stylesheet" href="/resources/memberModify/userEdit.css">
</head>
<body>
	<div class="user-main">
		<div class="user-profile">
			<form action="/member/memberModify" method="post" id="edit-user" name="edit-user">
				<div class="user-pro">
					<h2>내정보 관리</h2>
					<hr />
					<div class="user">
						<b>아이디</b>
						<input type="text" id="userId" name="userId" placeholder="아이디는 수정이 불가능합니다." value="${memberInfo.userId}" readonly />
						<div id="idError" class="error"></div>
						<br />
						<b>비밀번호</b>
						<input type="password" id="userPwd" name="userPwd"/>
						<div id="pwdError" class="error"></div>
						<br />
						<b>이름</b>
						<input type="text" id="userName" name="userName" value="${memberInfo.userName}" readonly />
						<div id="nameError" class="error"></div>
						<br />
						<b>이메일</b>
						<input type="email" id="userEmail" name="userEmail" value="${memberInfo.userEmail}" />
						<div id="emailError" class="error"></div>
						<br />
						<b>전화번호</b>
						<input title="휴대전화 번호 수정은 별도의 인증과정이 필요합니다." 
							type="tel" id="PhoneNumber" name="PhoneNumber" value="${memberInfo.userPhoneNumber}" readonly="readonly" />
						<div id="phoneError" class="error"></div>
						<br />
						<div class="address">
							<b>주소</b>
							<input id="postAddress" type="text" placeholder="우편번호" readonly />
							<button type="button" onclick="findAddr()">우편번호 검색</button>
							<input id="address" type="text" placeholder="주소" readonly />
							<br />
							<div id="addressError" class="error"></div>
							<input id="detailAddress" type="text" placeholder="상세주소 입력" />
							<div id="detailAddError" class="error"></div>
						</div>
					</div>
				</div>
				<hr />
				<!--수정버튼-->
				<div class="user-update">
					<button type="submit" id="update-btn" name="update-btn" onclick="editInfo()">수정</button>
				</div>
				<div class="user-withdrawal">
					<button type="submit" id="withdrawal-btn" name="withdrawal-btn" onclick="withdrawalUser()">회원탈퇴</button>
				</div>
			</form>
		</div>
	</div>
</body>
<script src="/resources/memberModify/userEdit.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>