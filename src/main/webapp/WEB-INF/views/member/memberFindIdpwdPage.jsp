<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>아이디 패스워드 찾기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/resources/login/styles/reset.css">
<link rel="stylesheet" href="/resources/login/styles/findIdpwd.css">
</head>
<body>
	<div class="login">
		<h1>
			<a href="/mainPage/mainPage" title="메인페이지로 이동">
				<span class="login-logo">Ezen</span>
			</a>
		</h1>

		<div class="login-box">
			<div class="tab">
				<button class="tablinks" onclick="openTab(event, 'Id')" id="defaultOpen">아이디 찾기</button>
				<button class="tablinks" onclick="openTab(event, 'Pwd')">비밀번호 찾기</button>
			</div>
			<form action="">
				<div id="Id" class="tabcontent">
					<h3>아이디 찾기</h3>
					<ul>
						<li>
							<span class="icon">
								<i class="bi bi-person-vcard"></i>
							</span>
							<span>
								<input type="text" id="" name="userName" placeholder="이름">
							</span>
						</li>
						<li>
							<span class="icon">
								<i class="bi bi-envelope-at"></i>
							</span>
							<span>
								<input type="email" id="" name="userEmail" placeholder="이메일">
							</span>
						</li>
					</ul>
					<button id="search-btn" type="submit">아이디 찾기</button>
				</div>
			</form>
			<form action="">
				<div id="Pwd" class="tabcontent">
					<h3>비밀번호 찾기</h3>
					<ul>
						<li>
							<span class="icon">
								<i class="bi bi-person"></i>
							</span>
							<span>
								<input type="text" name="userId" placeholder="아이디">
							</span>
						</li>
						<li>
							<span class="icon">
								<i class="bi bi-envelope-at"></i>
							</span>
							<span>
								<input type="email" name="userEmail" placeholder="이메일">
							</span>
						</li>
					</ul>
					<button id="search-btn" type="submit">비밀번호 찾기</button>
				</div>
			</form>
		</div>

		<div class="">
			<a href="#" class="join_link">회원가입</a>
		</div>
	</div>

	<footer> &copy; Ezen project. 대충간지나는 말. </footer>


	<script>
		function openTab ( evt , Idpwd ) {
			var i , tabcontent , tablinks;
			tabcontent = document.getElementsByClassName ( "tabcontent" );
			for ( i = 0; i < tabcontent.length; i++ ) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName ( "tablinks" );
			for ( i = 0; i < tablinks.length; i++ ) {
				tablinks[i].className = tablinks[i].className.replace ( " active" , "" );
			}
			document.getElementById ( Idpwd ).style.display = "block";
			evt.currentTarget.className += " active";

		}

		// Get the element with id="defaultOpen" and click on it
		document.getElementById ( "defaultOpen" ).click ();
	</script>
</body>
</html>