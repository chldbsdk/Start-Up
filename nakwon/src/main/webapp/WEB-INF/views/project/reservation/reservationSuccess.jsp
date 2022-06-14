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
#rsrvInsertCheck-allwrap{
	max-width: 1000px;
	margin: 0 auto;
	padding: 60px 0 60px 0;
}
#rsrvInsertCheck-wrap{
	background-image : url("resources/img/rsrvCheck2.png");
	background-size: 1000px 900px;
	width: 1000px;
	height: 900px;
	box-shadow: 3px 3px 3px 3px #a0a0a0;
}
#rsrcInsertCheck-content{
	width: 1000px;
	height: 900px;
}
.rsrvInsertCheck-Table{
	width: 900px;
	height: 900px;
	font-size: 20px;
	border-collapse: collapse;
	margin: 0 50px 0 50px;
}
.trBorder{
	border-bottom: 2px solid #f0f0f0;
}
.BicCenter{
	text-align: center;
	font-size: 30px;
}
.BicCenterEnd{
	text-align: center;
	font-size: 30px;
}
.MiddleCenter{
	text-align: center;
	font-size: 28px;
	padding-bottom: 20px;
}
.spanname{
	font-size: 40px;
	color: #e9967a;
	font-weight: bold;
}
.spancount{color: #91833c;}
.spanrsrvCode{
	font-size: 25px;
	font-weight: bold;
	color: #e9967a;
}
.leftText, .leftTextTitle, .rightText, .spanrsrvCode {
	font-family: 'JSArirangHON-Regular';
	font-size: 25px;
}
.leftText { padding: 0 50px 0 50px;}
.leftTextTitle{
	padding: 0 0 0 50px;
	width: 160px;
}
.rightText{padding: 0;
}
</style>
</head>
<body>
<!-- 예약 성공 페이지 - 예약 확인 창 -->
<%@ include file="../main/top.jsp" %>

<div id="rsrvInsertCheck-allwrap">
<div id="rsrvInsertCheck-wrap">
	<div id="rsrcInsertCheck-content">
		<table class="rsrvInsertCheck-Table">
			<tr><td class="BicCenter" colspan="2" style="padding-top: 10px;"><span class="spanname">${Name}</span> 님&nbsp; 예약해주셔서&nbsp; 감사합니다.</td></tr>
			<tr class="trBorder"><td class="MiddleCenter" colspan="2">고객님의 예약번호는&nbsp; <span class="spanrsrvCode">${RsrvCode}</span>&nbsp; 입니다.</td></tr>
			
			<tr><td class="leftText" colspan="2">※ 예약일로부터&nbsp; 1일전까지&nbsp; NoShow&nbsp; 방지&nbsp; 예약금을&nbsp;
			</td></tr>
			<tr><td class="leftText" colspan="2"><span class="spancount">&emsp; KB국민&nbsp; 2020-12-34-567-890 </span> 로&nbsp; 입금해주셔야&nbsp; 예약이&nbsp; 확정됩니다.</td></tr>
			<tr><td class="leftText" colspan="2">&emsp; (그렇지 않을 경우 예약이 취소됩니다.)</td></tr>
			<tr><td class="leftText" colspan="2">※ 1인당&nbsp; 예약금은 <span class="spancount"> 50,000원 </span> 입니다.</td></tr>
			<tr><td class="leftText" colspan="2">※ 예약 확정 후 패널티 안내</td></tr>
			<tr><td class="leftText" colspan="2">&emsp;- 3일 전 취소: 패널티 없음</td></tr>
			<tr><td class="leftText" colspan="2">&emsp;- 2일 전 취소: 예약금 50% 패널티 적용</td></tr>
			<tr class="trBorder"><td class="leftText" colspan="2">&emsp;- 1일 전 및 당일 취소: 예약금 100% 패널티 적용</td></tr>
			
			<tr><td class="leftTextTitle">예약자&nbsp; :</td><td class="rightText"> ${Name}</td></tr>
			<tr><td class="leftTextTitle">예약일&nbsp; :</td><td class="rightText"> <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${RsrvDate}"/></td></tr>
			<tr><td class="leftTextTitle">예약 인원&nbsp; :</td><td class="rightText"> ${Pnum}명</td></tr>
			<tr><td class="leftTextTitle">예약 메뉴&nbsp; :</td><td class="rightText"> ${CodeName} 의 ${MenuCodeName}</td></tr>
			<tr class="trBorder"><td class="leftTextTitle">예약 메시지&nbsp; :</td><td class="rightText"> ${Message}</td></tr>
			
			<tr><td class="BicCenterEnd" colspan="2" style="padding: 20px 0 10px 0;">한결같은&nbsp; 정성을&nbsp; 담아&nbsp; 준비하겠습니다.</td></tr>
		</table>
	</div>
</div>
</div>

<%@ include file="../main/footer.jsp" %>
</body>
</html>