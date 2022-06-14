<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>낙원: 소개</title>

<style>
	/*폰트*/
	@font-face {
    font-family: 'HSGyoulnoonkot';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/HSGyoulnoonkot.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	body {font-family: 'HSGyoulnoonkot'; background-image : url("resources/img/배경.jpg");}
	.introtext{text-align:center; font-size: 50px;}
	.introimg{marign: 100px 300px; margin-left: 575px;}
	#introducdiv {margin:0 auto; width:1700px; height:400px; padding:110px;}	
	#introducetbl {margin-left: 500px;; width:1000px; text-align:center}
	.BigTitle { font-weight: bold;font-size: 35px; margin-top: 20px;}			
</style>
</head>

<body>
<header><%@ include file="../main/top.jsp" %></header>
<section>
<p class="introtext"> 낙원 소개</p>
<div class="introimg"><img src="resources/img/기와.jpg" width="800px" height="500px"></div>
<div>			
	<div>
	<script>
		let introduceListAll = JSON.parse('${introduceListAll}');			
	
		for(let i = 0; i < introduceListAll.length; i++){
			document.write("<div id='introducediv'>");
			document.write("<table id='introducetbl' >");
			document.write("<tr>");
			document.write("<h3 class='BigTitle' align='center'>"+introduceListAll[i].introTitle+"</h3></tr>");
			document.write("<tr>");
			document.write("<td><h2>"+introduceListAll[i].introContent+"</td></tr>");
			document.write("</table>");
			document.write("</div>");
		}	
	</script>
</div><br><br><br><br><br>
</section>
<footer><%@ include file="../main/footer.jsp" %></footer>
</body>
</html>