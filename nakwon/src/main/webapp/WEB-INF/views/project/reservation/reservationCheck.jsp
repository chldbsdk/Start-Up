<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>낙원</title>
<style>
@font-face {
    font-family: 'JSArirangHON-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/JSArirangHON-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
#reservationCheck-allwrap{
	max-width: 1000px;
	margin: 0 auto;
	padding-top: 60px;
	padding-bottom: 60px;
}
.reservationCheckBicText{
	font-size: 30px;
	font-weight: bold;
	text-align: center;
	padding-bottom: 40px;
	border-bottom: 2px solid;
}
.reservationCheckMiddleText{
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	border-bottom: 1px solid #dddddd;
	padding: 40px 0 40px 0;
}
.reservationCheckTable{
	width: 1000px;
	margin: 80px 0 80px 0;
	border-collapse: collapse;
}
#Table-wrap{
	border-bottom: 2px solid;
}
.reservationTableTextBig{
	font-size: 20px;
	font-weight: bold;
	padding-bottom: 20px; 
	width: 400px;
	text-align: right;
	padding-right: 40px;
}
.CheckInputTd{
	width: 500px;
	padding-bottom: 20px; 
}
.CheckInput{ 
	width: 230px;
	height: 20px;
}
#btn-wrap {text-align: center;}
.reservationCheckBtn{
	font-size: 17px;
	font-weight: bold;
	font-family: 'HSGyoulnoonkot';
	background-color: #ae9c69;
	border: 2px solid #ae9c69;
	color: white;
	width: 160px;
	height: 60px;
	margin: 30px 30px 30px 0;
}
.cancleBtn{
	font-size: 17px;
	font-weight: bold;
	font-family: 'HSGyoulnoonkot';
	background-color: white;
	border: 2px solid #ae9c69;
	color: #ae9c69;
	width: 160px;
	height: 60px;
	margin: 30px 0 30px 0;
}
.swal-title, .swal-text {font-family: 'JSArirangHON-Regular';}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<!-- 예약 조회 페이지 -->
<%@ include file="../main/top.jsp" %>

<div id="reservationCheck-allwrap">
	<div class="reservationCheckBicText">예약&nbsp; 조회/변경/취소</div>
	<div class="reservationCheckMiddleText">예약정보를&nbsp; 조회하기&nbsp; 위하여&nbsp; 아래&nbsp; 항목을&nbsp; 입력해주세요.</div>
	<div id="reservationCheckTable-wrap">
	<form class="reservationCheck-form" id="reservationCheckform" name="reservationCheckform" method="post" accept-charset="utf-8">
	<div id="Table-wrap">
	<table class="reservationCheckTable">
		<tr>
			<td class="reservationTableTextBig">예약코드</td>
			<td class="CheckInputTd"><input type="text" class="CheckInput" id="rsrvCodeInput" name="rsrvCode" required></td>
		</tr>
		<tr>
			<td class="reservationTableTextBig">예약자</td>
			<td class="CheckInputTd"><input type="text" class="CheckInput" id="nameInput" name="Name" required></td>
		</tr>
		<tr>
			<td class="reservationTableTextBig">연락처</td>
			<td class="CheckInputTd"><input type="text" class="CheckInput" id="Phone" name="Phone" placeholder="'-'를 제외하고 입력해주세요" required></td>
		</tr>
	</table>
	</div>
	<div id="btn-wrap">
		<input type="submit" value="조회하기" class="reservationCheckBtn">
		<input type="button" value="취소" class="cancleBtn" onClick="history.back(-1)">
	</div>
	</form>
	</div>
</div>

<c:if test = "${result == 0}">
	<script type="text/javascript">
		swal({
			title: "예약 조회에 실패하였습니다.",
			text: "목록에 없는 예약입니다. 다시 시도해주세요.",
			icon: "error",
			closeOnClickOutside: false
		});
	</script>
</c:if>

<%@ include file="../main/footer.jsp" %>
</body>
</html>