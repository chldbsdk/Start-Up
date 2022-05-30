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


<table>
            <tr>
            	<td>
            	<b>메뉴명</b>
            	<input type="text" name="MenuDetailCode" value='<c:out value="${menu.menuDetailCodeName}"/>'>
            	</td>
                <td>
                <b>가격</b>
                <input type="text" name="MenuPrice" value='<c:out value="${menu.menuPrice}"/>'>
                </td>
                <td>
                <b>재료</b>
                <input type="text" name="MenuIngredients" value='<c:out value="${menu.menuIngredients}"/>'>
                </td>
                <td>
                <b>내용</b>
                <input type="text" name="MenuContent" value='<c:out value="${menu.menuContent}"/>'>
                </td>
                <td>
                <b>알러지정보</b>
                <input type="text" name="MenuAllergy" value='<c:out value="${menu.menuAllergy}"/>'>
                </td>
                
            </tr>

</table>
</body>
</html>