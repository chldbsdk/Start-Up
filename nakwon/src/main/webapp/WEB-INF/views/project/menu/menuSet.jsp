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
	#nav {background-color:#fce8c5; border-top:2px solid #f4ae34;}
	#nav ul {margin:0 auto;overflow:hidden;}
	#nav ul li {width:50%;height:80px;list-style:none;float:left;line-height:50px;text-align:center;background-color:#fce8c5;}
	
	#nav #ahrefcourse {text-decoration:none;color:black;display:block;font-size:40px;font-weight:bold;padding :20px;}
	#nav #ahref {text-decoration:none;color:#f4ae34;display:block;font-size:40px;font-weight:bold;padding :20px;}
	
	#nav #ahrefcourse:hover {color:#f4ae34;}
	
	#setdiv {margin:0 auto; width:1700px; height:500px; padding:50px 80px;}
	
	#settbl {padding:0 30px;width:800px;}
	#settbl td {border-bottom:1px solid;}
					
</style>
</head>

<body>
<header><%@ include file="../main/top.jsp" %></header>

<nav id="nav" >
	<ul>
		<li><a href="#" onclick="location.href='http://localhost:8031/menuCourse'" id="ahrefcourse">만찬(풀코스)</a></li>
		<li><a href="#" onclick="location.href='http://localhost:8031/menuSet'" id="ahref">정찬(세트)</a></li>
	</ul>
</nav>

<div>
	<div id="setdiv">
	<img style="float:left;"src="resources/Main2img/화랑부대찌개.png" width="800px" height="500px">
	<table id="settbl">
		<tr><td align="center"><h1>세트 A</h1><br></td></tr>
		<tr>
			<td><b>구성 : </b>
				<c:forEach items="${uzhV27}" var="uzhV27">
				<c:out value="${uzhV27.menuImg }"/>
				</c:forEach>
				<br>
			</td>
		</tr>
		<tr>
			<td>
				<c:set var="total" value="0"/>
				<c:forEach items="${jXe0p }" var="jXe0p">
				<c:set var="total" value="${total+(jXe0p.menuPrice) }"/>
				</c:forEach>
				<b>가격 : </b>${total}원
				<br>
			</td>
		</tr>
		<tr>
			<td>
			<p><b>소개 : </b>푸짐한 코스 A</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><b>알러지 : </b>밀, 달걀, 땅콩, 생선, 콩</p>
			</td>
		</tr>
	</table>
	</div>
	
	<div id="setdiv">
	<img style="float:left;"src="resources/Main2img/화랑부대찌개.png" width="800px" height="500px">
	<table id="settbl">
		<tr><td align="center"><h1>세트 B</h1><br></td></tr>
		<tr>
			<td><b>구성 : </b>
				<c:forEach items="${Wssiv1}" var="Wssiv1">
				<c:out value="${Wssiv1.menuDetailCodeName }"/>
				</c:forEach>
				<br>
			</td>
		</tr>
		<tr>
			<td>
				<c:set var="total" value="0"/>
				<c:forEach items="${Wssiv1 }" var="Wssiv1">
				<c:set var="total" value="${total+(Wssiv1.menuPrice) }"/>
				</c:forEach>
				<b>가격 : </b>${total}원
				<br>
			</td>
		</tr>
		<tr>
			<td>
			<p><b>소개 : </b>다양한 상차림 코스 B</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><b>알러지 : </b>밀, 달걀, 땅콩, 생선, 콩</p>
			</td>
		</tr>
	</table>
	</div>
</div>
</body>
</html>

