<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cafe.CoffeeDAO" %>
<%@ page import="cafe.CoffeeVO" %>
<%@ page import="cafe.BrandDAO" %>
<%@ page import="cafe.BrandVO" %>
<%@ page import="cafe.ReasonDAO" %>
<%@ page import="cafe.ReasonVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap" %>
<% String loginID = (String)session.getAttribute("loginID");%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(loginID != null) { %>
<h1>각 선택지 이유 보기</h1>
<h2>1. 프랜차이즈 선호</h2>
<%
	int number=0;
	int count=0;
	Map<String, String> reasonMap = null;
	ReasonDAO dbReason = ReasonDAO.getInstance();
	count = dbReason.getListCount();
	if (count > 0) {
		reasonMap = dbReason.showPer(1);
	}
	number=count;
%>
<form>
<table class = "reasontable">
	<tr>
		<th id="reason">이유</th>
		<td id="count">선택 비율</td>
	</tr>
	<tr>
<%
	Iterator<String> keys = reasonMap.keySet().iterator();
	while(keys.hasNext()) {
		String key = keys.next();%>
		<td><%=key %>
		<td><%=reasonMap.get(key) %></td>
	</tr>
<%	} %>
</table>
</form>

<br><br>
<h2>2. 일반 카페 선호</h2>
<%
	int number2=0;
	int count2=0;
	Map<String, String> reasonMap2 = null;
	ReasonDAO dbReason2 = ReasonDAO.getInstance();
	count = dbReason2.getListCount();
	if (count > 0) {
		reasonMap2 = dbReason2.showPer(2);
	}
	number2=count2;
%>
<form>
<table class = "reasontable">
	<tr>
		<th id="reason">이유</th>
		<td id="count">선택 비율</td>
	</tr>
	<tr>
<%
	Iterator<String> keys2 = reasonMap2.keySet().iterator();
	while(keys2.hasNext()) {
		String key2 = keys2.next();%>
		<td><%=key2 %>
		<td><%=reasonMap2.get(key2) %></td>
	</tr>
<%	} %>
</table>
</form>
<br><a href="surveyMain.jsp">돌아가기 - 메인</a>
<br><a href="showResearch.jsp">돌아가기 - 설문 현황 보기</a>

<%} else { %>
		<script>
			alert("정상적인 접근이 아닙니다. 로그인해주세요.");
			location.href="../memberone/login.jsp";
		</script>
		<% } %>	
</body>
</html>