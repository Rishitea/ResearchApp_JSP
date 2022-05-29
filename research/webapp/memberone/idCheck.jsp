<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="dao" class="memberone.MemberDao"/>
<%
	String id = request.getParameter("id");
	boolean check = dao.idCheck(id);
%>
<html>
<head>
<meta charset="UTF-8">
<title>ID중복체크</title>
<script src="script.js"></script>
</head>
<body>
<br><b><%=id %></b>
	<%
		if(check) {out.println("는 이미 존재하는 ID입니다.<br/><br/>"); }
		else { out.println("는 사용가능합니다.<br/><br/>");}
	%>
		<a href="#" onClick="javascript:self.close()">닫기</a>

</body>
</html>