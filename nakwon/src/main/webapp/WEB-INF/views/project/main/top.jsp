<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
@font-face {
    font-family: 'HSGyoulnoonkot';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/HSGyoulnoonkot.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.topdiv {
   background-color:#fce8c5;
   padding:10px;
}
.topul {
   list-style:none;
   text-align:center;
}
.topli {
   display : inline-block;
   float:none;
   margin:0 40px;
   font-size:20px;
   font-family:'HSGyoulnoonkot';
   width: 100px;
}
.topli a{
   color:black;
   text-decoration: none;
}
</style>
<body  topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
<div class="topdiv">
<ul class="topul">
<li class="topli"><a href=#>소개</a></li>
<li class="topli"><a href="#" onclick="location.href='http://localhost:8031/Main1'">메뉴</a></li>
<li class="topli"><a href="#" onClick="location.href='http://localhost:8031/reservationMain'">예약</a></li>
<li class="topli"><a href="#" onclick="location.href='http://localhost:8031/login'"><img src="resources/img/logo.png"  width="100" height="100"></a></li>
<li class="topli"><a href="#" onclick="location.href='http://localhost:8031/location'">오시는 길</a></li>
<li class="topli"><a href=#>고객의 소리</a></li>
<li class="topli"><a href=#>공지</a></li>
</ul></div>
</body>
</html> 