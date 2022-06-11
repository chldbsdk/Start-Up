<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>낙원 관리자</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
<style>
@font-face {
    font-family: 'Yeon Sung', cursive;
    src: url('https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap') ;
    font-weight: normal;
    font-style: normal;
}	
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Yeon Sung', cursive;
}
 body {
    min-height: 100vh;
    display: flex; /*가운데*/
   	align-items: center;
    justify-content: center;
} 
.login-form {
    width: calc(100% - 20px);
    max-width: 500px;
    background-color: #fff;
    padding: 50px 40px;
}
.login-form h1 {
    text-align: center;
    margin: 48px 0;
    font-size: 2.3rem;
    color: #111;
}
.textb {
    margin-bottom: 12px;
    position: relative;
}
.textb input {
    width: 100%;
    height: 70px;
    border: none;
    background-color: #ededed;
    border-radius: 4px;
    color: #333;
    font-size: 1.0rem;
    font-weight: 700;
    padding: 17px 80px 0 60px;
}
.placeholder {
    font-size: 1.0rem;
    font-weight: 700;
    position: absolute;
    line-height: 70px;
    top: 0;
    left: 60px;
    color: #9d9d9d;
    user-select: none;
    pointer-events: none;
}
.id {
    position: absolute;
    
    left: 20px;
    line-height: 70px;
    color: #9d9d9d;
    font-size: 1.3rem;
    cursor: pointer;
}
.show-password {
    position: absolute;
    left: 20px;
    line-height: 70px;
    color: #9d9d9d;
    font-size: 1.3rem;
    cursor: pointer;
    z-index: 1;
    opacity: 1;
    overflow: auto;
}
.textb input:focus ~ .placeholder,
.textb input:valid ~ .placeholder { /* input 클릭했을 때 placeholder의 스타일. valid때문에 입력 후에도 고정되어있음.*/
    left: 60px;
    top: -10px;
}  
.btn {
    display: block;
    width: 80px;
    height: 80px;
    margin: 40px auto;
    background-color: grey;
    color: blue;
    font-size: 2.5rem;
    border: none;
    border-radius: 30px;
    cursor: pointer;
    transition: .3s linear;
}
.btn:hover {
    opacity: .85;
}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<script type="text/javascript">	
	function loginCheck2() {
		if(document.loginform.userid.value=="")
			return;
		if(document.loginform.userpw.value=="")
			return;
		}
		document.loginform.submit();
	}
</script>
<body>
<form class="login-form" name="loginform" action="logincheck.do" method="post">
	<div>
	<h1>LOGIN</h1>
	<div class="textb">
		<input type="text" name="userid" required> <!-- required가 입력하라고 말해주는애임 -->
		<div class="id fas fa-user-alt"></div>
		<div class="placeholder">ID</div>
	</div>

	<div class="textb">
		<input type="password" name="userpw" required>
		<div class="show-password fas fa-lock"></div>
		<div class="placeholder">PASSWORD</div>
		
		</div>

	<button class="btn fas fa-arrow-right" onclick="loginCheck2()"></button>

	<c:if test = "${result==0 }">
		<script type="text/javascript">
		swal({
			title: "로그인에 실패하였습니다.",
			text: "아이디 또는 비밀번호를 잘못 입력하셨습니다.",
			icon: "error",
			closeOnClickOutside: false
		});
		</script>
		</c:if>
	</div>
</form>
</body>
</html>