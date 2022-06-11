<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" %>
<html>
<head>
<style>
@font-face {
    font-family: 'HSGyoulnoonkot';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/HSGyoulnoonkot.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
ul, li, div{
	font-family: 'HSGyoulnoonkot';
}
li{
   list-style: none;
   margin-bottom: 10px;
   }
ul{
   padding-left: 0px;
   }
.title::after{
   content:"";
   display: block;
   margin-top: 15px;
   border-bottom: 1px solid #2a2a2a;
   clear: both;
   }
#footer-wrap {
   width: 100%
   margin: 0 auto;
   padding-bottom: 30px;
   background-color: #fce8c5;
   color: #2a2a2a;
   }
#footer-wrap .footer-content-wrap{
   width: 100%;
   max-width: 1000px;
   margin: 0 auto;
   color: ;
   padding-top: 40px;
   }
#footer-wrap .footer-content-wrap .footer-content-left{
   width: 440px;
   text-align: center;
   }
#footer-wrap .footer-content-wrap .footer-content-center{
   width: 390px;
   text-align: center;
   }
#footer-wrap .footer-content-wrap .footer-content-right{
   width: 175px;
   text-align: center;
   }
div.title{
   font-size: 20px;
   padding-bottom: 5px;
   }
.text-wrap li.phone{
   margin-top: 25px;
   }
.text-wrap li.phone .right, .text-wrap li.email .right{
   margin-left: 13px;
   }
.text-wrap li.phone .left, .text-wrap li.email .left{
   border-right: 1px solid #2a2a2a;
   }
.text-wrap .left{
   width: 60px;
   margin-left:50px;
   }
.text-wrap .left, #footer-wrap .footer-content-wrap .footer-content, .text-wrap .right{
   float: left;
   }
.clearfix::after{
   content: " ";
   visibility: hidden;
   display: block;
   font-size: 0;
   clear: both;
   }
#footer-wrap .footer-content-wrap .footer-content{
   float: left;
   width: 33.3%
   }
</style>
</head>

<body>
<div id="footer-wrap">
   <div class="footer-content-wrap clearfix">
      <div class="footer-content footer-content-left">
      <div class="title">연락처 & 위치</div>
      <ul class="text-wrap">
         <li class="phone clearfix">
            <div class="left">Phone</div>
            <div class="right">010.1234.5678</div>
         </li>
         <li class="email clearfix">
            <div class="left">E-mail</div>
            <div class="right">nakwon@naver.com</div>
         </li>
         <li class="addr">인천광역시 미추홀구 인하로 100</li>
         <li class="addr">100, Inha-ro, Michuhol-gu, Incheon, Republic of Korea</li>
      </ul>
      </div>

      <div class="footer-content footer-content-center">
         <div class="title">운영 시간</div>
         <ul class="text-wrap">
            <li class="op_day">화요일 - 토요일</li>
            <li class="op_day">TUE - SAT</li>
            <li class="time">16 : 00 ~ 23 : 00</li>
         </ul>
      </div>

      <div class="footer-content footer-content-right">
         <div class="title">대표</div>
         <ul class="text-wrap">
            <li class="represent" onClick="location.href='http://localhost:8031/login'">정승경</li>
            <li class="represent" onClick="location.href='http://localhost:8031/login'">이가온</li>
            <li class="represent" onClick="location.href='http://localhost:8031/login'">최윤아</li>
         </ul>
      </div>
   </div>
</div>
</body>
</html> 