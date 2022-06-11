<%@page import="com.nakwon.domain.ReservationHoldVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page session="false" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>낙원</title>
<style></style>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

</head>
<body>
<h1>예약 실패겸 난수 테스트 창~~</h1>
<input type="button" value="난수생성" onClick="createRsrvCode();">

<script>
function createRsrvCode(){
	//예약코드(6자리 난수) 생성
	charList = "012345678ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	result = "ZIpCBj";
	num = 6;
	charListLen = charList.length;
	//document.write('${rsrvList.get(0).rsrvCode}');
	//document.write('${rsrvList.get(1).rsrvCode}');
	//사이즈만큼 돌기
	for(var k=0; k<${rsrvList.size()}; k++){
		
		//rsrvCode = "${rsrvList.get(i).rsrvCode}"; //데베에 있는 코드
		//document.writeln(rsrvCode); 
		rsrvCode = "${rsrvList.get(k).rsrvCode}";
		if(rsrvCode == result){ //코드랑 난수가 다른 경우
			result = ""; //난수 초기화
			
			for(j=0; j<num; j++){ //난수 생성 for문
				result += charList.charAt(Math.floor(Math.random() * charListLen));
			}
		
		}
		else{ //코드가 같은 경우
			continue;
			
		}  
	}
	
	document.write(result);  
}
</script>
</body>
</html>