<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
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
	#nav {background-color:#c9ac83;}
	#nav ul {margin:0 auto;overflow:hidden;}
	#nav ul li {width:50%;height:80px;list-style:none;float:left;line-height:50px;text-align:center;}
	
	#nav #ahrefcourse {text-decoration:none;color:black;display:block;font-size:40px;font-weight:bold;padding :20px;}
	#nav #ahref {text-decoration:none;color:#fce8c5;display:block;font-size:40px;font-weight:bold;padding :20px;}
	
	#nav #ahrefcourse:hover {color:#fce8c5;}
	
	#setdiv {margin:0 auto; width:1700px; height:800px; padding:140px;}
	
	#settbl {padding:0 30px;width:800px;}
	/* #settbl td {border:1px solid;} */
	.BigTitle { font-weight: bold;font-size: 40px;margin-top: 20px;}
	.pclass{font-weight: bold; font-size:20px;}				
</style>
</head>

<body>
<header><%@ include file="../main/top.jsp" %></header>

<nav id="nav" >
	<ul>
		<li><a href="#" onclick="location.href='http://localhost:8031/courseMenu'" id="ahrefcourse">만찬(풀코스)</a></li>
		<li><a href="#" onclick="location.href='http://localhost:8031/setMenu'" id="ahref">정찬(세트)</a></li>
	</ul>
</nav>



<div>
<script>
		
		let codeList = JSON.parse('${codeList}');

		
		for(let i = 0; i < codeList.length; i++){
			document.write("<div id='setdiv'>");
			document.write("<img style='float:left;' src='resources/Main2img/화랑부대찌개.png' width='900px' height='800px'>");
			document.write("<table id='settbl'>");
			document.write("<tr>");
			document.write("<td class='BigTitle' align='center'>"+codeList[i].menuCodeName+"</td></tr>");
			document.write("<td><h2>◈ 구성</h2><p class='pclass'>: "+codeList[i].menuDetailCodeName+"</p></td></tr>");
			document.write("<tr>");
			document.write("<td><h2>◈ 가격</h2><p class='pclass'>: "+codeList[i].menuPrice+"</p></td></tr>");
			document.write("<tr>");
			document.write("<td><h2>◈ 소개</h2><p class='pclass'>: "+codeList[i].menuContent+"</p></td></tr>");
			document.write("<tr>");
			document.write("<td><h2>◈ 알러지</h2><p class='pclass'>: "+codeList[i].menuAllergy+"</p></td></tr>");
			document.write("</table>");
			document.write("</div>");		
			
		}	

</script>
</div>
<footer><%@ include file="../main/footer.jsp" %></footer>
</body>
</html>

