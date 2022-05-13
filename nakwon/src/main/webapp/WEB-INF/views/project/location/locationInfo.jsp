<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" %>
<html>
<head>
<style>
#locInfo-allwrap{
	margin-top: 40px;
	margin-bottom: 40px;
}
#locInfo-wrap{
	width: 1000px;
	height: 250px;
	margin: 0 auto;
	border: 3px solid #c8c8c8;
}
#locInfo-table {border-spacing: 15px;}
.locImg{
	text-align: center;
	width: 140px;
	paddin-left: 40px;
	vertical-align: top;
}
.locTitle{
	width: 200px;
	font-size: 35px;
	font-weight: bold;
	padding-left: 25px;
	padding-top: 30px;
	vertical-align: top;
}
.locWay{
	width: 130px;
	font-size: 15px;
}
.locWaySpan{
	color: #0067a3;
	border-radius: 20px;
	border: 1px solid;
	width: 100px;
	display: inline-block;
	text-align: center;
}
.locDetail{
	width: 530px;
	font-size: 15px;
}
</style>
</head>
<body>
<div id="locInfo-allwrap">
	<div id="locInfo-wrap">
	<table id="locInfo-table">
	<tr><td class="locImg" rowspan="6"><img src="resources/img/bus.png" width="100" height="100"></td><td class="locTitle" rowspan="6">대중교통</td><td class="locWay"><span class="locWaySpan">광역버스</span></td><td class="locDetail">1601(서울역), 9200(강남역), 3001(광명역)</td></tr>
	<tr><td class="locWay"><span class="locWaySpan">시내버스</span></td><td class="locDetail">5, 5-1, 8, 9, 13, 27, 46, 111-2</td></tr>
	<tr><td class="locWay"><span class="locWaySpan">마을버스</span></td><td class="locDetail">511 / 515 / 516 / 518(주안역), 512(제물포역), 517 / 519(동인천역)</td></tr>
	<tr><td class="locWay"><span class="locWaySpan">급행간선</span></td><td class="locDetail">908(송도신도시공영차고지)</td></tr>
	<tr><td class="locWay" rowspan="2" style="vertical-align: top;"><span class="locWaySpan">지하철</span></td><td class="locDetail">(1호선) 주안역 1번,2번 출구</tr>
	<tr><td class="locDetail">(수인선) 인하대역 4번,5번 출구</td></tr>
	</table>
	</div>
</div>
</body>
</html>