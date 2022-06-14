<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset='UTF-8'>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<title>Main1</title>

	<style>
	/*폰트*/
	@font-face {
    font-family: 'HSGyoulnoonkot';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/HSGyoulnoonkot.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	body {font-family: 'HSGyoulnoonkot';background-image : url("resources/Main1img/한지.png");}
	
	/*텍스트*/	
	.text{position:relative;}
	.text .title1 {font-size: 100px; position:absolute; top: 130px; left: 330px;}
	.text .detail{font-size: 30px; text-align: center; position: absolute; top: 280px; left: 250px;}
	
	/*'예약하기' 버튼*/
	.button {display: inline-block;background-color: #999; color: #fff;
			width: 350px; height: 54px;text-align: center; font-size: 30px; 
			position: absolute; top: 450px; left: 275px;line-height: 54px; outline: none;}
	.button:hover {background-color: #CCC;}
	.button::before,
	.button::after {position: absolute;z-index: -1;display: block;content: '';}
	.button,
	.button::before,
	.button::after {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;
					box-sizing: border-box;-webkit-transition: all .3s;transition: all .3s;}
		
	/*배너*/		
	* {margin: 0;  padding: 0;}
	.slideshow-container { max-width:1000px; position:relative; margin-top: 100px; margin-left: 800px; overflow:hidden}
	.slideshow-container .mySlides img { margin-left: 50px; width:900px; height: 600px;}
	.mySlides { display: none;}
	
	/*화살표*/
	.prev, .next {cursor: pointer; position: absolute; top: 50%; width: auto; margin-top: -80px; padding: 60px; 
				color: white; font-weight: bold; font-size: 45px; border-radius: 0 3px 3px 0; user-select: none;}
	.next {right: 0; border-radius: 3px 0 0 3px;}	
	
	/* 하단 버튼 */
	.btn {margin-left: 1125px;}
	.dot {display: inline; padding:5px 50px; border-radius:30px; background:#ccc; 
		  margin:20px 10px; cursor:pointer; width: 50px; }	
	.active, .dot:hover {background-color: #717171;}
	
	/* 넘기기 */
	.fade {-webkit-animation-name: fade; -webkit-animation-duration: 1.5s;
	  	animation-name: fade; animation-duration: 1.5s;}	
	@-webkit-keyframes fade {from {opacity: .4} to {opacity: 1}}
	@keyframes fade {from {opacity: .4}  to {opacity: 1}}	
</style>
</head>
<body> 
<div class="text">
	<p class="title1"> 낙원 </p>
	<p class="detail"> 	공간의 가치를 담은<br>
						안락한 '맛의 무릉도원'<br>
						3대째 이어져 오는 고급한정식</p>	
	<a class="button" onClick="location.href='http://localhost:8031/reservationMain'">예약하기</a>
</div>

<!-- 배너 -->
<div class="slideshow-container">
      <!-- 배너 이미지 -->
      <div class="mySlides fade"><img src="resources/Main1img/Hanok.jpg" ></div>
      <div class="mySlides fade"><img src="resources/Main1img/K-Food.jpg" ></div>
      <div class="mySlides fade"><img src="resources/Main1img/Jangdokdae.jpg"></div>

      <!-- 화살표 -->
      <a class="prev" onclick="moveSlides(-1)">&#10094;</a>
      <a class="next" onclick="moveSlides(1)">&#10095;</a>
</div><br>

<!-- 하단 버튼 -->
<div class="btn">
	<span class="dot" onclick="currentSlide(0)"></span>
	<span class="dot" onclick="currentSlide(1)"></span>
	<span class="dot" onclick="currentSlide(2)"></span>
</div><br><br>

<script>
	var slideIndex = 0; 
	
	//HTML 로드가 끝난 후 동작
	window.onload=function(){
	showSlides(slideIndex);
	
	// 자동 배너
	var sec = 4000; //4초
	setInterval(function(){
	 slideIndex++;
	 showSlides(slideIndex);	
	}, sec);
	}
		
	//화살표
	function moveSlides(n) {
	slideIndex = slideIndex + n
	showSlides(slideIndex);
	}
	
	//이미지
	function currentSlide(n) {
	slideIndex = n;
	showSlides(slideIndex);
	}
	
	function showSlides(n) {
	
	var slides = document.getElementsByClassName("mySlides");
	var dots = document.getElementsByClassName("dot");
	var size = slides.length;
	
	if ((n+1) > size) {
	 slideIndex = 0; n = 0;
	}else if (n < 0) {
	 slideIndex = (size-1);
	 n = (size-1);
	}
	
	for (i = 0; i < slides.length; i++) {
	   slides[i].style.display = "none";
	}
	for (i = 0; i < dots.length; i++) {
	   dots[i].className = dots[i].className.replace(" active", "");
	}
	
	slides[n].style.display = "block";
	dots[n].className += " active";
	}
</script>
</body>
</html>