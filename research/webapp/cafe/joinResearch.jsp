<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cafe.CoffeeDAO" %>
<%@ page import="cafe.CoffeeVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 참여 1</title>
</head>
<body>
설문 참여 선택<br>
<b>1. 아래 중 선호하는 카페의 형태는 무엇인가요?</b> 
<form action="updateCF.jsp">
	<div class="option">
		<label>1.프랜차이즈<input type="radio" name="cfC" value="1"></label>
	</div>
	<div class="option">
		<label>2.일반카페<input type="radio" name="cfC" value="2"></label>
	</div>
	<input type="submit" value="제출" id="button">

</form>

<!-- } catch(Exception e) {
	e.printStackTrace();
}%>
 --> 
</body>
</html>