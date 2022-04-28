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
	.text .title {font-size: 100px; position:absolute; top: 175px; left: 330px;}
	.text .detail{font-size: 30px; text-align: center; position: absolute; top: 350px; left: 250px;}
	.text .notice{font-size: 20px; color: red; position: absolute; top: 86px; left: 1350px;}
	
	/*'예약하기' 버튼*/
	.button {display: inline-block;background-color: #999; color: #fff;
			width: 350px; height: 54px;text-align: center; font-size: 30px; 
			position: absolute; top: 550px; left: 275px;line-height: 54px; outline: none;}
	.button:hover {background-color: #CCC;}
	.button::before,
	.button::after {position: absolute;z-index: -1;display: block;content: '';}
	.button,
	.button::before,
	.button::after {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;
					box-sizing: border-box;-webkit-transition: all .3s;transition: all .3s;}
					
	
	/*배너*/
	* {margin:0;padding:0;}
	.section input[id*="slide"] {display:none;}
	.section .slidewrap {max-width:1000px; position:relative; bottom: 50px; right: 125px;}
	.section .slidelist {white-space:nowrap;font-size:0;overflow:hidden;position:relative;}
	.section .slidelist > li {display:inline-block;vertical-align:middle;width:100%;transition:all .5s;}
	.section .slidelist > li > a {display:block;position:relative;}
	.section .slidelist > li > a img {width:100%;}
	.section .slidelist label {position:absolute;z-index:10;top:50%;transform:translateY(-50%);padding:50px;cursor:pointer;}
	.section .slidelist .textbox {position:absolute;z-index:1;top:50%;left:50%;transform:translate(-50%,-50%);line-height:1.6;text-align:center;}
	
	/* input에 체크되면 슬라이드 효과 */
	.section input[id="slide01"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
	.section input[id="slide02"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
	.section input[id="slide03"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}

	
	/* 좌,우 슬라이드 버튼 */
	.slide-control > div {display:none;}
	.section .left {left:1px;background:url('resources/Main1img/left.png') center center / 100% no-repeat;}
	.section .right {right:1px;background:url('resources/Main1img/right.png') center center / 100% no-repeat;}
	.section input[id="slide01"]:checked ~ .slidewrap .slide-control > div:nth-child(1) {display:block;}
	.section input[id="slide02"]:checked ~ .slidewrap .slide-control > div:nth-child(2) {display:block;}
	.section input[id="slide03"]:checked ~ .slidewrap .slide-control > div:nth-child(3) {display:block;}

	/* 페이징 */
	.slide-pagelist {text-align:center;padding:20px;}
	.slide-pagelist > li {display:inline-block;vertical-align:middle;}
	.slide-pagelist > li > label {display:block;padding:8px 30px;border-radius:30px;background:#ccc;margin:20px 10px;cursor:pointer;}
	.section input[id="slide01"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(1) > label {background:#999;}
	.section input[id="slide02"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(2) > label {background:#999;}
	.section input[id="slide03"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(3) > label {background:#999;}
</style>
</head>

<body> 
<script type="text/javascript">

/*$(document).ready(function () {
	$(".slideitem").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김
	
	setInterval(nextSlide, 3000); //3초(3000)마다 다음 슬라이드로 넘어감
});

//이전 슬라이드
function prevSlide() {
	$(".slideitem").hide(); //모든 div 숨김
	var allSlide = $(".slideitem"); //모든 div 객체를 변수에 저장
	var currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수
	
	//반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
	$(".slideitem").each(function(index,item){ 
		if($(this).hasClass("active")) {
			currentIndex = index;
		}
        
	});
	
	//새롭게 나타낼 div의 index
	var newIndex = 0;
    
	if(currentIndex <= 0) {
		//현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
		newIndex = allSlide.length-1;
	} else {
		//현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
		newIndex = currentIndex-1;
	}

	//모든 div에서 active 클래스 제거
	$(".slideitem").removeClass("active");
    
	//새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
	$(".slideitem").eq(newIndex).addClass("active");
	$(".slideitem").eq(newIndex).show();

}

//다음 슬라이드
function nextSlide() {
	$(".slideitem").hide();
	var allSlide = $(".slideitem");
	var currentIndex = 0;
	
	$(".slideitem").each(function(index,item){
		if($(this).hasClass("active")) {
			currentIndex = index;
		}
        
	});
	
	var newIndex = 0;
	
	if(currentIndex >= allSlide.length-1) {
		//현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
		newIndex = 0;
	} else {
		//현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
		newIndex = currentIndex+1;
	}

	$(".slideitem").removeClass("active");
	$(".slideitem").eq(newIndex).addClass("active");
	$(".slideitem").eq(newIndex).show();
	
}*/

	/*$(document).ready(function() {
		//사용할 배너
		var $banner = $(".slidewrap").find(".slidelist");

		var $bannerWidth = $banner.children().outerWidth();//배너 이미지의 폭
		var $bannerHeight = $banner.children().outerHeight(); // 높이
		var $bannerLength = $banner.children().length;//배너 이미지의 갯수
		var rollingId;

		//정해진 초마다 함수 실행
		rollingId = setInterval(function() { rollingStart(); }, 3000);//다음 이미지로 롤링 애니메이션 할 시간차
				
		function rollingStart() {
			$banner.css("width", $bannerWidth * $bannerLength + "px");
			$banner.css("height", $bannerHeight + "px");
			//alert(bannerHeight);
			//배너의 좌측 위치를 옮겨 준다.
			$banner.animate({left: - $bannerWidth + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
				//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
				//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
				$(this).find("li:first").remove();
				//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
				$(this).css("left", 0);
				//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다..
			});
		}
	}); */
</script>

<div class="text">
	<p class="title"> 낙원 </p>
	<p class="detail"> 	공간의 가치를 담은<br>
						안락한 '맛의 무릉도원'<br>
						3대째 이어져 오는 고급한정식</p>	
	<a class="button" onclick="goReplace('./.jsp')">예약하기</a>
</div>


<div class="section">
	<input type="radio" name="slide" id="slide01" checked>
	<input type="radio" name="slide" id="slide02">
	<input type="radio" name="slide" id="slide03">
	
	<div class="slidewrap">	
		<ul class="slidelist">
			<!-- 슬라이드 영역 -->
		 	<li class="slideitem"><a><img src="resources/Main1img/Hanok.jpg"></a></li>
			<li class="slideitem"><a><img src="resources/Main1img/K-Food.jpg"></a></li>
			<li class="slideitem"><a><img src="resources/Main1img/Jangdokdae.jpg"></a></li> 

			<!-- 좌,우 슬라이드 버튼 -->
			<div class="slide-control">
				<div>
					<label for="slide03" class="left"></label>
					<label for="slide02" class="right"></label>
				</div>
				<div>
					<label for="slide01" class="left"></label>
					<label for="slide03" class="right"></label>
				</div>
				<div>
					<label for="slide02" class="left"></label>
					<label for="slide01" class="right"></label>
				</div>
			</div>
		</ul>
		
		<!-- 페이징 -->
		<ul class="slide-pagelist">
			<li><label for="slide01"></label></li>
			<li><label for="slide02"></label></li>
			<li><label for="slide03"></label></li>
		</ul>
	</div>	
</div>
</body>
</html>
