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
<!--
((cFC=1) brand.jsp -> brandproc.jsp ->) 
reason.jsp -> reasonproc.jsp
/name="brandType", value="brandVo.getNumber()" 로 가져옴.
 -->
<% String loginID = (String)session.getAttribute("loginID");%>
 <%
 	//int cfNum = 0; // cfNum=1 => coffeeTable의 프차 / cfNum=2 => coffeeTable의 일반카페 선택
	//(joinResearch.jsp/updateCF.jsp 의 cFC value 1/2)
	CoffeeDAO dbCoffee = CoffeeDAO.getInstance();
 	int cafeType = Integer.parseInt(session.getAttribute("cafeType").toString());
 	int number=0;
 	int count=0;
 	
 	List<ReasonVO> reasonList = null;
 	ReasonDAO dbReason = ReasonDAO.getInstance();
 	count = dbReason.getListCount();
 	if (count > 0) {
 		reasonList = dbReason.selectAll(cafeType);
 	}
 	number=count;
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 참여 1</title>
</head>
<body>
<% if(loginID != null) { %>
<b>이전 선택지에 대한 이유를 골라주세요.</b>
<form action="reasonProc.jsp">
<table class = "reasontable">
	<tr>
		<th id="num">No.</th>
		<th id="reason">Reason.</th>

	</tr>
<%
	for( int i = 0 ; i < reasonList.size() ; i++) {
		ReasonVO reasonVo = (ReasonVO)reasonList.get(i);
%>
	<tr>
		<td><%=reasonVo.getNumber() %></td>
		<td><%=reasonVo.getReason() %></td>

		<td><input type="radio" name="reasonType" value="<%=reasonVo.getNumber() %>">
	</tr>
<%	} %>
</table>
<input type="submit" value="선택" id="button">
</form>
<%} else { %>
		<script>
			alert("정상적인 접근이 아닙니다. 로그인해주세요.");
			location.href="../memberone/login.jsp";
		</script>
		<% } %>	
</body>
</html>