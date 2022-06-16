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
.reservationbody{
	margin: 0; 
	padding: 0;
}
a { text-decoration:none; }
.reservation{
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
.reservation:after{ 
	display:inline-block; 
	height:100%; 
	vertical-align:middle;
	content:'';
}
.reservation .inner{
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

<!-- 달력의 주말 색상 다르게 변경(일: 빨강, 토: 파랑)-->
.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:first-child a { color: red; }
.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:last-child a { color: #0099ff; }
.ui-datepicker-calendar>thead>tr>th:first-child { color: red !important; } 
.ui-datepicker-calendar>thead>tr>th:last-child { color: #0099ff !important; } 
.ui-datepicker-calendar {
	background: white;
	border: 1px solid white;
	color: white;
}
.ui-datepicker-calendar>thead {
	background: white;
	color: black;
	font-weight: bold;
	font-size: 14px;
}
.ui-datepicker-calendar>tbody {font-size: 14px;}
.ui-widget-content .ui-state-highlight {background: #ffd700 !important;}
.ui-datepicker-title {font-size: 14px; padding: 5px;}
.ui-datepicker select.ui-datepicker-year, .ui-datepicker select.ui-datepicker-month {background: white;}
.ui-widget-content .ui-widget-header{background: white !important;}
.ui-state-default, .ui-widget-content .ui-state-default,
.ui-widget-header .ui-state-default, .ui-button,
html .ui-button.ui-state-disabled:hover, html .ui-button.ui-state-disabled:active {text-align: center;} 
.ui-widget.ui-widget-content { border: 1px solid #eee; }
.ui-datepicker-calendar>tbody>tr>td>a { 
	font-size: 12px !important; 
	font-weight: bold !important;
}
.ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover {
	cursor: auto; 
	background-color: white;
}
.ui-datepicker-calendar>tbody>tr>td:hover { 
	background-color: #0081cc; 
	opacity: 1; 
}
.ui-datepicker-calendar>tbody>tr>td { 
	border-radius: 50% !important; 
	width: 44px; 
	height: 30px;
	padding: 5px; 
	font-size: 12px; 
} 
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body class="reservationbody">
<% request.setCharacterEncoding("UTF-8"); %>
<form class="reservationAdd" name="reservationAddform" method="post" accept-charset="utf-8" action="introducecheck.do">
	<div class="wrap">
		<button type="button" id="open" class="btn_add">예약 등록</button>
		<button type="button" id="modify" class="btn_modify">예약 확정</button>
		<button type="button" id="delete" class="btn_delete">예약 삭제</button>
		<div id="add_reservation" class="reservation" style="display:none;">
	
	<div class="inner">
		
		<button type="button" class="btn_close"><i class="fa fa-close"></i></button>
		<h2 style="float:center;">예약 등록</h2>
	<div id="table-wrap">
		<table class="reservationTable">
		<tr><td colspan="2">
			<label><input type="radio" id="type" class="Title" name="type" value="hold" onchange="radiochk()"> 예약 보류 </label>
			<label><input type="radio" id="type" class="Title" name="type" value="confirm" onchange="radiochk()" > 예약 확정 <br></label>
		</td></tr>
		<tr><td class="Title">예약자명</td><td><input class="input" name="name" type="text" required></td></tr>
		<tr><td class="Title">연락처</td><td><input class="input" name="phone" placeholder="'-'를 제외하고 입력해주세요" type="text" required></td></tr>
		<tr style="border-bottom: 2px solid #dddddd;"><td class="Title" style="padding-bottom: 15px;">이메일</td><td style="padding-bottom: 15px;"><input class="reservationInput" id="user-email" name="user-email" type="text" required><div id="at" style="display: inline-block"> @ </div> 
				<select id="domain" name="domain" onChange="direct(this)" required>
					<option value="">도메인 선택</option>
					<option value="naver.com">naver.com</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hanmail.com">hanmail.com</option>
					<option value="direct">직접입력</option>
				</select>
				<!-- 직접입력 누르면 나올 inputbox -->
				<input type="text" id="selBoxDirect" name="selBoxDirect" style="display: none;" onblur="directonblur()" required>
			</td>
		</tr>
		<tr><td class="Title" style="padding-top: 15px;">예약일</td><td style="padding-top: 15px;"><input type="text" id="publeYear" class="reservationInput" name="publeYear" placeholder="날짜선택(클릭해주세요)" autocomplete="off" required>
				<select id="timeselect" name="timeselect" required>
					<option value="" selected>시간</option>
					<option value="16:00:00">16 : 00</option>
					<option value="16:30:00">16 : 30</option>
					<option value="17:00:00">17 : 00</option>
					<option value="17:30:00">17 : 30</option>
					<option value="18:00:00">18 : 00</option>
					<option value="18:30:00">18 : 30</option>
					<option value="19:00:00">19 : 00</option>
					<option value="19:30:00">19 : 30</option>
					<option value="20:00:00">20 : 00</option>
					<option value="20:30:00">20 : 30</option>
					<option value="21:00:00">21 : 00</option>
					<option value="21:30:00">21 : 30</option>
					<option value="22:00:00">22 : 00</option>
					<option value="22:30:00">22 : 30</option>
				</select>
			</td>
		</tr>
		<tr><td class="Title">예약인원</td><td>
				<select id="Pnum" name="Pnum" required>
					<option value="" selected>인원</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="20">20명 이상(대관)</option>
				</select>
			</td>
		</tr>
		<tr><td class="Title" style="padding-bottom: 15px;">메뉴</td><td style="padding-bottom: 15px;">
					<select id="courseselect" name="courseselect" onchange="courseChange(this)" required>
						<option value="" selected>코스선택</option>
						<option value="course">만찬(풀코스)</option>
						<option value="set">정찬(세트메뉴)</option>
					</select>
					
					<select id="menuselect" name="menuselect">
						<option value="">메뉴선택</option>
					</select> 
			</td>
		</tr>
		<tr><td class="Title">특별요청사항</td><td style="padding: 15px 0 15px 0;"><textarea class="message" name="message"></textarea>
			<input type="hidden" name="email" value="" >
			<input type="hidden" name="rsrvDate" value="" >
			<input type="hidden" name="rsrvCode" value="" >
			<input type="hidden" name="CodeName" value="" >
			<input type="hidden" name="MenuCodeName" value="" >
			</td>
		</tr>
	</table>
	</div>
	<button type="button" class="btn_next" onclick="AddBtn()">등록</button>
		
	</div>
		</div>
	</div>
</form>


<script type="text/javascript">	
$(document).ready(function() {
	$("#open").click(function() {
		$("#add_reservation").show();
	});
	$("#modify").click(function() {
		$("#modify_reservation").show();
	});
	$("#delete").click(function() {
		$("#delete_reservation").show();
	});	
});
	var target=document.querySelectorAll('.btn_add');
	var targetID;
	var btnPopClose = document.querySelectorAll('.reservation .btn_close');
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
	
	function AddBtn() {
				
		if(document.introduceAddform.IntroTitle.value=="" && document.introduceAddform.IntroContent.value=="") {
			alert("제목 또는 상세 내용을 입력해주세요.");
			document.introduceAddform.IntroTitle.focus();
			document.introduceAddform.IntroContent.focus();
			return;
		}		
		//날짜와 시간 합치기
		datetime = $("#publeYear").val() + " " + $("#timeselect").val();
		$("input[name=rsrvDate]").attr("value", datetime); //name이 rsrvDate인 input에 datetime을 value로 지정
			
		//예약코드(6자리 난수) 생성
		charList = "012345678ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		result = "";
		num = 6;
		charListLen = charList.length;
		for(i=0; i<num; i++){ //난수 생성 for문
			result += charList.charAt(Math.floor(Math.random() * charListLen));
		}
		$("input[name=rsrvCode]").attr("value", result); //name이 rsrvCode인 input에 result을 value로 지정
			
		//사용자 이메일과 도메인 합치기
		if($("#domain option:selected").val() == "direct"){ //직접입력을 선택한 경우
			email = $("#user-email").val(); //사용자 이메일 id 가져오기
			at = $.trim($("#at").text()); // '@' 가져오기
			domain = $("#selBoxDirect").val(); //input박스의 도메인 가져오기				
	    } else { //직접입력 선택 안한 경우 
	    	email = $("#user-email").val(); //사용자 이메일 id 가져오기
		    at = $.trim($("#at").text()); // '@' 가져오기
		    domain = $("#domain").val(); //도메인 가져오기(select박스)
		} 
		total = email + at + domain; //합치기
		$("input[name=email]").attr("value", total); //name이 email인 input에 total을 value로 지정
			
		//ConeName, MenuCodeName보내기
		CodeName = $("#courseselect option:selected").text();
		MenuCodeName = $("#menuselect option:selected").text();
		$("input[name=CodeName]").attr("value", CodeName);
		$("input[name=MenuCodeName]").attr("value", MenuCodeName);
		
		alert("등록 성공");
		history.back();
		document.introduceAddform.submit();
	}
		
	function direct(e){
		$("#domain option:selected").each(function () { 
			if(e.value == "direct"){ //직접입력을 선택할 경우
				$("#selBoxDirect").attr("disabled", false); //비활성화 -> display: none인데 required로 되어 있어서 에러가 남
	        	$("#selBoxDirect").show(); //input박스 보이게 하기
	        	$("#selBoxDirect").val(""); //input박스 초기화(직접입력 후 select박스 선택 후 직접입력 하는 경우 이전에 작성한 기록이 남아있기 때문)
	        	$("#selBoxDirect").focus();//input박스에 포커스 두기
	      	} else { //직접입력 선택 안한 경우 
	          	$("#selBoxDirect").hide(); //input박스 숨기기
	          	$("#selBoxDirect").attr("disabled", true); //비활성화
	          	$("#domain").attr("disabled", false); //비활성화
	          	//emailPlusDomain();
	      	} 
		});
	}

	//달력 설정 
	const config = {
			dateFormat: 'yy-mm-dd', //형식을 yy-mm-dd로 바꿈 
			//한글 출력으로 바꾸기 
			prevText: '이전 달',
			nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    //연도와 년을 <select>태그 형식으로 선택하도록 설정 
		    changeMonth: true,
		    changeYear: true,
		    minDate: 0, //지난 날짜 비활성화
		    beforeShowDay: disableAllTheseDays,
		    showMonthAfterYear : true //달보다 월이 면저 표시
	}

	//달력 생성
	$(function(){
		$("input[name='publeYear']").datepicker(config);
		console.log($.datepicker);
	});

	//달력에서 특정 요일 비활성화
	function disableAllTheseDays(date){
		var day = date.getDay();
		return [(day != 0 && day != 1)]; //휴무일인 일, 월 비활성화
	}

	//코스선택 select박스 선택시 메뉴선택 select박스 value 변동
	function courseChange(e){
		Code = $("#courseselect").val(); //Code 값
		
		$.ajax({
			type: "POST",
			url: "/selectMenuCodeName", //보낼 서버
			data: {Code : Code}, //보낼 데이터, json형식으로 보내지기 때문에 {key:value}
			success: function(result){ //서버로부터 정상적으로 결과 받은 경우 
				var cshpr = {}; //object 저장
				cshpr += '<option value="">메뉴선택</option>';
				for(var i=0; i<result.length; i++){
					cshpr += '<option value="' + result[i].menuCode + '">' + result[i].menuCodeName + '</option>';
				}
				$("#menuselect").html(cshpr);
				//alert(cshpr); //성공 확인
			},
			error: function(result){
				alert("error"); //실패 확인
			}
		});  
	}
</script>
</body>
</html> 