<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cafe.ReasonDAO" %>
<%@ page import="cafe.ReasonVO" %>
<%@ page import="java.util.List" %>
<% String loginID = (String)session.getAttribute("loginID");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 조사 - 3</title>
</head>
<body>
<% if(loginID != null) { %>
<%
	int cafeType = Integer.parseInt(session.getAttribute("cafeType").toString());
	int reasonType = Integer.parseInt(request.getParameter("reasonType"));
	ReasonDAO dbReason = ReasonDAO.getInstance();
	dbReason.updateReason(reasonType,cafeType);
%>
<h3>투표 완료</h3>
<a href="surveyMain.jsp">메인으로 돌아가기</a>
<%} else { %>
		<script>
			alert("정상적인 접근이 아닙니다. 로그인해주세요.");
			location.href="../memberone/login.jsp";
		</script>
		<% } %>	
</body>
</html>