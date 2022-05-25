<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cafe.CoffeeDAO" %>
<%@ page import="cafe.CoffeeVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<!-- 
favoriteProc.jsp -> showFavorite.jsp
 -->
  <%
 	int number=0;
	int count = 0;
	List<CoffeeVO> coffeeList = null;
	CoffeeDAO dbCoffee = CoffeeDAO.getInstance();
	count = dbCoffee.getListCount(); // coffeeTable 항목 수
	if(count > 0) {
		coffeeList = dbCoffee.selectAll();
	}
 	number=count;
 %>
<html>
<head>
<meta charset="UTF-8">
<title>설문 현황 보기 - 1</title>
</head>
<body>
<h1> 프랜차이즈 vs 일반카페</h1>
<form>
<table class ="coffeeTable">
	<tr>
		<th id="number">No</th>
		<th id="category">Category</th>
		<th id="count">투표 수</th>
	</tr>
<%
	for (int i = 0 ; i < coffeeList.size(); i++){
		CoffeeVO brandVo = (CoffeeVO)coffeeList.get(i);
%>
	<tr>
		<td><%=brandVo.getNumber() %></td>
		<td><%=brandVo.getCategory() %></td>
		<td><%=brandVo.getCount() %></td>
	</tr>
<%	}%>
	
</table>
</form>
<br><a href="surveyMain.jsp">돌아가기 - 메인</a>
<br><a href="showResearch.jsp">돌아가기 - 설문 현황 보기</a>
</body>
</html>