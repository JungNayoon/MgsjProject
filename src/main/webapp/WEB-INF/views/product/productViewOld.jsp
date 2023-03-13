<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>${productDTO.productName }</title>
<style type="text/css">
#product-content {
	display: flex;
}

.inner-content {
		display: flex-column;
		margin: 0 auto;
}

.img-management {
	float: left;
}

.inner-content>h1 {
	text-align: left;
}

.inner-content>.product-management {
	display: flex;
	justify-content: center;
}

.img-area {
	float: left;
	height: 350px;
	border: 1px solid #e9e9e9;
	margin: 30px;
	width: 350px;
}

.img-area-item {
	vertical-align: middle;
}

.img-upload>label {
	padding: 5px;
}

.img-upload>div {
	margin-top: 10px;
}

.img-upload>label:hover {
	cursor: pointer;
	background: #e9e9e9;
	border: 1px solid black;
}

.container {
	position: relative;
	float: right;
	width: 500px;
	height: 500px;
	text-align: left;
}

.show-image img {
	z-index: 1;
}

.pushing-bottom-flex-box {
	display: flex-column;
	color: white;
}

textarea {
	width: 450px;
	height: 200px;
	resize: none;
}

div>input {
	border: none;
}

div>input:hover {
	pointer-events : none;
}

div>input:active {
	border: none;
	pointer-events : none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div id="product-content" align="center">
		<div class="inner-content">
			<h1>${productDTO.productName }</h1>
			<div class="product-management">
				<div class="img-management">

					<div class="img-area">
						<div class="img-area-item">
							<div class="show-image">
								<img src="" />
							</div>
						</div>
					</div>

					<!-- <div>
						<label for="productFile">이곳을 클릭하여 이미지 업로드</label>
						<br>
						<input type="file" id="productFile" name="file">
					</div> -->
					<!-- 경로 : D:\jsp\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp8\wtpwebapps\Mgsjproject\ -->
				</div>

				<div class="container">
					<!-- form-action은 타이틀 밑의 js파일에서 구현 예정 -->
					<div class="product-Info">
						<div class="col-sm-12">
							<h2 align="left">${productDTO.productName } 상품정보</h2>
						</div>
					</div>
					
					<%--
						아래 주석 부분은 가방 > 백팩 이런식으로 추후 구현 예정
						 
						<c:if test="${productDTO.cno == (이걸창의적으로바꾸야함) }">
						<p>(이걸창의적으로바꾸야함)</p>
						</c:if>
						<label>1차 분류</label>
						<select class="category1">
							<option value="">전체</option>
						</select>
						<label>2차 분류</label>
						<select class="category2" name="cno">
							<option value="">전체</option>
						</select>
					--%>

					<input type="hidden" class="form-control" name="cartNum" value="장바구니 번호" />
					<div class="form-group">
						<label class="col-sm-2 control-label">제품 번호</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" value="${productDTO.pno}" name="pno" readonly="readonly" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">제품 이름</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" value="${productDTO.productName}" readonly="readonly" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">제품 가격</label>
						<div class="col-sm-4">
							<input type="number" class="form-control" value="${productDTO.productPrice}" readonly="readonly" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">주문 수량</label>
						<div class="col-sm-4">
							<input type="number" class="productCnt" name="productCnt" 
							style="border:1px solid black;" onkeydown="javascript: return event.keyCode == 69 ? false : true" />
						</div>
					</div>
					<div class="form-group">
						<div class="pushing-bottom-flex-box">1</div>
						<div class="pushing-bottom-flex-box">2</div>
						<div class="pushing-bottom-flex-box">3</div>
						<div class="pushing-bottom-flex-box">4</div>
						<div class="pushing-bottom-flex-box">5</div>
						<div align="center">
							<div style="width: 100%" align="right">
								<button type="button" onclick="goCartOn('${productDTO.pno}','${memberInfo.userId}')">장바구니에 넣기</button>
								<button type="button" class="btn btn-danger" onClick="location.href = '/product/productList'">상품 목록 이동</button>
								<div style="color: #e9e9e9;">추후 판매자 계정(=상품등록자) session값 검사하여 보여지게 만들기</div>
								<!-- 
									sellerVerify = (MemberDTO)session.getAttribute("memberInfo")
									
									if(sellerVerify.getUserVerify == 5){
										<대충태그>보여짐</대충태그>
									} else {
										return;
									}
								 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<br>
	<hr>

	<div align="center">
		<h1>${productDTO.productName } 상품 문의</h1>
		<table border="1">
			<thead>
				<tr class="warning">
					<th class="col-sm-2 text-center ask-num">제품문의번호</th>
					<th class="col-sm-2 text-center pno">제품번호</th>
					<th class="col-sm-2 text-center ask-title">문의제목</th>
					<th class="col-sm-2 text-center ask-reg-date">문의날짜</th>
					<th>관리버튼</th>
				</tr>
			</thead>
			<tbody>
				<!-- 
				!!! 여기는 데이터베이스 테이블명이 askdto !!!!
				askNum int AI PK 
				pno int 
				askTitle varchar(50) 
				askContent text 
				askRegDate datetime
			-->
				<c:forEach var="inquireList" items="${inquireList}">
					<tr>
						<td align="center">${inquireList.askNum}</td>
						<td align="center">${inquireList.pno}</td>
						<td align="center" title="${inquireList.askContent}">
							<a href="${contextPath}/inquire/inquireView?askNum=${inquireList.askNum}">${inquireList.askTitle}</a>
						</td>
						<td>
							<fmt:formatDate value="${inquireList.askRegDate}" pattern="yyyy-MM-dd" />
						</td>
						<td align="center">
							<a class="btn btn-sm btn-warning" href="javascript:deleteInquireList('${inquireList.askNum}','${productDTO.pno}')">삭제</a>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<button type="button" onclick="location.href = '/inquire/inquireWritePage?pno=${productDTO.pno}'">제품문의하기</button>
		</div>
	</div>
	<div align="center">
		<h1>${productDTO.productName } 상품 리뷰</h1>
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
				<c:forEach var="reviewList" items="${reviewList}">
					<tr>
						<td align="center">${reviewList.rvno}</td>
						<td align="center">${reviewList.pno}</td>
						<td align="center" title="${reviewList.rvContent}">
							<a href="${contextPath}/review/reviewView?rvno=${reviewList.rvno}">${reviewList.rvTitle}</a>
						</td>
						<td align="center">${reviewList.rvWriter}</td>
						<td>
							<fmt:formatDate value="${reviewList.rvRegDate}" pattern="yyyy-MM-dd" />
						</td>
						<td align="center">
							<a class="btn btn-sm btn-warning" href="javascript:deleteReviewList('${reviewList.rvno}', '${productDTO.pno}')">삭제</a>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<button type="button" onclick="location.href = '/review/reviewWritePage?pno=${productDTO.pno}'">리뷰 작성</button>
		</div>
	</div>

</body>
<script type="text/javascript">
	function deleteInquireList ( askNum , pno ) {
		let deleteYN = confirm ( "삭제할까요?" );

		if ( deleteYN == true ) {
			$.ajax (
				{
					url : '/inquire/inquireDelete' ,
					type : 'POST' ,
					data :
						{
							askNum : askNum
						} ,
					success : function ( data ) {
						alert ( "삭제되었습니다" );
						location.reload ( true );
						/* 
							reload의 기본값은 false 
							false : 쿠키값에 기반하여 새로고침 (웹브라우저 내 데이터기반)
							true : 서버에서부터 새로고침 (db기반)
						 */
					} ,
					error : function ( error ) {
						alert ( "알수없는 오류가 발생하였습니다.\n잠시 후에 다시 시도해주세요" );
					}
				} );
		} else {
			alert ( "삭제가 취소되었습니다." );

		}
	}
	function deleteReviewList ( rvno , pno ) {
		let deleteYN = confirm ( "삭제할까요?" );

		if ( deleteYN == true ) {
			$.ajax (
				{
					url : '/review/reviewDelete' ,
					type : 'POST' ,
					data :
						{
							rvno : rvno
						} ,
					success : function ( data ) {
						alert ( '삭제되었습니다.' );
						location.reload ( true );
					} ,
					error : function ( error ) {
						alert ( '알 수 없는 오류 발생하였습니다.\n잠시 후에 다시 시도해주세요.' );
					}

				} );
		} else {
			alert ( "삭제가 취소되었습니다." );
		}
	}


	function goCartOn ( pno , userId ) {

		let productCntVal = document.querySelector ( ".productCnt" ).value;

		if ( productCntVal == 0 || productCntVal < 0 || productCntVal == "") {
			alert ( "제품 수량은 반드시 한개 이상 입력해주세요." );

			return false;
		}

		$.ajax (
			{
				url : '/cart/cartWrite' ,
				type : 'POST' ,
				data :
					{
						"pno" : pno ,
						"userId" : userId ,
						"productCnt" : productCntVal
					} ,
				dataType : 'json' ,

				success : function ( data ) {

					if ( data == false ) {

						alert ( "로그인해주세요" );
						location.href = "/member/memberLoginPage";

						return false;

					} else {

						alert ( "장바구니에 담겼습니다" );
						return true;

					}

				} ,
				error : function ( error ) {
					alert ( '알 수 없는 오류 발생하였습니다.\n잠시 후에 다시 시도해주세요.' );
					console.log ( error );
				}

			} );

	}
</script>
</html>