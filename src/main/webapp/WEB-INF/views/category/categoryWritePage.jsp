<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 작성</title>
</head>
<body>

		<!-- 
			categorydto 테이블
			categoryName	varchar(20)
			cno	int
			categoryLevel	int 
		-->
		
	<div class="container" align="center">
			<form class="form-horizontal" action="/category/categoryWrite" method="post">
			<div class="form-group">
				<div class="col-sm-12">
					<h2 align="center">카테고리 등록하기</h2>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">카테고리 이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="categoryName" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">카테고리 번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="cno" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">카테고리 참조 번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="categoryLevel" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 left">
					<button type="reset" class="btn btn-warning">다시 입력</button>
					<button type="submit" class="btn btn-primary">카테고리 등록</button>
					<button type="button" class="btn btn-danger" onClick = "location.href = '/category/categoryList'">카테고리 목록</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>