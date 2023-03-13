// [1] 아이디 중복검사
let joinButton = document.querySelector(".signUp button");

let dupCheckId = 0;

function checkDuplicateId() {

	let id = document.getElementById("userId").value;
	
	if (id.length < 4 || id == "") {
		alert("아이디를 4자 이상 입력해주세요");

		return false;
	}

	$.ajax({
		url: '/member/checkDuplicateId',
		type: 'post',
		data:
		{
			'userId': id
		},
		dataType: 'json',

		success: function(returnDupIdResult) {

			if (returnDupIdResult == true) {

				alert('사용 가능한 아이디 입니다.');

				dupCheckId = 1;

				joinButton.style.background = '#297eff';
				joinButton.style.cursor = 'pointer';

				joinButton.disabled = false;
			

			} else {

				alert('중복된 아이디입니다.');

				dupCheckId = 0;

			}

		}
	})
}


// [2] 가입 양식 확인.
function signUpCheck() {

	let id = document.getElementById("userId").value
	let name = document.getElementById("userName").value
	let pwd = document.getElementById("userPwd").value
	let rePwd = document.getElementById("rePwd").value
	let email = document.getElementById("userEmail").value
	let address = document.getElementById("address").value
	let detailAddress = document.getElementById("detailAddress").value
	let check = true;

	// 아이디확인
	if (id === "" || id.length < 6 ) {
		document.getElementById("idError").innerHTML = "아이디는 필수입력 항목입니다.\n6자 이상 입력해주세요."
		check = false
		
	} else {
		document.getElementById("idError").innerHTML = ""
	}


	// 이메일확인
	if (email.includes('@')) {
		let emailId = email.split('@')[0]
		let emailServer = email.split('@')[1]
		if (emailId === "" || emailServer === "") {
			document.getElementById("emailError").innerHTML = "이메일은 필수입력 항목입니다"
			check = false
		}
		else {
			document.getElementById("emailError").innerHTML = ""
		}
	} else {
		document.getElementById("emailError").innerHTML = "이메일이 올바르지 않습니다."
		check = false
	}


	// 이름확인
	if (name === "" || name.length < 2) {
		document.getElementById("nameError").innerHTML = "이름은 필수입력 항목입니다"
		check = false
	} else {
		document.getElementById("nameError").innerHTML = ""
	}


	// 비밀번호 확인
	if (pwd !== rePwd) {
		document.getElementById("re-pwdError").innerHTML = "비밀번호가 동일하지 않습니다."
		check = false
	} else if (pwd === "") {
		document.getElementById("pwdError").innerHTML = "비밀번호를 입력해주세요."
		check = false
	} else if (rePwd === "") {
		document.getElementById("re-pwdError").innerHTML = "비밀번호를 입력해주세요."
		check = false
	} else {
		document.getElementById("pwdError").innerHTML = ""
		document.getElementById("re-pwdError").innerHTML = ""
	}

	// 성별체크확인
	if (!gender_man && !gender_woman) {
		document.getElementById("genderError").innerHTML = "성별을 선택해주세요."
		check = false
	} else {
		document.getElementById("genderError").innerHTML = ""
	}
	
	// 주소체크
	if (address === "") {
		document.getElementById("addressError").innerHTML = "주소를 검색해주세요."
		check = false
	} else {
		document.getElementById("addressError").innerHTML = ""
	}

	if (detailAddress === "") {
		document.getElementById("detailAddError").innerHTML = "상세주소를 입력해주세요."
		check = false
	} else {
		document.getElementById("detailAddError").innerHTML = ""
	}

	// 전체가 빈칸이 아닐때 회원가입을 가능하게 만든다.
	if (check) {
		
		if(dupCheckId == 1){

		//비동기 처리이벤트
		setTimeout(function() {
			alert("가입이 완료되었습니다.");
		}, 0);
			
		} else {
			
			alert("아이디 중복확인을 확인 해 주십시오.");
			
			return false;
			
		}
		
	} else {
		
		alert("필수 입력 사항을 확인 해 주세요.");
		
		event.preventDefault();
		
		return false;
	}

}

// 다음 주소 api
function findAddr() {
	new daum.Postcode({
		oncomplete: function(data) {
			console.log(data);

			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			let roadAddr = data.roadAddress; // 도로명 주소 변수
			let jibunAddr = data.jibunAddress; // 지번 주소 변수
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postAddress').value = data.zonecode;
			if (roadAddr !== '') {
				document.getElementById("address").value = roadAddr;
			}
			else if (jibunAddr !== '') {
				document.getElementById("address").value = jibunAddr;
			}
		}
	}).open();
}
