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


function editInfo() {

	// let id = document.getElementById("userId").value
	let id = document.getElementById("userId").value
	let pwd = document.getElementById("userPwd").value
	let name = document.getElementById("userName").value
	let email = document.getElementById("userEmail").value
	let phone = document.getElementById("PhoneNumber").value
	let address = document.getElementById("address").value
	let detailAddress = document.getElementById("detailAddress").value
	let check = true

	if (id !== "${userId}") {
		document.getElementById("idError").innerHTML = "아이디는 수정할 수 없습니다."
		check = false;
	} else {
		document.getElementById("idError").innerHTML = ""
	}

	if (pwd === "" || pwd.length < 8 ) {
		document.getElementById("pwdError").innerHTML = "비밀번호는 반드시 8자리 이상으로 입력해주세요."
		check = false;
	} else {
		document.getElementById("pwdError").innerHTML = ""
	}

	if (name === "") {
		document.getElementById("nameError").innerHTML = "이름은 수정할 수 없습니다."
		check = false
	} else {
		document.getElementById("nameError").innerHTML = ""
	}

	if (email === "") {
		document.getElementById("emailError").innerHTML = "이메일은 비워둘 수 없습니다."
		check = false
	} else {
		document.getElementById("emailError").innerHTML = ""
	}

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

	if (check) {
		document.getElementById("pwdError").innerHTML = ""
		document.getElementById("nameError").innerHTML = ""
		document.getElementById("emailError").innerHTML = ""
		document.getElementById("phoneError").innerHTML = ""
		document.getElementById("addressError").innerHTML = ""
		document.getElementById("detailAddError").innerHTML = ""

		// setTimeout
		setTimeout(function() {
			alert("수정이 완료되었습니다.")
		}, 0);
	}
}

function withdrawalUser() {
	alert("탈퇴되었습니다.")
}

