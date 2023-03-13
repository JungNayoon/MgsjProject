let userId = document.getElementById("userId");
let userPwd = document.getElementById("userPwd");

function memberLogin() {
	
	if (userId.value == "" || userId.value.length < 4) {
		alert("아이디는 4자 이상으로 반드시 입력해주세요!");
		userId.focus();
		
		event.preventDefault();
		return false;
	}
	
	if (userPwd.value == "" || userPwd.value.length < 4) {
	
		alert("비밀번호는 6자 이상으로 반드시 입력해주세요!");
		userPwd.focus();
		
		event.preventDefault();
		return false;
	}

}