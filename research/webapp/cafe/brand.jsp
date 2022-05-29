<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cafe.BrandDAO" %>
<%@ page import="cafe.BrandVO" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% String loginID = (String)session.getAttribute("loginID");%>
<!DOCTYPE html>
<!--
(cFC=1) brand.jsp -> brandproc.jsp 
 (-> reason.jsp -> reasonproc.jsp)

 -->
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
 <script>
 	function check(){
 		if(!document.addbrand.brandName.value){
 			alert("입력 값이 없습니다.");
 			return false;
 		}
 	}
 </script>
<html>
<head>
<meta charset="UTF-8">
<title>설문 조사</title>
</head>
<body>
<% if(loginID != null) { %>
<h3> 설문 조사</h3>
선호하는 카페 형태 - 프랜차이즈 카페 선택<br>
아래 중 선호하는 <b>브랜드</b>를 선택하시고, 만약 없다면 기타란에 직접 입력바랍니다.
<br>
<form action="brandProc.jsp">
<table class ="brandtable">
	<tr>
		<th id="num">No</th>
		<th id="brandName">Brand Name</th>
	</tr>
<%
	for (int i = 0 ; i < brandList.size(); i++){
		BrandVO brandVo = (BrandVO)brandList.get(i);
%>
	<tr>
		<td><%=i+1 %></td>
		<td><%=brandVo.getBrand() %></td>

		<td><input type="radio" name="brandType" value="<%=brandVo.getNumber()%>">
	</tr>
<%	}%>
	
</table>

<input type="submit" value="선택" id="button">
</form><br>
<%
	for (int i = 0 ; i < brandList.size(); i++){
	BrandVO brandVO = (BrandVO)brandList.get(i);
%>

<%} %>
<form action="brandAddProc.jsp" method="post" name="addbrand" onSubmit="return check()">
기타(직접 입력)<input type="text" name="brandName" /><input type="submit" value="전송" id="button"/>
</form>
<%} else { %>
		<script>
			alert("정상적인 접근이 아닙니다. 로그인해주세요.");
			location.href="../memberone/login.jsp";
		</script>
		<% } %>	
</body>
</html>