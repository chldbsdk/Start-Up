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
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<style>@font-face {
    font-family: 'Yeon Sung', cursive;
    src: url('https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap') ;
    font-weight: normal;
    font-style: normal;
	}
	
.introducebody{margin:0; padding:0;}
a{text-decoration:none;}
.introduce{position:fixed; top:0; left:0; right:0; bottom:0;background:rgba(0,0,0,.5);font-size:0; text-align:center;overflow:auto;}
.introduce:after{display:inline-block; height:100%; vertical-align:middle;content:'';}
.introduce .inner{display:inline-block; padding:20px 30px;background:#fff; width:50%; vertical-align:middle;font-size:15px;}
.btn_close {display: block;width: 20px;height: 20px; margin: 5px auto;color: black;font-size: 1rem;
border: none;border-radius: 30px;cursor: pointer;transition: .3s linear;float:right;background-color:lightgray;} 
.btn_next {display: block;width: 45px;height: 40px;margin: 5px auto;color: black;font-size: 1rem;border: none;
border-radius:10px;cursor: pointer;transition: .3s linear;float:right;background-color:lightgray;
font-family: 'Yeon Sung', cursive; font-color: #0D47A1;} 
.radio {float:left;text-align:center;padding:0 20px;font-weight:bold;}
.form-control {width: 70%;height: 30px; border: none;background-color: #ededed;border-radius: 4px;color: #333;padding:10px;margin-top:10px;}
textarea { width: 70%;height: 20px;border: none;background-color: #ededed;border-radius: 4px;color: #333;padding:100px;
margin-top:10px;vertical-align:top;}
#label { text-align:center; width:100px; height:20px;margin-top: 20px;  float:left;} 
/* #IntroImg {display:none;} */
#labelImg{font-size: 2rem;text-align:center;width:100px;height:20px;margin-top: 20px;  float:left;cursor: pointer;}
</style>

<body class="introducebody">
<% request.setCharacterEncoding("UTF-8"); %>
<form class="introduceAdd" name="introduceAddform" method="post" accept-charset="utf-8" action="introducecheck.do">
	<div class="wrap">
		<button type="button" id="open" class="btn btn-warning">소개 수정</button>
		<button type="button" id="open" class="btn btn-danger">소개 삭제</button>
		<button type="button" id="open" class="btn btn-primary">돌아가기</button>
		<div id="add_introduce" class="introduce" style="display:none;">
	
		<div class="inner">
		
		<button type="button" class="btn_close"><i class="fa fa-close"></i></button>
		<h2 style="float:center;">소개</h2>

		<br>			
		<label for="IntroTitle" id="label"><b>제목</b></label>
		<input type="text" name="IntroTitle" id="IntroTitle" 
		 class="form-control" value="${IntroduceVO.IntroTitle}" readonly="readonly">
		<br>
		
		<label for="IntroContent" id="label"><b>상세 내용</b></label>
		<textarea id="IntroContent" name="IntroContent" form-control
		cols="20" rows="20" readonly="readonly" value="${IntroduceVO.IntroContent}" ></textarea>
		<br><br><br>		
	
		<input type="file" id="IntroImg" name="IntroImg" multiple/>
		<!-- <button type="button" class="btn_img" onclick="imgupload()"><i class="fas fa-plus"></i></button> -->
		<br>
		
		</div>
		</div>
	</div>
</form>

<script type="text/javascript">	
$(document).ready(function() {
	$("#open").click(function() {
		$("#add_introduce").show();
	});
});

	var target=document.querySelectorAll('.btn_add');
	var targetID;
	var btnPopClose = document.querySelectorAll('.introduce .btn_close');
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
	
	$(document).ready(function(){		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$(".btn-warning").on("click", function(){
			formObj.attr("action", "/project/manager/Introduce/IntroduceModify");
			formObj.attr("method", "get");		
			formObj.submit();
		});
		
		$(".btn-danger").on("click", function(){
			formObj.attr("action", "/project/manager/Introduce/IntroduceRemove");
			formObj.submit();
		});
		
		$(".btn-primary").on("click", function(){
			self.location = "/project/manager/Introduce/IntroduceList";
		});		
	});	
</script>
</body>
</html> 
