<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cafe.ReasonDAO" %>
<%@ page import="cafe.ReasonVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 조사 - 3</title>
</head>
<body>
<%
	int cafeType = Integer.parseInt(session.getAttribute("cafeType").toString());
	int reasonType = Integer.parseInt(request.getParameter("reasonType"));
	ReasonDAO dbReason = ReasonDAO.getInstance();
	dbReason.updateReason(reasonType,cafeType);
%>
<h3>투표 완료</h3>
<a href="surveyMain.jsp">메인으로 돌아가기</a>
</body>
</html>