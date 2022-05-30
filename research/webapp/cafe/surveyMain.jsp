<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String loginID = (String)session.getAttribute("loginID");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사메인</title>
</head>
<body>
<b>선호하는 카페 형태 조사</b>
<% if(loginID != null) { %>
<form action="" method='post'><br>
<a href="joinResearch.jsp">1. 설문에 참여하기</a><br>
<a href="showResearch.jsp">2. 설문 현황 보기</a><br>
<br><br><br>
<a href="../memberone/main.jsp"><b>로그인 화면으로 돌아가기</b></a>


</form>
<%} else { %>
		<script>
			alert("정상적인 접근이 아닙니다. 로그인해주세요.");
			location.href="../memberone/login.jsp";
		</script>
		<% } %>	

</body>
</html>