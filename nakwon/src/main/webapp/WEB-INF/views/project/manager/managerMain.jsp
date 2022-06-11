<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>낙원 관리자</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
	/*폰트*/
	@font-face {
    font-family: 'Yeon Sung', cursive;
    src: url('https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap') ;
    font-weight: normal;
    font-style: normal;
	}
	
	body {font-family: 'Yeon Sung', cursive; font-color: #0D47A1; background-color: #e9e9e9;}
	
	.wrap #button{
		font-family: 'Yeon Sung', cursive;
		border: 5px solid #002238;
		background-color: white;
		color:#002238;
		padding: 5px;
	}
	
	.wrap #button:hover{
		color: white;
		background-color: #002238;
	}
	
	.btn01{ border-radius:20px; width: 600px; height: 300px; text-align: center; font-size: 100px; 
	  margin-top: 75px; margin-left: 325px; position: absolute;}			
	.btn02{	border-radius:20px; width: 600px; height: 300px; 
	 text-align: center; font-size: 100px; margin-top: 75px; margin-left: 975px; }			
	.btn03{ border-radius:20px;	width: 600px; height: 300px; 
	 text-align: center; font-size: 100px; margin-top: 50px; margin-left: 325px; }			
	.btn04{	border-radius:20px; width: 600px; height: 300px; text-align: center; font-size: 100px; 
	   margin-top: 50px; margin-left: 50px; }
	
</style>
</head>
<body  topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
<header><%@ include file="top.jsp" %></header>

<section>
<div class="wrap">
   <button type="button" id="button" class="btn01" onClick="introducebtn()">소개</button>
   <div class="modal fade" id="PopupRsrv" role="dialog" tabindex="-1">
   </div>
   
   <button type="button" id="button"  class="btn02" onclick="menubtn()">메뉴</button>
   <div class="modal fade" id="Popup" role="dialog" tabindex="-1">
   </div>
    
   <button type="button"  id="button" class="btn03" onclick="rsrvbtn()">예약</button>
   
   <button type="button"  id="button" class="btn04">게시판</button>
   <div class="modal fade" id="PopupRsrv" role="dialog" tabindex="">
   </div>
</div>
<br><br>
</section>
<footer><%@ include file="footer.jsp" %></footer>
</body>
<script>
//소개 팝업 호출
function introducebtn() {
	  var url = "http://localhost:8031/project/manager/Introduce/IntroduceList";
	    // 팝업 호출
	    $("#Popup").load(url, function() { 
	   });
}

//메뉴 팝업 호출
function menubtn() {
	  var url = "http://localhost:8031/project/manager/menu/menuList";
	    // 팝업 호출
	    $("#Popup").load(url, function() { 
	   });
}
//예약 팝업 호출
function rsrvbtn() {
	  var url = "http://localhost:8031/project/manager/reservation/reservationList";	    
	    // 팝업 호출
	    $("#Popup").load(url, function() { 
	   });
} 
</script>
</html>