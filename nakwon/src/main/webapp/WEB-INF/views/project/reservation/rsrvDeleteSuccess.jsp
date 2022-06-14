<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>낙원</title>
<head>
<style>
@font-face {
    font-family: 'JSArirangHON-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/JSArirangHON-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.swal-title, .swal-text {font-family: 'JSArirangHON-Regular';}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<!-- 예약 삭제 완료시 alert 페이지 -->
<c:if test = "${deleteResult==1 }">
	<script type="text/javascript">
		swal({
			title: "예약이 취소되었습니다.",
			text: "홈 화면으로 이동합니다.",
			icon: "success",
			closeOnClickOutside: false
		}).then((resultBtn2) => {
			if(resultBtn2){
				location.href="http://localhost:8031/main";
			}
		});
	</script>
</c:if>

<c:if test = "${deleteResult==0 }">
	<script type="text/javascript">
		swal({
			title: "예약이 취소에 실패하였습니다.",
			text: "홈 화면으로 이동합니다.",
			icon: "error",
			closeOnClickOutside: false
		}).then((resultBtn2) => {
			if(resultBtn2){
				location.href="http://localhost:8031/main";
			}
		});
	</script>
</c:if>


</body>
</html>

