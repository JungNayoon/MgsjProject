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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>카테고리 목록(간이)</title>
</head>
<body>
	<div align="center">
		<h1>카테고리 목록</h1>
		<table border="1">
			<thead>
				<tr class="warning">
					<th class="col-sm-1 text-center rvno">카테고리 이름(대분류,소분류)</th>
					<th class="col-sm-1 text-center pno">카테고리 번호</th>
					<th class="col-sm-1 text-center rv-Title">카테고리 참조번호</th>
					<th class="col-sm-1 text-center level">카테고리 분류번호</th>
					<th>관리버튼</th>
				</tr>
			</thead>
			<tbody>
				<!-- 
					categorydto 테이블
					categoryName	varchar(20)
					cno	int
					categoryLevel	int 
				-->
				<c:forEach var="categoryList" items="${categoryList}">
					<tr>
						<td align="center">${categoryList.categoryName}</td>
						<td align="center">${categoryList.cno}</td>
						<td align="center">${categoryList.categoryLevel}</td>
						<td align="center">${categoryList.level}</td>
						<td align="center"><a class="btn btn-sm btn-warning" href="javascript:deleteReviewList('${categoryList.cno}')">삭제</a>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<button type="button" onclick="location.href = '/category/categoryWritePage'">새로운 카테고리 등록</button>
		</div>
		<br>
		<hr>
		<section id="container">
		<div class="container-box">
			<form role="form" method="post" autocomplete="off">
				<label>1차 분류</label> 
				<select class="category1" name = "category1">
					<option value="">전체</option>
				</select> 
				<label>2차 분류</label> 
				<select class="category2" name = "category2">
					<option value="">전체</option>
				</select>
			</form>
		</div>
	</section>
	</div>

	<script type="text/javascript">
		function deleteReviewList(cno) {
			let deleteYN = confirm("카테고리를 삭제하시겠습니까?");

			if (deleteYN == true) {
				alert("삭제되었습니다");
				location.href = "/category/categoryDelete?cno=" + cno;
			} else {
				alert("삭제가 취소되었습니다.");
			}
		}
	
	//컨트롤러에서 데이터 받기
		var jsonData = JSON.parse('${categoryList}');
		console.log(jsonData);

		var cate1Arr = new Array();
		var cate1Obj = new Object();

		//1차 분류 셀렉트 박스에 삽입할 데이터
		for (var i = 0; i < jsonData.length; i++) {

			if (jsonData[i].level == 1) {
				cate1Obj = new Object(); //초기화
				cate1Obj.cno = jsonData[i].cno;
				cate1Obj.categoryName = jsonData[i].categoryName;
				cate1Arr.push(cate1Obj);
			}
		}

		//1차 분류 셀렉트 박스에 데이터
		var cate1Select = $('select.category1')

		for (var i = 0; i < cate1Arr.length; i++) {
			cate1Select.append("<option value='" + cate1Arr[i].cno + "'>"
					+ cate1Arr[i].categoryName + "</option>");
		}
		
		$(document).on("change", "select.category1", function(){
			
			var cate2Arr = new Array();
			var cate2Obj = new Object();
			
			//2차 분류 셀렉트 박스
			for(var i = 0; i < jsonData.length; i++) { 
				
				if(jsonData[i].level == 2) {
					cate2Obj = new Object();
					cate2Obj.cno = jsonData[i].cno;
					cate2Obj.categoryName = jsonData[i].categoryName;
					cate2Obj.categoryLevel = jsonData[i].categoryLevel;
					
					cate2Arr.push(cate2Obj);
				}
			}
			
			var cate2Select = $("select.category2");
			/* 
			for(var i = 0; i < cate2Arr.length; i++) {
				cate2Select.append("<option value = '" + cate2Arr[i].cno +"'>"
									+ cate2Arr[i].categoryName + "</option>")
			} */
		
			cate2Select.children().remove();
			
			$("option:selected", this).each(function(){
				
				var selectVal = $(this).val();
				cate2Select.append("<option value=''>전체</option>");
				
				for(var i = 0; i < cate2Arr.length; i++){
					if(selectVal == cate2Arr[i].categoryLevel) {
						cate2Select.append("<option value='" + cate2Arr[i].cno + "'>"
										+ cate2Arr[i].categoryName + "</option>");
					}
				}
			});
			
		});
	</script>

</body>
</html>