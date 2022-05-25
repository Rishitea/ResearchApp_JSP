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
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>각 선택지 이유 보기</h1>
<h2>1. 프랜차이즈 선호</h2>
<%
	int number=0;
	int count=0;
	
	List<ReasonVO> reasonList = null;
	ReasonDAO dbReason = ReasonDAO.getInstance();
	count = dbReason.getListCount();
	if (count > 0) {
		reasonList = dbReason.selectAll(1);
	}
	number=count;
%>
<form>
<table class = "reasontable">
	<tr>
		<th id="num">No</th>
		<th id="reason">Reason</th>
		<td id="count">투표 수</td>
	</tr>
<%
	for( int i = 0 ; i < reasonList.size() ; i++) {
		ReasonVO reasonVo = (ReasonVO)reasonList.get(i);
%>
	<tr>
		<td><%=reasonVo.getNumber() %></td>
		<td><%=reasonVo.getReason() %></td>
		<td><%=reasonVo.getCount() %></td>
	</tr>
<%	} %>
</table>
</form>


<br><br>
<h2>2. 일반 카페 선호</h2>
<%
	int number2=0;
	int count2=0;
	
	List<ReasonVO> reasonList2 = null;
	ReasonDAO dbReason2 = ReasonDAO.getInstance();
	count = dbReason2.getListCount();
	if (count > 0) {
		reasonList2 = dbReason2.selectAll(2);
	}
	number2=count2;
%>
<form>
<table class = "reasontable2">
	<tr>
		<th id="num">No</th>
		<th id="reason">Reason</th>
		<td id="count">투표 수</td>
	</tr>
<%
	for( int i = 0 ; i < reasonList2.size() ; i++) {
		ReasonVO reasonVo2 = (ReasonVO)reasonList2.get(i);
%>
	<tr>
		<td><%=reasonVo2.getNumber() %></td>
		<td><%=reasonVo2.getReason() %></td>
		<td><%=reasonVo2.getCount() %></td>
	</tr>
<%	} %>
</table>
</form>
<br><a href="surveyMain.jsp">메인으로 돌아가기</a>
</body>
</html>