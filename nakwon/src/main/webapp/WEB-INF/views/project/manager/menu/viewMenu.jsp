<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<style>
@font-face {
    font-family: 'Yeon Sung', cursive;
    src: url('https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap') ;
    font-weight: normal;
    font-style: normal;
}
	
.modifybody{margin:0; padding:0; font-family: 'Yeon Sung', cursive; font-color: #0D47A1;}

a{text-decoration:none;}
/* .wrap{width:100%;height:100%;background-color: yellow;padding: 50px 60px;}*/
/* .btn_add{position: fixed;font-weight:bold; margin:50px;padding:4px 6px; background:#000; color:#fff;right: 20px;} */
.menu{position:fixed; top:0; left:0; right:0; bottom:0;background:rgba(0,0,0,.5);font-size:0; text-align:center;
overflow:auto;/*스크롷ㄹ*/}
.menu:after{display:inline-block; height:100%; vertical-align:middle;content:'';}
.menu .inner{display:inline-block; padding:20px 30px;background:#fff; width:50%; vertical-align:middle;font-size:15px;}
.btn_close {display: block;width: 20px;height: 20px; margin: 5px auto;color: black;font-size: 1rem;
border: none;border-radius: 30px;cursor: pointer;transition: .3s linear;float:right;background-color:lightgray;} 

.btn_next {display: block;width: 45px;height: 40px;margin: 5px auto;color: black;font-size: 1rem;border: none;
border-radius:10px;cursor: pointer;transition: .3s linear;float:right;background-color:lightgray;
font-family: 'Yeon Sung', cursive; font-color: #0D47A1;} 

.radio {float:left;text-align:center;padding:0 20px;font-weight:bold;}

.input {width: 70%;height: 30px; border: none;background-color: #ededed;border-radius: 4px;color: #333;padding:10px;margin-top:10px;}
textarea { width: 70%;height: 20px;border: none;background-color: #ededed;border-radius: 4px;color: #333;padding:100px 10px;
margin-top:10px;vertical-align:top;}

#label { text-align:center; width:100px; height:20px;margin-top: 20px;  float:left;} 
#label1 { text-align:center;width:100px;height:20px; margin-top: 20px;  float:left;} 
#MenuImg {margin-top:10px;}

#labelImg{font-size: 2rem;text-align:center;width:100px;height:20px;margin-top: 20px;  float:left;cursor: pointer;}

.BigTitle { 
	font-weight: bold;
	font-size: 30px;
	margin-top: 20px;
}
.btn_delete {display: block;width: 45px;height: 40px;margin: 5px 30px;color: black;font-size: 1rem;border: none;
border-radius:10px;cursor: pointer;transition: .3s linear;float:right;background-color:lightgray;
font-family: 'Yeon Sung', cursive; font-color: #0D47A1;} 
</style>

<body class="modifybody">
<form class="menumodify" id="menumodifyform" name="menumodifyform" role="form" method="post" accept-charset="utf-8">
	<div class="wrap">
		<!-- <a href="#add_menu" class="btn_add">메뉴 등록</a> 얘 없앨거임 -->
		<!-- <button type="button" id="open" class="btn_add">메뉴 등록</button> -->
		<div id="add_menu" class="menu" style="display:none;">
	
		<div class="inner">
		
		<button type="button" class="btn_close" ><i class="fa fa-close"></i></button>
		<div class="BigTitle" style="float:center;">메뉴 등록</div>
		
		<div class="radio">
			<label><input type="radio" id="course" name="Code" value="course" onchange="radiochk()"
			<c:if test="${menu.code eq 'course' }">checked</c:if> />만찬</label>
			<label><input type="radio" id="set" name="Code" value="set" onchange="radiochk()" 
			<c:if test="${menu.code eq 'set' }">checked</c:if> />정찬<br></label>
		</div>

		<br><br><br>
		<input type="hidden" name="CodeName" id="CodeName"  class="input" value="" required>
		<br>
		
		<select id="MenuCodeSelect" name="MenuCodeSelect" onchange="selectfunction()" required>
						<option value="">코스선택</option>
						
						<c:forEach items="${list}" var="list">
						<option value="${list.menuCodeName}">${list.menuCode}</option>
						</c:forEach>
						<option value="" selected><c:out value="${menu.menuCode}"/></option>
						<option value="newCode">자동 생성</option>
		</select>
		<input type="hidden" id="MenuCode" name="MenuCode" value="" readonly="readonly">
		<input type="text" name="MenuCodeName" id="MenuCodeName" 
		value='<c:out value="${menu.menuCodeName}"/>' readonly="readonly">
		<br>
		
		<input type="hidden" name="MenuDetailCode" id="MenuDetailCode" class="input" 
		value='<c:out value="${menu.menuDetailCode}"/>' required>

		
		<label for="MenuDetailCodeName" id="label"><b>메뉴명</b></label>
		<input type="text" name="MenuDetailCodeName" id="MenuDetailCodeName" class="input"
		value='<c:out value="${menu.menuDetailCodeName}"/>' required>
		<br>
		
		<label for="MenuPrice" id="label"><b>가격</b></label>
		<input type="text" name="MenuPrice" id="MenuPrice" class="input" 
		value='<c:out value="${menu.menuPrice}"/>' required>
		<br>
		
		<label for="MenuIngredients" id="label"><b>재료</b></label>
		<input type="text" name="MenuIngredients" id="MenuIngredients" class="input" 
		value='<c:out value="${menu.menuIngredients}"/>' required>
		<br>
		
		<label for="MenuContent" id="label"><b>상세 내용</b></label>
		<textarea id="MenuContent" name="MenuContent" cols="20" rows="20">
		<c:out value="${menu.menuContent}"/></textarea>
		<br>
	
		<label for="MenuAllergy" id="label"><b>알러지 정보</b></label>
		<textarea id="MenuAllergy" name="MenuAllergy" cols="15" rows="20">
		<c:out value="${menu.menuAllergy}"/></textarea>
		<br>
	
		<!-- <label for="MenuImg" id="labelImg"><i class='fas fa-plus'></i></label> -->
		<input type="file" id="MenuImg" name="MenuImg"/>
		<!-- <button type="button" class="btn_img" onclick="imgupload()"><i class="fas fa-plus"></i></button> -->
		<br>
		
		<button type="button" class="btn_next" onclick="modifyBtn()">수정</button>
		<button type="button" class="btn_delete" onclick="remove()">삭제</button>
		
		</div>
		</div>
	</div>
</form>

<script>	
$(document).ready(function() {
	/* $("#open").click(function() {
		$("#add_menu").show();
	}); */
	$("#add_menu").show();
});
	var target=document.querySelectorAll('.btn_add');
	var targetID;
	var btnPopClose = document.querySelectorAll('.menu .btn_close');
	for(var i=0;i<target.length;i++) {
		target[i].addEventListener('click',function() {
			targetID=this.getAttribute('href');
			document.querySelector(targetID).style.display='block';
		});
	}
	
	// 팝업 닫기
	for(var j = 0; j < target.length; j++){
	  btnPopClose[j].addEventListener('click', function(){
	    this.parentNode.parentNode.style.display = 'none';
	  });
	}
	
	//삭제 버튼 클릭
	function remove() {
		var form=$("form[role='form']");
		form.attr("action","menuremove");
		form.submit();
	}
	
	//수정 버튼 클릭
	function modifyBtn() {
		if(document.menumodifyform.MenuDetailCodeName.value=="") {
			alert("메뉴명을 입력해주세요.");
			document.menumodifyform.MenuDetailCodeName.focus();
			return;
		}
			
		if(document.menumodifyform.MenuPrice.value=="") {
			alert("가격을 입력해주세요.");
			document.menumodifyform.MenuPrice.focus();
			return;
		}

		if(document.menumodifyform.MenuIngredients.value=="") {
			alert("재료를 입력해주세요.");
			document.menumodifyform.MenuIngredients.focus();
			return;
		}

		if(document.menumodifyform.MenuContent.value=="") {
			alert("내용을 입력해주세요.");
			document.menumodifyform.MenuContent.focus();
			return;
		}

		if(document.menumodifyform.MenuAllergy.value=="") {
			alert("알러지 정보를 입력해주세요.");
			document.menumodifyform.MenuAllergy.focus();
			return;
		}
		
		charList = "012345678ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		result = "";
		num = 6;
		charListLen = charList.length;
		for(i=0; i<num; i++){
			result += charList.charAt(Math.floor(Math.random() * charListLen));
		}
		document.getElementById("MenuDetailCode").value=result;
		
		alert("수정 성공"); //이거 바꾸기 if 문으로
		history.back();
		document.menumodifyform.submit();
	}
	 
	//라디오 버튼 만찬인지 정찬인지 체크
	function radiochk(){	
		var radioVal=$("#course").prop("checked");
		var codename=document.getElementById("CodeName");
		if(radioVal) {
			codename.value="만찬(풀코스)";
			console.log(codename.value);
		}
		else codename.value="정찬(세트메뉴)";
	}
		
	//자동생성 클릭 시 메뉴코드 난수로 생성
	function selectfunction() {
		var sel = document.getElementById("MenuCodeSelect");
		var img = document.getElementById("MenuCodeName");
		img.value=sel.options[sel.selectedIndex].value;
		var menucode = document.getElementById("MenuCode");
		menucode.value=$("select[name=MenuCodeSelect] option:selected").text();
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
			menucode.value=result;
		}
	}
	
	
</script>
</body>
</html> 