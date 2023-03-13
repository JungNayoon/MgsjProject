let openButton = document.querySelector('.open');
let modal = document.querySelector('.modal');
let closeButton = document.querySelector('.close');

openButton.addEventListener('click', () => {
  modal.style.display = 'flex';
  openButton.style.display = 'none';
});

closeButton.addEventListener('click', () => {
  modal.style.display = 'none';
  openButton.style.display = 'inline';
});



//---------------------------------------------------

// 제이쿼리 방식
// 근데 얘는 최초 한번만 실행됨 이유를 몰루겠네 ㅇ.ㅇ

// $(function(){ 

//   $(".open").click(function(){
//     $(".modal").fadeIn(200);
//   });
  
//   $(".close").click(function(){
//     $(".modal-content").fadeOut(200);
//   });

//   $(".modal").css({
//     "top": (($(window).height())/2+$(window).scrollTop())+"px",
//     "left": (($(window).width())/2+$(window).scrollLeft())+"px"
//   });

// });