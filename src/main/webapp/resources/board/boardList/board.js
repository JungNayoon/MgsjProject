function searchingActivate() {
	let searchType = document.getElementsByName("searchType")[0].value;
	let keyword = document.getElementsByName("keyword")[0].value;
	
	/* 만약 select 태그가 카테고리(option 태그 value = 'category' 라면 changeCategoryValue 함수의 결과값을 키워드에 넣어 검색한다. */
	if(searchType == 'category'){
		keyword = changeCategoryValue();
	}
	
	/* select 태그의 value인 searchType에 관한 option태그의 값과
	input태그에 들어간 keyword 값을 쿼리스트링으로 보내 첫페이지를 출력한다. */
	location.href = "/board/adminBoardList?pageNum=1" + "&searchType="
		+ searchType + "&keyword=" + keyword;
	
}

/* input 태그 안에서 enter키 (keyNumber == 13) 누르면 검색 시작. */
function enterSearching() {
	if (window.event.keyCode == 13) {
		searchingActivate();
	}
}