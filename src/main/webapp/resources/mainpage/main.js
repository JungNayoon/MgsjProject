/**
 * 
 */
/*슬라이드 배너*/

function showSlides(slideIndex) {
	let slides = document.getElementsByClassName("mySlides");
	let dots = document.getElementsByClassName("dot");
	
	if (slideIndex > slides.length) {
		slideIndex = 1;
	}
	if (slideIndex < 1) {
		slideIndex = slides.length;
	}
	
	for (i = 0; i < slides.length; i++) {
		
		slides[i].style.display = "none";
		
	}
		slides[slideIndex - 1].style.display = "block";
		
	for (i = 0; i < dots.length; i++) {
		
		dots[i].className = dots[i].className.replace(" active", "");
		
	}
	
		dots[slideIndex - 1].className += " active";
	
}

let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
	showSlides(slideIndex += n);
}

function currentSlide(n) {
	showSlides(slideIndex = n);
}

function memberLogout() {
	let logoutYN = confirm("로그아웃 하시겠습니까?");

	if (logoutYN == true) {
		alert("로그아웃 되었습니다");
		location.href = "/member/memberLogout"; /* 세션 invalidate */

	} else {
		alert("로그아웃을 취소하셨습니다.");
	}
}