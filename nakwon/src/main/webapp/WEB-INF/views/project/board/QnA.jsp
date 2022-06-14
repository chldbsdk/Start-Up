<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
</head>
<style>
/*폰트*/
	@font-face {
    font-family: 'JSArirangHON-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/JSArirangHON-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	#boardbody {font-family: 'JSArirangHON-Regular';background-image : url("resources/img/board.png");background-repeat: no-repeat;}
	
	#nav {background-color:#c9ac83;}
	#nav ul {margin:0 auto;overflow:hidden;}
	#nav ul li {width:50%;height:80px;list-style:none;float:left;line-height:50px;text-align:center;}
	#nav #ahrefcourse {text-decoration:none;color:#fce8c5;display:block;font-size:40px;font-weight:bold;padding :20px;}
	#nav #ahref {text-decoration:none;color:black;display:block;font-size:40px;font-weight:bold;padding :20px;}
	
	
	#nav #ahref:hover {color:#fce8c5;}
	
.board {
/* border:1px solid; */
margin:0 auto; width:1000px; height:800px; padding:100px;
background-image : url("resources/Main2img/한지.jpg");}

.boardtitle {
font-weight: bold;font-size: 40px;margin-top: 20px;}

#noticetbl {
margin: 0 auto;
	border-collapse: collapse;
	width: 1000px;
	margin-top: 20px;
	text-align:center;
}
#noticetbl th{
background-color:#fce8c5;
	padding: 10px;
}
#noticetbl tr:hover{
cursor:pointer;
background-color:#fce8c5;

}
#noticetbl td {
	/* border-top: 1px solid #444444; */
	border-bottom: 1px solid #444444;
	/* border-left: 1px solid #444444;
	border-right: 1px solid #444444; */
	padding: 10px;
}
#noticetbl th:first-child,td:first-child { border-left:none; }
#noticetbl th:first-child { 
	border-bottom:none; 
	border-top: none;
	width: 50px;
}
#noticetbl a {text-decoration:none;color:black;}
.pagination li {
	list-style: none;
	display: inline-block;
}
.pagination li a {
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
.boardtitle{float:center;}
.board{margin:0 auto;}
</style>
<body id="boardbody">
<header><%@ include file="../main/top.jsp" %></header>
<nav id="nav" >
	<ul>
		<li><a href="#" onclick="location.href='http://localhost:8031/QnA'" id="ahrefcourse">문의</a></li>
		<li><a href="#" onclick="location.href='http://localhost:8031/review'" id="ahref">리뷰</a></li>
	</ul>
</nav>
<div class="board">
<div class="boardtitle">문의게시판</div>
<table id="noticetbl">
	<thead>
	<tr>
	<th><h2>NO</h2></th>
	<th><h2>TITLE</h2></th>
	<th><h2>DATE</h2></th>
	</tr>
	</thead>
	 <c:forEach items="${list}" var="list">
            <tr onclick="location.href='http://localhost:8031/QnARead?QnACode=<c:out value="${list.qnACode }"/>'">
            
            	<td align="center"><c:out value="${list.qnACode}"/></td>
            	<%-- <a href="${list.menuDetailCode }" class="aaaa"> --%>
                <td align="center"><c:out value="${list.qnATitle}"/></td>
                <td align="center"><c:out value="${list.qnADate}"/></td>
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
<form id="jobForm">
  <input type='hidden' name="page" value="${pageMaker.cri.perPageNum}">
  <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}">
</form>
<footer><%@ include file="../main/footer.jsp" %></footer>
</body>
<script>
$(".pagination li a").on("click", function(event){
	
	event.preventDefault(); 
	
	var targetPage = $(this).attr("href");
	
	var jobForm = $("#jobForm");
	jobForm.find("[name='page']").val(targetPage);
	jobForm.attr("action","/project/board/QnA").attr("method", "get");
	jobForm.submit();
});
</script>
</html>
