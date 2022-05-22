<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>배경이 가려진 레이어 팝업 뛰우기</title>
<style> 
/* 마스크 뛰우기 */
#mask {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
} 
/* 팝업으로 뜨는 윈도우 css  */ 
.window{
    display: none;
    position:absolute;  
    left:50%;
    top:50px;
    margin-left: -500px;
    width:1000px;
    height:500px;
    background-color:#FFF;
    z-index:10000;   
 }
 
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"> 
//<![CDATA[
    function wrapWindowByMask(){
 
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();  
        var maskWidth = $(window).width();  
 
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $("#mask").css({"width":maskWidth,"height":maskHeight});  
 
        //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
 
        $("#mask").fadeIn(0);      
        $("#mask").fadeTo("slow",0.6);    
 
        //윈도우 같은 거 띄운다.
        $(".window").show();
 
    }
 
    $(document).ready(function(){
        //검은 막 띄우기
        $(".openMask").click(function(e){
            e.preventDefault();
            wrapWindowByMask();
        });
 
        //닫기 버튼을 눌렀을 때
        $(".window .close").click(function (e) {  
            //링크 기본동작은 작동하지 않도록 한다.
            e.preventDefault();  
            $("#mask, .window").hide();  
        });       
 
        //검은 막을 눌렀을 때
        $("#mask").click(function () {  
            $(this).hide();  
            $(".window").hide();  
 
        });      
 
    });
 
//]]>
function load() {
	/* var popupWidth = 200;
	var popupHeight = 300;
	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height / 2) - (popupHeight / 2);
	// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
	window.open("http://localhost:8031/project/manager/menu/menuAdd","",
	"height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY,resizable=no, scrollbars=no"); */
	
	var popupX = (document.body.offsetWidth / 2) - (500 / 2);
	//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height / 2) - (500 / 2);
	//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	window.open('http://localhost:8031/project/manager/menu/menuList', '', 
			'status=no, height=500, width=500, left='+ popupX + ', top='+ popupY);
	/* 
	$(".cc").css({
		"background":"rgba(0,0,0,.5)",
	});
 */
	
}
</script>
</head>
<body class="cc">

    <div id ="wrap"> 
        <div id = "container">  
            <div id="mask"></div>
            <div class="window">
                <div style="width:1000px;height:500px;text-align:center;vertical-align:middle;">팝업 내용 입력
                <table>
	<thead>
	<tr>
	<th>메뉴명</th>
	<th>가격</th>
	<th>내용</th>
	</tr>
	</thead>
	 <c:forEach items="${list}" var="list">
            <tr>
            	<td><c:out value="${list.menuDetailCodeName}"/></td>
                <td><c:out value="${list.menuPrice}"/></td>
                <td><c:out value="${list.menuContent}"/></td>
            </tr>
</c:forEach> 
</table></div>
                <p style="text-align:center; background:#ffffff; padding:20px;"><a href="#" class="close">닫기X</a></p>
            </div>
            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="ccs">       
                <tr>
                    <td align="center">
                    <a href="#" class="openMask">레이어 팝업 발생</a>
                    </td>
                    <td>
                    <a href="javascript:load()">목록</a>
                    </td>
                </tr>       
            </table>
        </div>
    </div>
</body>
</html>

