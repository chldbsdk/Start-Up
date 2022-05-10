<%@ page session="false" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>낙원</title>
<style>
body {
	font-family: 'HSGyoulnoonkot';
	background-image : url("resources/Main2img/한지.jpg"); /*배경 바꿀거임*/
}
#resv-allwrap {
	padding-top: 80px;
	padding-bottmon: 60px;
	max-width: 1000px;
	height: 700px;
	margin: 0 auto;
}
#resv-content-wrap {margin-bottmon: 20p;}
.resv-vertical{
	margin-top: 20px;
	writing-mode: tb-rl;
	display: inline-block;
	width: 200px;
	vertical-align: top;
}
.vertical-title{
	display: inline-block;
	font-size: 35px;
	font-style: bold;
	color: #564b12;
	border-right: 3px solid #564b12;
	margin-right: 30px;
}
.vertical-detail{
	color: #8d825a;
}
.resv-horizontal{
	margin-left: 130px;
	display: inline-block;
	width: 600px;
	height: 700px;
	color: #8d825a;
}
.resv-text-wrap {display: inline-block;}
.resv-text-info {font-size: 17px;}
.left{
	display: inline-block;
	width: 80px;
	border-right: 2px solid #8d825a;
}
.right {margin-left: 10px;}
.rightspan {margin-left: 90px;}
.penalty{ margin-left: 20px;}
.rightspan , .noshow , .penalty , .resv-text {font-size: 15px;}
.resv-text-info , .operate , .resv-text {margin-bottom: 20px;}
.resvBtn{
	display: block;
	text-decoration: none;
	color: #8d825a;
	font-size: 17px;
	text-align: center;
	border: 1px solid #a99e78;
	width: 180px;
	height: 60px;
	line-height: 60px;
	margin-top: 30px;
	float: right;
}
</style>
</head>
<body>
<%@ include file="../main/top.jsp" %>

<div id="resv-allwrap">
	<div id="resv-content-wrap">
		<div class="resv-vertical">
			<div class="vertical-detail">미리 예약해 주시면 더욱 정성스러운 </div>
			<div class="vertical-detail">음식으로 보답하겠습니다. </div>
			<span class="vertical-title">예약안내</span>
		</div>
		<div class="resv-horizontal">
			<ul class="resv-text-wrap">
			<li class="resv-text-info"> 낙원은 4인실, 6인실, 8인실, 14인실 등의 룸과 40명까지 수용할 수 있는 홀에서 각종 비즈니스 모임, 상견례, 돌이나 회갑 등의 가족모임 등 각종 연회에 걸맞는 다양한 크기의 룸과 홀을 준비하고 있습니다. </li>
			<li class="address">
				<span class="left">주소</span>
				<span class="right">인천광역시 미추홀구 인하로 100</span>
			</li>
			<li class="operate">
				<span class="left">영업시간</span>
				<span class="right">화요일 ~ 토요일 16: 00 ~ 23 : 00 </span><br>
				<span class="rightspan">* 매주 일요일, 월요일은 휴무입니다.</span>
			</li>
			<li class="noshow">* No Show(예약을 하고 나타나지 않는 행위) 방지를 위해 예약금을 받고 있습니다.</li>
			<li class="noshow">* 예약금은 1인 기준 80,000원을 받고 있습니다.</li>
			<li class="penalty">  - 3일 전 취소: 패널티 없음</li>
			<li class="penalty">  - 2일 전 취소: 예약금 50% 패널티 적용</li>
			<li class="penalty">  - 1일 전 및 당일 취소: 예약금 100% 패널티 적용</li>
			<li class="resv-text">* 예약은 먼저 신청된 순서대로 확정됩니다.</li>
			<li class="tel">T. 010-1234-5678</li>
			<li class="email">E. nakwon@naver.com</li>
			</ul>
			<hr style="background-color: #a99e78; height: 1px;">
			<a class="resvBtn" href="#" onClick="location.href='http://localhost:8031/reservation'">예약하기</a>
		</div>
	</div>
</div>

<%@ include file="../main/footer.jsp" %>
</body>
</html>