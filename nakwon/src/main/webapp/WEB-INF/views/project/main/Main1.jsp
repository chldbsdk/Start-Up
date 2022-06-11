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
   .text .title {font-size: 100px; position:absolute; top: 175px; left: 330px;}
   .text .detail{font-size: 30px; text-align: center; position: absolute; top: 350px; left: 250px;}
   
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
   .section .slidewrap {max-width:1000px; position:relative; margin-top: 50px; margin-left: 800px; overflow:hidden;}
   .section .slidelist { white-space:nowrap; font-size:0; overflow:hidden; position:relative; }
   .section .slidelist > li {display:inline-block;vertical-align:middle;width:1000px;transition:all .5s;}
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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
</head>
<body> 

<script>
   $(document).ready(function() {
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
   });
   
</script>

<div class="text">
   <p class="title"> 낙원 </p>
   <p class="detail">    공간의 가치를 담은<br>
                  안락한 '맛의 무릉도원'<br>
                  3대째 이어져 오는 고급한정식</p>   
   <a class="button" onclick="location.href='http://localhost:8031/reservationMain'">예약하기</a>
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