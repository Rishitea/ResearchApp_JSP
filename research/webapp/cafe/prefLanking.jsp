<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="cafe.BrandDAO" %>
<%@ page import="cafe.BrandVO" %>
<%@ page import="java.util.List" %>
<% String loginID = (String)session.getAttribute("loginID");%>
 <%
 	int number=0;
	int count = 0;
	List<BrandVO> brandList = null;
	BrandDAO dbBrand = BrandDAO.getInstance();
	count = dbBrand.getListCount(); // BrandTable 항목 수
	if(count > 0) {
		brandList = dbBrand.selectAll();
	}
 	number=count;

 %>
<html>
<head>
<meta charset="UTF-8">
<title>설문 현황 보기 - 2</title>
</head>
<body>
<% if(loginID != null) { %>
<h1>프랜차이즈 - Brand 설문 내역 보기</h1>
<form action="brandProc.jsp">
<table class ="brandtable">
	<tr>

		<th id="brandName">Brand Name</th>
		<th id="count">투표 수</th>
	</tr>
<%
	for (int i = 0 ; i < brandList.size(); i++){
		BrandVO brandVo = (BrandVO)brandList.get(i);
%>
	<tr>

		<td><%=brandVo.getBrand() %></td>
		<td><%=brandVo.getCount() %></td>
	</tr>
<%	}%>
	
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