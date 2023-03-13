<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>제품 등록(간이)</title>
<style type="text/css">
#product-content {
	min-height: 800px;
	display: flex;
}

.inner-content {
	display: flex;
	margin: 0 auto;
	justify-content: center;
}

.img-management {
	float: left;
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
}

.show-image img {
	z-index: 1;
}

textarea {
	width: 450px;
	height: 200px;
	resize: none;
}
</style>
</head>
<body>
	<div id="product-content" align="center">
		<div class="inner-content">
			<form class="productReg" action="/product/productWrite" method="post" enctype="multipart/form-data">

				<div class="img-management">
				
					<div class="img-area">
						<div class="img-area-item">
							<div class="show-image">
								<img src="" />
							</div>
						</div>
					</div>
	
					<div>
						<label for="productFile">이곳을 클릭하여 이미지 업로드</label>
						<br>
						<input type="file" id="productFile" name="file">
					</div>
					<!-- 경로 : D:\jsp\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp8\wtpwebapps\Mgsjproject\ -->
				</div>

				<div class="container" align="center">
					<!-- form-action은 타이틀 밑의 js파일에서 구현 예정 -->
					<div class="form-group">
						<div class="col-sm-12">
							<h2 align="center">상품 등록하기</h2>
						</div>
					</div>
					<label>1차 분류</label>
					<select class="category1">
						<option value="">전체</option>
					</select>
					<label>2차 분류</label>
					<select class="category2" name="cno">
						<option value="">전체</option>
					</select>
					<div class="form-group">
						<label class="col-sm-2 control-label">제품이름</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="productName" maxlength="20" placeholder="제품 이름 입력" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">제품 가격</label>
						<div class="col-sm-4">
							<input type="number" class="form-control" name="productPrice" maxlength="20" placeholder="제품 가격 입력" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">제품 재고</label>
						<div class="col-sm-3">
							<input type="number" class="form-control" name="productStock" maxlength="10" placeholder="제품 재고 입력" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">제품 설명</label>
						<div class="col-sm-8">
							<textarea class="form-control" id="content" name="productDescription" rows="10" cols="160" placeholder="제품 설명 입력"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 left">
							<button type="reset" class="btn btn-warning">다시 입력</button>
							<button type="submit" class="btn btn-primary">게시글 등록</button>
							<button type="button" class="btn btn-danger" onClick="location.href = '/product/productList'">상품 목록 이동</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script>
		//컨트롤러에서 데이터 받기
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
		}

		//1차 분류 셀렉트 박스에 데이터
		var cate1Select = $ ( 'select.category1' )

		for ( var i = 0; i < cate1Arr.length; i++ ) {
			cate1Select.append ( "<option value='" + cate1Arr[i].cno + "'>" + cate1Arr[i].categoryName + "</option>" );
		}

		// select 태그 데이터 테스트
		/* function consolefunc() {
		   console.log(cate1Select);   
		} */

		$ ( document ).on ( "change" , "select.category1" , function () {

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
			} */

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

		} );

		$ ( "#productFile" ).change ( function () {
			// id = "productFile"이 바뀌었을 때

			if ( this.files && this.files[0] ) {
				// this에 (id = "productFile") 파일이 있다면.

				var reader = new FileReader;
				reader.onload = function ( data ) {
					$ ( ".show-image img" ).attr ( "src" , data.target.result ).width ( 350 ).height ( 350 );
				}
				reader.readAsDataURL ( this.files[0] );
			}
		} );
	</script>
</body>
</html>