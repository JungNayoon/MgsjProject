<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.project.member.domain.MemberDTO"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
String cp = request.getContextPath();
request.setCharacterEncoding("UTF-8");

//쿠키 가져오기
Cookie[] ck = request.getCookies();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/pageIngredient/header/logout.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="${contextPath}/resources/pageIngredient/header/header2.css">
</head>
<body>
	<div class="header">
		<div class="container">
			<div class="navbar">
				<div class="logo">
					<a href="/mainPage/mainPage">
						<img src="${contextPath}/resources/pageIngredient/header/header-img/logo2.png" width="125px">
					</a>
				</div>

				<nav>
					<c:choose>
						<c:when test="${(memberInfo.userVerify) == 128 && (memberInfo != null) }">
							<%-- 관리자 --%>
							<ul id="MenuItems">
								<li>
									<a href="/admin/memberManagement?pageNum=1" title="관리자 회원 관리 페이지">
										<i class="bi bi-bookmark-star-fill" style="font-size: 30px;"></i>
									</a>
								</li>
								<li>
									<a href="/admin/productManagement?pageNum=1" title="관리자 상품 관리 페이지">
										<i class="bi bi-box-seam-fill" style="font-size: 30px;"></i>
									</a>
								</li>
								<li>
									<a href="#" title="로그 기록 확인 페이지">
										<i class="bi bi-clock-history" style="font-size: 30px;"></i>
									</a>
								</li>
								<li>
									<a href="javascript:memberLogout()" title="로그아웃">
										<i class="bi bi-door-open" style="font-size: 30px;"></i>
									</a>
								</li>
							</ul>
						</c:when>
						<c:when test="${(memberInfo.userVerify) == 0 && (memberInfo != null) }">
							<%-- 회원 --%>
							<ul id="MenuItems">
								<li>
									<a href="/member/memberModifyPage" title="회원정보수정">
										<i class="bi bi-person-fill" style="font-size: 30px;"></i>
									</a>
								</li>
								<li>
									<a href="/cart/cartList" title="주문내역">
										<i class="bi bi-cart" style="font-size: 30px;"></i>
									</a>
								</li>
								<li>
									<a href="javascript:memberLogout()" title="로그아웃">
										<i class="bi bi-door-open" style="font-size: 30px;"></i>
									</a>
									
								</li>
							</ul>
						</c:when>
						<c:when test="${(memberInfo.userVerify) == 5 && (memberInfo != null) }">
							<%-- 판매자 --%>
							<div class="gnb-utilmenu">
								<a href="/member/memberModifyPage" title="판매자 정보 수정">
									<i class="bi bi-person-fill" style="font-size: 30px;"></i>
								</a>
								<a href="/cart/cartList" title="판매상품내역">
									<i class="bi bi-cart" style="font-size: 30px;"></i>
								</a>
								<a href="#" title="활동 기록">
									<i class="bi bi-clock-history" style="font-size: 30px;"></i>
								</a>
								<a href="javascript:memberLogout()" title="로그아웃">
									<i class="bi bi-door-open" style="font-size: 30px;"></i>
								</a>
							</div>
						</c:when>
						<c:otherwise>
							<ul id="MenuItems">
								<%-- 비회원 --%>
								<li>
									<a href="/member/memberLoginPage" title="로그인">
										<i class="bi bi-person-fill" style="font-size: 30px;"></i>
									</a>
								</li>
							</ul>
						</c:otherwise>
					</c:choose>
				</nav>

				<img src="/resources/pageIngredient/header/header-img/menu.png" class="menu-icon" onclick="menutoggle()">
			</div>
		</div>
	</div>
	<!--dropdown menu 시작-->
   <div class="menu">
      <a href="/order/orderList">My Page</a>
      <a href="/announcement/announcement?pageNum=1">NOTICE</a>
      <div class="dropdown">
         <button class="dropbtn">Product
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <div class="row">
              <div class="column">
                 <c:forEach var="categoryList1" items="${categoryList1}"> <!-- 대분류 -->
                  <span>
                     <a href="#" class="dropdown-btn">
                        <c:out value="${categoryList1.categoryName}" /> <!-- 대분류 이름 -->
                     </a>
                  </span>
                  <c:forEach var="categoryList2" items="${categoryList2}"><!-- 소분류 -->
                     <c:if test="${categoryList2.categoryLevel == categoryList1.cno}">
                        <a href="/category/categoryPro?cno=${categoryList2.cno}" class="dorpdown-btn">
                           <c:out value="${categoryList2.categoryName}" /><!-- 소분류 이름 -->
                        </a>
                     </c:if>
                  </c:forEach>
               </c:forEach>
              </div>
            </div>
         </div>
      </div>
   </div>
   <!--dropdown menu 끝-->



	<!------------js for toggle menu-------------->
	<script>
		let MenuItems = document.getElementById ("MenuItems");

		MenuItems.style.maxHeight = "0px";

		function menutoggle () {
			if (MenuItems.style.maxHeight == "0px") {
				MenuItems.style.maxHeight = "200px"
			} else {
				MenuItems.style.maxHeight = "0px";
			}
		}

		/* 	//컨트롤러에서 데이터 받기
			var jsonData = JSON.parse ( '${categoryList}' );
			console.log ( jsonData );

			var cate1Arr = new Array ();
			var cate1Obj = new Object ();

			//1차 분류 셀렉트 박스에 삽입할 데이터
			for ( var i = 0; i < jsonData.length; i++ ) {

				if ( jsonData[i].level == 1 ) {
					cate1Obj = new Object (); //초기화
					cate1Obj.cno = jsonData[i].cno;
					cate1Obj.categoryName = jsonData[i].categoryName;
					cate1Arr.push ( cate1Obj );
				}
			} */

		/* //1차 분류 셀렉트 박스에 데이터
		var cate1Select = $ ( '.category1' )
		for ( var i = 0; i < cate1Arr.length; i++ ) {
			/*	cate1Select.append("<option value='" + cate1Arr[i].cno + "'>"
						+ cate1Arr[i].categoryName + "</option>"); 
			cate1Select.append ( "<c:forEach items = '"cate1Arr[i]"'>" + cate1Arr.categoryName + "</c:forEach>" );
		}

		$ ( document ).on ( "change" , "category1" , function () {

			var cate2Arr = new Array ();
			var cate2Obj = new Object ();

			//2차 분류 셀렉트 박스
			for ( var i = 0; i < jsonData.length; i++ ) {

				if ( jsonData[i].level == 2 ) {
					cate2Obj = new Object ();
					cate2Obj.cno = jsonData[i].cno;
					cate2Obj.categoryName = jsonData[i].categoryName;
					cate2Obj.categoryLevel = jsonData[i].categoryLevel;

					cate2Arr.push ( cate2Obj );
				}
			}

			var cate2Select = $ ( "select.category2" );
			/* 
			for(var i = 0; i < cate2Arr.length; i++) {
				cate2Select.append("<option value = '" + cate2Arr[i].cno +"'>"
									+ cate2Arr[i].categoryName + "</option>")
			} 

			cate2Select.children ().remove ();

			$ ( "option:selected" , this ).each ( function () {

				var selectVal = $ ( this ).val ();
				cate2Select.append ( "<option value=''>전체</option>" );

				for ( var i = 0; i < cate2Arr.length; i++ ) {
					if ( selectVal == cate2Arr[i].categoryLevel ) {
						cate2Select.append ( "<option value='" + cate2Arr[i].cno + "'>" + cate2Arr[i].categoryName + "</option>" );
					}
				}
			} );

		} ); */
	</script>

</body>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/pageIngredient/header/history.js"></script>
</html>