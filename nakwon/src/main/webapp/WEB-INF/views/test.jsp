<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!--  <script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" 
    crossorigin="anonymous"></script> -->
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <title>Document</title>
</head>
<style>
#popup01{
vertical-align:middle;
display: none;
width:500px;
height:500px;
position: absolute;
top: 50%;
left: 50%;
margin: -250px 0 0 -250px;
background-color: #fff;
z-index: 2;
overflow:auto;/*스크롷ㄹ*/
    }
.backon{
    content: "";
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,.5);
    position: fixed;
    top: 0;
    left: 0;
    /* z-index: 1; */
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
}
</style>
<body>
<div class="openPopup">클릭하면 팝업이 나와요</div>   
<div id="popup01">



    <div class="close">close</div>
    <div>
    
    <h2 align="center">메뉴 목록</h2>
    <div align="right">
    <div class="modal fade" id="sampleModalPopup" role="dialog" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-header">
            <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button> -->
        </div>
        <div class="modal-body">
        </div>
        <!-- <div class="modal-footer">
            <button type="button" name="button" class="btn btn-color2" data-dismiss="modal" >닫기</button>
        </div> -->
    </div>
</div>
    <table id="listTbl">
	<thead>
	<tr>
	<th>만찬/정판</th>
	<th>메뉴명</th>
	<th>내용</th>
	</tr>
	</thead>
	 <c:forEach items="${list}" var="list">
            <tr>
            	<td align="center"><c:out value="${list.codeName}"/></td>
                <td align="center"><c:out value="${list.menuDetailCodeName}"/></td>
                <td align="center"><c:out value="${list.menuContent}"/></td>
            </tr>
</c:forEach> 
</table>
    </div>
</div>


</body>


<script>
  $(document).ready(function( $ ){     
    $(".openPopup").on("click", function(event) { 
    $("#popup01").show();  
    $("body").append('<div class="backon"></div>');
    });
    
    $("body").on("click", function(event) { 
        if(event.target.className == 'close' || event.target.className == 'backon'){
            $("#popup01").hide();
      	    $(".backon").hide();
        }
      });
     var url = "http://localhost:8031/project/manager/menu/test2";
	    
	    // 팝업 호출
	    $("#sampleModalPopup > .modal-dialog").load(url, function() { 
	         
	    
	   });
    

  });

  function btn() {
	 
  }
</script>
</html>
