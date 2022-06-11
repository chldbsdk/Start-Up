<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<style>
@font-face {
    font-family: 'Yeon Sung', cursive;
    src: url('https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap') ;
    font-weight: normal;
    font-style: normal;
}
body {font-family: 'Yeon Sung', cursive; font-color: #0D47A1;}
#popup01 {
	vertical-align:middle;
	display: none;
	width:800px;
	height:800px;
	position: absolute;
	top:30%;
	left: 43%;
	margin: -250px 0 0 -250px;
	background-color: #fff;
	z-index: 2;
	overflow:auto;/*스크롤*/
}
.backon {
    content: "";
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,.5);
    position: fixed;
    top: 0;
    left: 0;
}
.close {
  position:absolute;
  top:-25px;
  right: 0;
  cursor:pointer;
}
.openPopup { cursor:pointer; }
#addButton { align:right; }
.BigTitle { 
	font-weight: bold;
	font-size: 30px;
	margin-top: 20px;
}
#listTbl {
	margin: 0 auto;
	border-collapse: collapse;
	width: 780px;
	margin-top: 20px;
}
#listTbl th,td {
	border-top: 1px solid #444444;
	border-bottom: 1px solid #444444;
	border-left: 1px solid #444444;
	border-right: 1px solid #444444;
	padding: 10px;
}
#listTbl th:first-child,td:first-child { border-left:none; }
#listTbl th:first-child { 
	border-bottom:none; 
	border-top: none;
	width: 50px;
}
#sampleModalPopup { 
	padding: 20px; 
	position: inline-block;
}
.selectbox {
	text-align: center;
	margin-top: 50px;
}
#searchSelect { 
	width: 100px; 
	height: 30px;
}
#keyword { 
	width: 400px; 
	height: 25px;
}
.btn_search { 
	width: 35px;
	height: 30px;
	color: white;
	background-color: #002238;
	border-radius: 5px;
}
.btn_search:hover {
		color: #002238;
		background-color: white;
}
.btn_rsrvToggle {
	width: 130px;
	height: 30px;
	background-color: white;
	color: black;
	border-radius: 5px;
	border-color: #002238;
	margin-right: 20px;
	float: right;
}
.allergy { 
	color: #d22e2e; 
	}
label {
	font-weight: normal;
}
.checkboxborder {
	border-left: none;
	border-top: none;
	border-bottom: none;
}
li {
	list-style: none;
	display: inline-block;
}
li a {
	color: black;
	border-radius: 5px;
	background-color: #fafafa;
	border-color: black;
	display: block;
	width: 30px;
	height: 30px;
	line-height: 30px;
}
.paging-wrap { text-align: center; }
#deleteRsrv { position: inline-block;
float: right;}
</style>

<body>
<!-- <div class="openPopup">클릭하면 팝업이 나와요</div>    -->
<div id="popup01">
    <div class="close">close</div>
    
    <div class="reservationHold">
    
    <button type="button" class="btn_close" ><i class="fa fa-close"></i></button>
    <div class="BigTitle" align="center">예약 보류 목록</div>
    
	<div class="selectbox">
		<select id="searchSelect" name="searchSelect" onchange="" required>
						<option value="" selected>검색 기준</option>
						<option value="rsrvDate">예약 날짜</option>
						<option value="name">예약자</option>
		</select>
		
		<input type="text" id="keyword" name="keyword">
		<button type="button" class="btn_search" ><i class="fa fa-search"></i></button>
		
		<button type="button" class="btn_rsrvToggle" ><i class="fas fa-toggle-on"></i> 예약등록목록</button>
	</div>
	
	<div>
		<div id="deleteRsrv"><button type="button" class="btn_delete">삭제</button></div>
		<div align="right" style="position: inline-block;">
    		<div class="modal fade" id="sampleModalPopup" role="dialog" tabindex="0"></div>
		</div>
	</div>
    <table id="listTbl">
	<thead>
	<tr>
	<th class="checkboxborder"><input type="checkbox" name="allCheck" id="allCheck"><label for="allCheck"> All</label></th>
	<th>예약일</th>
	<th>예약자</th>
	<th>인원</th>
	<th>메뉴</th>
	</tr>
	</thead>
	<c:forEach items="${list}" var="list">
            <tr>
            	<td align="center" class="checkboxborder"><input type="checkbox" name="chBox" class="chBox" value="${list.rsrvCode }"></td>
            	<td align="center" style="width: 270px;">
            		<!-- 알러지 있으면 빨간색으로 Allergy 표시 -->
            		<c:if test="${list.message != '' }">
            			<span class="allergy"><i class="fas fa-exclamation"></i></span>
            		</c:if>
            		<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${list.rsrvDate}" />
            	</td>
                <td align="center"><c:out value="${list.name}"/></td>
                <td align="center"><c:out value="${list.pnum}"/></td>
                <td align="center"><c:out value="${list.menuCode}"/></td>
            </tr>
	</c:forEach> 
	</table>
	
	<div class="paging-wrap">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}"> <!-- 시작 페이지가 1이 아니라면 이전버튼 생성 -->
			<!-- &laquosms 특수문자 << -->
				<li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="index">
				<li
					<c:out value="${pageMaker.cri.page == index?'class =active':''}"/>>
						<a href="${index}">${index}</a>
					</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a href="${pageMaker.endPage +1}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
	
    </div>
</div>

<form id="jobForm">
  <input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
  <input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>
</form>

</body>


<script>
$(document).ready(function( $ ){     
    $(".openPopup").on("click", function(event) { 
    $("#popup01").show();  
    $("body").append('<div class="backon"></div>');
    });
    
    $("#popup01").show(); 
    $("body").append('<div class="backon"></div>');
    
    $("body").on("click", function(event) { 
        if(event.target.className == 'close' || event.target.className == 'backon'){
            $("#popup01").hide();
      	    $(".backon").hide();
        }
      });
     var url = "http://localhost:8031/project/manager/menu/menuAdd";
	    
	    // 팝업 호출
	    $("#sampleModalPopup").load(url, function() { 
	   });
	    
	var target=document.querySelectorAll('.reservationHold');
	var targetID;
	var btnPopClose = document.querySelectorAll('.btn_close');
	// 팝업 닫기
	for(var j = 0; j < target.length; j++){
		btnPopClose[j].addEventListener('click', function(){
		this.parentNode.parentNode.style.display = 'none';
		$(".backon").hide();
		});
	}    
});

//All 눌렀을 경우
$("#allCheck").click(function(){
	var chk = $("#allCheck").prop("checked"); //prop("property name"): 속성 값을 가져옴
	if(chk) { //All이 checked인 경우 
		$(".chBox").prop("checked", true); //checked 속성을 true로 변경 -> 체크박스 체크
	} else{
		$(".chBox").prop("checked", false); //체크박스 체크 x
	}
});

//paging 처리
/* var result = '${msg}';

if (result == 'SUCCESS') {
	alert("처리가 완료되었습니다.");
} */

$(".pagination li a").on("click", function(event){
	
	event.preventDefault(); 
	
	var targetPage = $(this).attr("href");
	
	var jobForm = $("#jobForm");
	jobForm.find("[name='page']").val(targetPage);
	jobForm.attr("action","/project/manager/reservation/reservationList").attr("method", "get");
	jobForm.submit();
});
</script>
</html>