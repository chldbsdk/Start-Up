<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main2</title>

<style>
	/*폰트*/
	@font-face {
    font-family: 'HSGyoulnoonkot';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/HSGyoulnoonkot.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	body {font-family: 'HSGyoulnoonkot';background-image : url("resources/Main2img/한지.jpg");}
	
	/*텍스트*/
	.text .title2 {font-size: 80px; position: absolute; top:35px; left: 35%;}
	.text .img1{position: absolute; top:250px; left: 400px;}
	.text .img2{position: absolute;top:325px; left: 800px;}
	.text .img3{position: absolute;top:250px; left: 1200px;}
	
	/*'메뉴 더보기' 버튼*/
	.button {display: inline-block;background-color: #999; color: #fff;
			width: 350px; height: 54px;text-align: center; font-size: 30px; 
			position: absolute; top: 775px; left: 1200px;line-height: 54px; outline: none;}
	.button:hover {background-color: #CCC;}
	.button::before,
	.button::after {position: absolute;z-index: -1;display: block;content: '';}
	.button,
	.button::before,
	.button::after {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;
					box-sizing: border-box;-webkit-transition: all .3s;transition: all .3s;}
					
</style>
</head>

<body>
<div class="text">
	<p class="title2"> 낙원의 대표 메뉴 </p>
	
	<ul class="img">
		<li class="img1"><img src="resources/Main2img/코다리정식.png" width="350px" height="500px"></li>
		<li class="img2"><img src="resources/Main2img/낙원비빔밥.png" width="350px" height="500px"></li>
		<li class="img3"><img src="resources/Main2img/화랑부대찌개.png" width="350px" height="500px"></li>
	</ul>
	
	<a class="button" onclick="goReplace('./.jsp')">메뉴 더보기</a>
</div>
</body>
</html>