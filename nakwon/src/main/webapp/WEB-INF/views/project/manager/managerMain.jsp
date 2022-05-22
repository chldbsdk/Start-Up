<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>낙원 관리자 페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
	/*폰트*/
	@font-face {
    font-family: 'Yeon Sung', cursive;
    src: url('https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap') ;
    font-weight: normal;
    font-style: normal;
	}
	
	body {font-family: 'Yeon Sung', cursive; font-color: #0D47A1;}
	
	.wrap #button{
		font-family: 'Yeon Sung', cursive;
		border: 10px solid #0D47A1;
		background-color: white;
		color:#0D47A1;
		padding 5px;
	}
	
	.wrap #button:hover{
		color: white;
		background-color: #0D47A1;
	}
	
	.btn01{ border-radius:25px; width: 600px; height: 300px; text-align: center; font-size: 100px; 
	  margin-top: 75px; margin-left: 325px; position: absolute;}			
	.btn02{	border-radius:25px; width: 600px; height: 300px; 
	 text-align: center; font-size: 100px; margin-top: 75px; margin-left: 975px; }			
	.btn03{ border-radius:25px;	width: 600px; height: 300px; 
	 text-align: center; font-size: 100px; margin-top: 50px; margin-left: 325px; }			
	.btn04{	border-radius:25px; width: 600px; height: 300px; text-align: center; font-size: 100px; 
	   margin-top: 50px; margin-left: 50px; position: absolute;}
	
</style>
</head>
<body  topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
<header><%@ include file="top.jsp" %></header>

<section>
<div class="wrap">
   <button type="button" id="button" class="btn01">소개</button>
   <button type="button" id="button"  class="btn02" onclick="menubtn()">메뉴</button>
   <div class="modal fade" id="Popup" role="dialog" tabindex="-1">
   
    </div>
   <button type="button"  id="button" class="btn03">예약</button>
   <button type="button"  id="button" class="btn04">게시판</button>
</div>
<br><br>
</section>
<footer><%@ include file="footer.jsp" %></footer>
</body>
<script>
function menubtn() {
	  var url = "http://localhost:8031/project/manager/menu/menuList";
	    
	    // 팝업 호출
	    $("#Popup").load(url, function() { 
	   });
}
</script>
</html>