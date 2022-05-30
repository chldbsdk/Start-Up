<%@ page session="false" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>낙원</title>
<style>
#rsrvCheck-allwrap{
	max-width: 800px;
	margin: 0 auto;
	padding: 60px 0 60px 0;
}
#rsrvCheck-wrap{
	background-image : url("resources/img/rsrvCheck.png");
	background-size: 800px 800px;
	width: 800px;
	height: 800px;
}
#rsrcCheck-content{
	padding: 150px;
	width: 500px;
	height: 500px;
	margin: 0 auto;
}
.rsrvCheck-Table{
	width: 500px;
	height: 500px;
	border-collapse: separate;
	border-spacing: 0;
	font-size: 20px;
}
.spanname{
	font-size: 30px;
	color: #e6c619;
	font-weight: bold;
}
.spancount{color: #91833c;}
#smalltext{font-size: 18px;}
.center{ text-align: center;}
.left{padding-left: 100px;}
</style>
</head>
<body>
<%@ include file="../main/top.jsp" %>

<div id="rsrvCheck-allwrap">
<div id="rsrvCheck-wrap">
	<div id="rsrcCheck-content">
		<table class="rsrvCheck-Table">
			<tr><td class="center"><span class="spanname">${Name}</span> 님&nbsp; 예약해주셔서&nbsp; 감사합니다.</td></tr>
			<tr><td class="center">예약일로부터&nbsp; 1일전까지&nbsp; NoShow&nbsp; 방지&nbsp; 예약금을</td></tr>
			<tr><td class="center"><span class="spancount">KB국민&nbsp; 2020-12-34-567-890</span></td></tr>
			<tr><td class="center">로&nbsp; 입금해주셔야&nbsp; 예약이&nbsp; 확정됩니다.</td></tr>
			<tr><td class="center" id="smalltext"><span class="spancount">( * 1인당&nbsp; 예약금은&nbsp; 50,000원&nbsp; 입니다. )</span></td></tr>
			<tr><td class="left">예약자&nbsp; :&nbsp; ${Name}</td></tr>
			<tr><td class="left">예약일&nbsp; :&nbsp; ${RsrvDate}</td></tr>
			<tr><td class="left">예약 인원&nbsp; :&nbsp; ${Pnum}</td></tr>
			<tr><td class="left">예약 메뉴&nbsp; :&nbsp; ${CodeName} 의 ${MenuCodeName}</td></tr>
			<tr><td class="left">예약 메시지&nbsp; :&nbsp; ${Message}</td></tr>
		</table>
	</div>
</div>
</div>

<%@ include file="../main/footer.jsp" %>
</body>
</html>