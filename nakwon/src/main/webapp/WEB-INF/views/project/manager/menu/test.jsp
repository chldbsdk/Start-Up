<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<style>
.popup {border:1px solid #ccc;background:#fff;padding:50px;width:50%;position:fixed;top:20px;display:none}

.popup .close {float:right} 
</style>
<body >
<!-- Modal HTML embedded directly into document -->
<div id="ex1" class="modal">
  <p>Thanks for clicking. That felt good.</p>
  <a href="#" rel="modal:close">Close</a>
</div>

<!-- Link to open the modal -->
<p><a href="#ex1" rel="modal:open">Open Modal</a></p>

<a href="javascript:openModal('modal1');">레이어팝업1 열기</a>
<a href="javascript:openModal('modal2');">레이어팝업2 열기</a>
<a href="javascript:openModal('modal3');">레이어팝업3 열기</a>

<div class="popup modal1">
   <a href="#none" class="close">X</a>
레이어팝업 1
</div>
<div class="popup modal2">
  <a href="#none" class="close">X</a>
레이어팝업 2
</div>
<div class="popup modal3">
  <a href="#none" class="close">X</a>
레이어팝업 3
</div>


<div class="modal fade" id="sampleModalPopup" role="dialog" tabindex="-1">
    <div class="modal-dialog modal-dialog-width1000 modal-dialog-height800">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">anjdi</span></button>
        </div>
        <div class="modal-body">
        </div>
        <div class="modal-footer">
            <button type="button" name="button" class="btn btn-color2" data-dismiss="modal" >닫기</button>
        </div>
    </div>
</div>

   <div class="modal fade" id="sampleModalPopup" role="dialog" tabindex="-1"></div>

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
            	<!-- <td onclick="view()"> -->
  				<td>
  				
            	<c:out value="${list.menuDetailCodeName}"/></td>
                <td><c:out value="${list.menuPrice}"/></td>
                <td><c:out value="${list.menuContent}"/></td>
            </tr>
</c:forEach> 
</table>
<select id="MenuCodetest" name="MenuCodetest" onchange="fun()">
						<option value="" selected>코스선택</option>
						<c:forEach items="${list}" var="menu">
						<option value="${menu.menuCodeName}" id="${menu.menuCode }">${menu.menuCode}</option>
						</c:forEach>
						<option value="newCode">자동 생성</option>
</select>

		menucodename<input type="text" id="MenuCodeName" name="MenuCodeName" value="" readonly="readonly">
		menucode<input type="text" id="MenuCode" name="MenuCode" value="" readonly="readonly">
		
		
		<br>
		<label>
		<input type="radio" id="course" name="Code" value="course" onchange="btn()">코스</label>
		<label>
		<input type="radio" id="set" name="Code" value="set" onchange="btn()">세트<br></label>
		<input type="text" name="CodeName" id="CodeName"  value="" readonly="readonly">
</body>
<script>	

//팝업 열기
function openModal(modalname) {
            document.get
            $("." + modalname).fadeIn(300);
        }

// 팝업 닫기
$('.popup .close').click(function() {
            $(this).parent().fadeOut(300);
        });


function sampleModalPopup(){
    // 팝업 호출 url
    var url = "http://localhost:8031/project/manager/menu/menuAdd";
    
    // 팝업 호출
    $("#sampleModalPopup > .modal-dialog").load(url, function() { 
        $("#sampleModalPopup").modal("show"); 
    });
}



function fun() {
	var sel = document.getElementById("MenuCodetest");
	var img = document.getElementById("MenuCodeName");
	img.value=sel.options[sel.selectedIndex].value;
	var test=document.getElementById("MenuCode");
	test.value=$("select[name=MenuCodetest] option:selected").text();
	if(img.value=="newCode") {
		img.value="";
		img.focus();
		img.readOnly=false;
		charList = "012345678ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		result = "";
		num = 6;
		charListLen = charList.length;
		for(i=0; i<num; i++){
			result += charList.charAt(Math.floor(Math.random() * charListLen));
		}
		/* $("input[name=MenuCodeName]").attr("value", result); */
		test.value=result;
	}
}
function btn() {
/* var code = document.getElementByName("Code");
var codename = document.getElementById("CodeName");
var found=null;
var code = document.querySelector('input[name="Code"]:checked').val(); 
if(code.value=="course") {
	codename.value="만찬";
}
else codename.value="세트";

for(var i=0;i<code.length;i++) {
	if(code[i].checked==true)
		found=code[i];
} */
/* if(found.value=="course") {
	codename.value="코스";
	codename.focuse();
	}
else codename.value="세트";

if(document.getElementById("Code1").checked) codename.value="코스"
else codename.value="세트" */
/* 
var radioVal = $("input[type=radio][name=Code]:checked").val();
if(radioVal == course) {
	alert("dd");
	$("input[name=CodeName]").attr("value", "만찬(풀코스)");
}
else
	$("input[name=CodeName]").attr("value", "정찬(세트메뉴)"); */
}

function btn(){
	/* var tq = $("input[name='CodeName']");
	var tmpType = $("input[name='Code']:checked").val(); */
	/* console.log(tmpType); */// A Type 클릭 시 A 출력, B Type 클릭 시 B 출력
	/* var tq=document.getElementById("CodeName");
	var tmpType=document.querySelector('input[name="radio"]:checked').value; */
	var tq=document.getElementById("CodeName");
	var tmpType = $("#course").prop("checked");
	console.log(tmpType);
	if(tmpType) {
		tq.value="만찬";
		console.log("dd");
	}
	else tq.value="세트";	/* tq.value=tmpType;
	if(tmpType=="course") {
		tq.value="만찬";
		console.log(tq.value);
		tq.focus();
		tq.readOnly=false;
	} */
}

/* <c:forEach items="${list}" var="list">
//var url="http://localhost:8031/project/manager/menu/viewMenu?MenuDetailCode=<c:out value="${list.menuDetailCode}"/>";
	function view() {
		var ss= '<c:out value="${list.menuDetailCode}"/>'
		var url="http://localhost:8031/project/manager/menu/viewMenu?MenuDetailCode="+ss;
			
			// 팝업 호출
		    $("#sampleModalPopup").load(url, function() { 
		   });
	}
</c:forEach> */
</script>
</html>