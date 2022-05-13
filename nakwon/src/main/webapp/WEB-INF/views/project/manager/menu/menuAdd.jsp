<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>
<style>

.menubody{
	margin:0;
	padding:0;
}

a{text-decoration:none;}
/* .wrap{
 width:100%;
	height:100%;
    background-color: yellow;
 padding: 50px 60px;
   
}
 */
.btn_add{
position: fixed;
font-weight:bold; 
margin:50px;
padding:4px 6px; 
background:#000; 
color:#fff;
right: 20px;
}
.menu{
position:fixed; 
top:0; 
left:0; 
 right:0; 
bottom:0;  
background:rgba(0,0,0,.5);
/*  transform: scale(1.1);  */
/* transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; */
font-size:0; 
text-align:center;
overflow:auto;/*스크롷ㄹ*/

}
.menu:after{
display:inline-block; 
height:100%; 
vertical-align:middle;
content:'';
}
.menu .inner{
display:inline-block; 
padding:20px 30px;
background:#fff; 
width:50%; 
vertical-align:middle;
font-size:15px;
}
.btn_close {
display: block;
   width: 20px;
    height: 20px;
    margin: 5px auto;
    color: black;
font-size: 1rem;
border: none;
    border-radius: 30px;
    cursor: pointer;
    transition: .3s linear;
float:right;
background-color:lightgray;
} 

.btn_next {
display: block;
   width: 40px;
    height: 40px;
    margin: 5px auto;
    color: black;
font-size: 1rem;
border: none;
border-radius:10px;
    cursor: pointer;
    transition: .3s linear;
float:right;
background-color:lightgray;
} 

.radio {
float:left;
text-align:center;
padding:0 20px;
font-weight:bold;
}

.input {
    width: 70%;
    height: 30px;
    border: none;
    background-color: #ededed;
    border-radius: 4px;
    color: #333;
/*     font-size: 1.0rem; */
/*     font-weight: 700; */
 /*    padding: 17px 80px 0 60px; */
 padding:10px;
 margin-top:10px;
}
textarea {
    width: 70%;
    height: 20px;
    border: none;
    background-color: #ededed;
    border-radius: 4px;
    color: #333;
/*     font-size: 1.0rem; */
/*     font-weight: 700; */
 /*    padding: 17px 80px 0 60px; */
 padding:100px;
 margin-top:10px;
 vertical-align:top;
}

#label { 
  text-align:center;
  width:100px;
  height:20px;
         /* display: block; */
         margin-top: 20px;  
/* letter-spacing: 1px;  */
  float:left;
} 
#MenuImg {
display:none;

}

#labelImg{
font-size: 2rem;
text-align:center;
width:100px;
height:20px;
margin-top: 20px;  
float:left;
cursor: pointer;
}
</style>

<body class="menubody">
<% request.setCharacterEncoding("UTF-8"); %>
<header><%@ include file="../top.jsp" %></header>
<form class="menuAdd" name="menuAddform" method="post" accept-charset="utf-8">
	<div class="wrap">
		<a href="#add_menu" class="btn_add">메뉴 등록</a>
		<div id="add_menu" class="menu" style="display:none;">
	
		<div class="inner">
		
		<button type="button" class="btn_close"><i class="fa fa-close"></i></button>
		<h2 style="float:center;">메뉴 등록</h2>
		
		<div class="radio">
		<label>
		<input type="radio" name="Code" value="course">코스</label>
		<label>
		<input type="radio" name="Code" value="set">세트<br></label>
		</div>

		<br>
		<label for="CodeName" id="label"><b>코스/세트</b></label>
		<input type="text" name="CodeName" id="CodeName"  class="input" required>
		<br>
		
		<label for="MenuCode" id="label"><b>메뉴코드</b></label>
		<input type="text" name="MenuCode" id="MenuCode" class="input" required>
		<br>
		
		<label for="MenuCodeName" id="label"><b>메뉴코드명</b></label>
		<input type="text" name="MenuCodeName" id="MenuCodeName"  class="input" required>
		<br>
		
		<label for="MenuDetailCode" id="label"><b>메뉴명코드</b></label>
		<input type="text" name="MenuDetailCode" id="MenuDetailCode" class="input" required>
		<br>
		
		<label for="MenuDetailCodeName" id="label"><b>메뉴명</b></label>
		<input type="text" name="MenuDetailCodeName" id="MenuDetailCodeName" class="input" required>
		<br>
		
		<label for="MenuPrice" id="label"><b>가격</b></label>
		<input type="text" name="MenuPrice" id="MenuPrice" class="input" required>
		<br>
		
		<label for="MenuIngredients" id="label"><b>재료</b></label>
		<input type="text" name="MenuIngredients" id="MenuIngredients" class="input" required>
		<br>
		<label for="MenuContent" id="label"><b>상세 내용</b></label>
		<textarea id="MenuContent" name="MenuContent" cols="20" rows="20"></textarea>
		<br>
	
		<label for="MenuAllergy" id="label"><b>알러지 정보</b></label>
		<textarea id="MenuAllergy" name="MenuAllergy" cols="15" rows="20"></textarea>
		<br>
	
		<label for="MenuImg" id="labelImg"><i class='fas fa-plus'></i></label>
		<input type="file" id="MenuImg" name="MenuImg"/>
		<!-- <button type="button" class="btn_img" onclick="imgupload()"><i class="fas fa-plus"></i></button> -->
		<br>
		
		<button type="button" class="btn_next" onclick="nextBtn()">등록</button>
		
		</div>
		</div>
	</div>
</form>

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
</table>


<%-- <div class="box-body">
	<div class="form-group">
		<label for="exampleInputEmail1">Title</label>
		<input type="text"
			name='title' class="form-control" value="${list.MenuDetailCodeName}"
			readonly="readonly">
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1">Content</label>
		<textarea class="form-control" name="content" rows="3"
			readonly="readonly">${list.MenuPrice}</textarea>
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1">Writer</label> <input type="text"
			name="writer" class="form-control" value="${list.MenuContent}"
			readonly="readonly">
	</div>
</div> --%>
<%-- ${list.MenuPrice } --%>

<script type="text/javascript">	
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
	
	function nextBtn() {
		if(document.menuAddform.MenuDetailCodeName.value=="") {
			alert("메뉴명을 입력해주세요.");
			document.menuAddform.MenuDetailCodeName.focus();
			return;
		}
			
		if(document.menuAddform.MenuPrice.value=="") {
			alert("가격을 입력해주세요.");
			document.menuAddform.MenuPrice.focus();
			return;
		}

		if(document.menuAddform.MenuIngredients.value=="") {
			alert("재료를 입력해주세요.");
			document.menuAddform.MenuIngredients.focus();
			return;
		}

		if(document.menuAddform.MenuContent.value=="") {
			alert("내용을 입력해주세요.");
			document.menuAddform.MenuContent.focus();
			return;
		}

		if(document.menuAddform.MenuAllergy.value=="") {
			alert("알러지 정보를 입력해주세요.");
			document.menuAddform.MenuAllergy.focus();
			return;
		}

		document.menuAddform.submit();
	}
	
	$("input[type=radio]").change(function() {
		
	})
</script>
</body>
</html> 