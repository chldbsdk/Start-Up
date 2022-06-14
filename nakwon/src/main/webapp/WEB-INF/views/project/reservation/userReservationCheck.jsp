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
	height: 1000px;
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
.Middle{
	text-align: center;
	font-size: 28px;
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
#btn-wrap { text-align: center;}
.reservationModifyBtn{
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
.reservationCancleBtn{
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
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<!-- 예약 조회 성공 페이지 - 사용자 예약 조회 페이지 -->
<%@ include file="../main/top.jsp" %>

<div id="rsrvInsertCheck-allwrap">
<div id="rsrvInsertCheck-wrap">
	<div id="rsrcInsertCheck-content">
		<form role="form" method="post">
			<input type='hidden' name="RsrvCode" value="${RsrvCode}">
			<input type='hidden' name="Phone" value="${Phone}">
			<input type='hidden' name="Name" value="${Name}">
			<input type='hidden' name="result" value="${result}">
		</form>
	
		<table class="rsrvInsertCheck-Table">
			<tr><td class="BicCenter" colspan="2" style="padding-top: 10px;"><span class="spanname">${Name}</span> 님&nbsp; 예약해주셔서&nbsp; 감사합니다.</td></tr>
			<c:if test = "${result == 2}">
				<tr><td class="Middle" colspan="2"><span class="spanrsrvCode"> * </span> 고객님의 예약이&nbsp; 확정되었습니다. <span class="spanrsrvCode"> * </span></td></tr>
			</c:if>
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
			<tr><td class="leftTextTitle">예약일&nbsp; :</td><td class="rightText"> <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${RsrvDate}" /></td></tr>
			<tr><td class="leftTextTitle">예약 인원&nbsp; :</td><td class="rightText"> ${Pnum}명</td></tr>
			<tr><td class="leftTextTitle">예약 메뉴&nbsp; :</td><td class="rightText"> ${CodeName} 의 ${MenuCodeName}</td></tr>
			<tr class="trBorder"><td class="leftTextTitle">예약 메시지&nbsp; :</td><td class="rightText"> ${Message}</td></tr>
			
			<tr><td class="BicCenterEnd" colspan="2" style="padding: 20px 0 10px 0;">한결같은&nbsp; 정성을&nbsp; 담아&nbsp; 준비하겠습니다.</td></tr>
		</table>
	</div>
	<div id="btn-wrap">
		<input type="submit" value="예약변경" class="reservationModifyBtn">
		<input type="button" value="예약취소" class="reservationCancleBtn">
	</div>
</div>
</div>

<script>
$(document).ready(function(){
   
	var formObj = $("form[role='form']");
   
   	console.log(formObj);
   
   	//예약 변경 버튼을 누른 경우
   	$(".reservationModifyBtn").on("click", function(){
      	formObj.attr("action", "/modifyReservation"); //예약 변경 화면으로 이동
      	formObj.attr("method", "get");  
      	formObj.submit();
   	});
   
 	//예약 취소 버튼을 누른 경우
   	$(".reservationCancleBtn").on("click", function(){
   		//alert창 띄우기
   		swal({
   			title: "정말 예약을 취소하시겠습니까?",
   			text: "",
   			icon: "info",
   			closeOnClickOutside: false, //alert창을 제외하고 클릭시 창 닫히지 않게 함.
   			buttons: {
   				confirm: {
   					text: "예",
   					value: true,
   					className: "Cancle-YesBtn"
   				},
   				cancle: {
   					text:"아니오",
   					value: false,
   					className: "Cancle-NoBtn"
   				}
   			}
   		}).then((resultBtn) => { //button의 value를 resultBtn로 받아 사용.
   			if(resultBtn){ //'예'를 클릭한 경우, 예약 삭제 실행
   				formObj.attr("action", "/removeReservation");
   		      	formObj.submit();
   			}
   		});
   	});
});
</script>

<%@ include file="../main/footer.jsp" %>
</body>
</html>