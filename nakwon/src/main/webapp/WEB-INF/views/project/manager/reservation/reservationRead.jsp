<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
@font-face {
    font-family: 'Yeon Sung', cursive;
    src: url('https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap') ;
    font-weight: normal;
    font-style: normal;
}
.introducebody{
	margin: 0; 
	padding: 0;
}
a { text-decoration:none; }
.introduce{
	position:fixed; 
	top:0; 
	left:0; 
	right:0; 
	bottom:0;
	background:rgba(0,0,0,.5);
	font-size:0; 
	text-align:center;
	overflow:auto;
}
.introduce:after{ 
	display:inline-block; 
	height:100%; 
	vertical-align:middle;
	content:'';
}
.introduce .inner{
	display:inline-block; 
	padding:20px 30px;
	background:#fff; 
	width:50%; 
	vertical-align:middle;
	font-size:15px;
}
.btn_close {
	display: block;
	width: 20px;
	height: 20px; 
	margin: 5px auto;
	color: black;
	font-size: 1rem;
	border: none;
	border-radius: 30px;
	cursor: pointer;
	transition: .3s linear;
	float:right;
	background-color:lightgray;
} 

#label { text-align:center; width:100px; height:20px;margin-top: 20px;  float:left;} 
#labelImg{font-size: 2rem;text-align:center;width:100px;height:20px;margin-top: 20px;  float:left;cursor: pointer;}

.btn_next {
	display: block;
	width: 45px;
	height: 40px;
	margin: 5px auto;
	color: black;
	font-size: 1rem;
	border: none;
	border-radius:10px;
	cursor: pointer;
	transition: .3s linear;
	float:right;
	background-color:lightgray;
	font-family: 'Yeon Sung', cursive; 
	font-color: #0D47A1;
} 
.input {
	width: 98%;
	height: 30px; 
	border: none;
	background-color: #ededed;
	border-radius: 4px;
	color: #333;
	padding:8px;
	margin-top:8px;
}
textarea { 
	resize: none; 
	width: 70%;
	height: 20px;
	border: none;
	background-color: #ededed;
	border-radius: 4px;
	color: #333;
	padding:100px;
	margin-top: 10px;
	vertical-align:top;
}
.reservationTable, .reservationTable tr, .reservationTable td{ border:none; }
.reservationTable{ 
	width: 900px; 
	text-align: left;
}
.Title{ 
	font-weight: bold;
	text-align:center;
}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body class="reservationbody">
<% request.setCharacterEncoding("UTF-8"); %>
<form class="reservationRead" name="introduceReadform" method="post" accept-charset="utf-8" action="introducecheck.do">
	<div class="wrap">
		<div id="read_reservation" class="reservation" style="display:none;">
	
	<div class="inner">
		
		<button type="button" class="btn_close"><i class="fa fa-close"></i></button>
		<h2 style="float:center;">예약 등록</h2>
	<div id="table-wrap">
		<table class="reservationTable">
		<tr><td class="Title">예약자명</td><td><input class="input" name="name" type="text" value="${vo.name}" readonly="readonly"></td></tr>
		<tr><td class="Title">연락처</td><td><input class="input" name="phone" type="text" value="${vo.phone}" readonly="readonly"></td></tr>
		<tr><td class="Title">이메일</td><td><input class="input" id="user-email" name="user-email" type="text" value="${vo.email}" readonly="readonly"></td></tr>
		<tr><td class="Title">예약일</td><td><input type="text" class="input" id="publeYear" class="reservationInput" name="publeYear" value="${vo.rsrvDate}" readonly="readonly"></td></tr>
		<tr><td class="Title">예약인원</td><td><input type="text" class="input" id="publeYear" class="reservationInput" name="publeYear" value="${vo.pnum}" readonly="readonly"></td></tr>
		<tr><td class="Title">메뉴</td><td><input type="text" class="input" id="publeYear" class="reservationInput" name="publeYear" value="의 ${vo.menuCodeName}" readonly="readonly"></td></tr>
		<tr><td class="Title">특별요청사항</td><td><textarea class="message" name="message">${vo.message}</textarea>
			<input type="hidden" name="rsrvCode" value="${vo.rsrvCode }" >
			<input type="hidden" name="CodeName" value="${vo.codeName }" >
			<input type="hidden" name="MenuCode" value="${vo.menuCode }" >
			<input type="hidden" name="MenuCodeName" value="${vo.menuCodeName }" >
			</td>
		</tr>
	</table>
	</div>
	<button type="button" class="btn_next" onclick="AddBtn()">수정</button>
	<button type="button" class="btn_next" onclick="AddBtn()">삭제</button>	
	</div>
		</div>
	</div>
</form>

<script type="text/javascript">	
$(document).ready(function() {
	$("#open").click(function() {
		$("#add_introduce").show();
	});
	$("#modify").click(function() {
		$("#modify_introduce").show();
	});
	$("#delete").click(function() {
		$("#delete_introduce").show();
	});	
});
	var target=document.querySelectorAll('.btn_add');
	var targetID;
	var btnPopClose = document.querySelectorAll('.introduce .btn_close');
	for(var i=0;i<target.length;i++) {
		target[i].addEventListener('click',function() {
			targetID=this.getAttribute('href');
			//document.querySelector(targetID).style.display='block';
		});
	}
	
	// 팝업 닫기
	for(var j = 0; j < target.length; j++){
	  btnPopClose[j].addEventListener('click', function(){
	    this.parentNode.parentNode.style.display = 'none';
	  });
	}
</script>
</body>
</html> 