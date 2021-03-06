<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <title>Document</title>
</head>
<style>
@font-face {
    font-family: 'Yeon Sung', cursive;
    src: url('https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap') ;
    font-weight: normal;
    font-style: normal;
}
body {font-family: 'Yeon Sung', cursive; font-color: #0D47A1;}
.BigTitle { 
	font-weight: bold;
	font-size: 30px;
	margin-top: 20px;
}
#popup01{
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
overflow:auto;
    }
.backon{
    content: "";
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,.5);
    position: fixed;
    top: 0;
    left: 0;
}
.close{
  position:absolute;
  top:-25px;
  right: 0;
  cursor:pointer;
}
.openPopup{
  cursor:pointer;
}
#addButton {
align:right;
}
#listTbl {
margin: 0 auto;
border-top: 1px solid #444444;
border-collapse: collapse;
width:800px;
}
#listTbl th,td {
border-bottom: 1px solid #444444;
border-left: 1px solid #444444;
padding: 10px;
}
#listTbl th:first-child,td:first-child {
border-left:none;
}
#sampleModalPopup {
padding:20px;
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
</style>
<body>
<!-- <div class="openPopup">클릭하면 팝업이 나와요</div>    -->
<div id="popup01">

    <div class="close">close</div>
    <div>

    <div class="BigTitle" align="center">소개 목록</div>

    <div align="right">
    <div class="modal fade" id="sampleModalPopup" role="dialog" tabindex="-1"></div>
	</div>

    <table id="listTbl">
	<thead>
	<tr>
	<th>코드</th>
	<th>제목</th>
	<th>세부 내용</th>
	</tr>
	</thead>
	 <c:forEach items="${list}" var="introcudeVO">
            <tr>
            	<td align="center">${introcudeVO.introCode}</td>
                <td align="center">${introcudeVO.introTitle}</td>
                <td align="center">${introcudeVO.introContent}</td>
            </tr>
	</c:forEach> 
	</table>
    </div>
    
    <div class="paging-wrap">
		<ul class="pagination">
			<c:if test="${pageMakerIntro.prev}"> <!-- 시작 페이지가 1이 아니라면 이전버튼 생성 -->
			<!-- &laquosms 특수문자 << -->
				<li><a href="${pageMakerIntro.startPage - 1}">&laquo;</a></li>
			</c:if>
			<c:forEach begin="${pageMakerIntro.startPage }" end="${pageMakerIntro.endPage }" var="index">
				<li
					<c:out value="${pageMakerIntro.criIntro.page == index?'class =active':''}"/>>
						<a href="${index}">${index}</a>
					</li>
			</c:forEach>
			<c:if test="${pageMakerIntro.next && pageMakerIntro.endPage > 0}">
				<li><a href="${pageMakerIntro.endPage +1}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
		
	<form id="jobForm">
  		<input type='hidden' name="page" value="${pageMakerIntro.criIntro.perPageNum}">
  		<input type='hidden' name="perPageNum" value="${pageMakerIntro.criIntro.perPageNum}">
	</form>
</div>
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
     var url = "http://localhost:8031/project/manager/Introduce/IntroduceAdd";
	    
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
  
  //페이징 처리
  $(".pagination li a").on("click", function(event){
		
		event.preventDefault(); 
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action","/project/manager/Introduce/IntroduceList").attr("method", "get");
		jobForm.submit();
	});
</script>
</html>