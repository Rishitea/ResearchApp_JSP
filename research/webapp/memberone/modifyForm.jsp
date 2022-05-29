<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "memberone.*"%>
<%	MemberDao dao = MemberDao.getInstance(); %>
<%
	String loginID = (String)session.getAttribute("loginID");
	MemberDto dto = dao.getMember(loginID);
%>

<html>
<head>
<script src="script.js"></script>
<meta charset="UTF-8">
<title>Modify Form</title>
<script src = "script.jsp"></script>
</head>
<body>
<section>
<form method="post" action="modifyProc.jsp" name="regForm">
	<table class="regtable">
		<tr>
			<th colspan="2">회원 수정 정보 입력</th>
		</tr>
		<tr>
			<td>아이디: </td>
			<td><%=dto.getId() %>
		</tr>
		<tr>
			<td>패스워드: </td>
			<td><input type="password" name="pass" value="<%=dto.getPass()%>" required /> </td>
		</tr>
		<tr>
			<td>패스워드 확인: </td>
			<td><input type="password" name="repass" value="<%=dto.getPass() %>" required /></td>
		</tr>
		<tr>
			<td>이메일: </td>
			<td><input type="email" name="email" value="<%=dto.getEmail() %>" required /></td>
		</tr>
		<tr>
			<td colspan="2" class="regsubmit">
			<input type="button" value="정보 수정" onClick="updateCheck()" /> &nbsp;&nbsp;
			<input type="button" value="취소" onClick="javascript:window.location='main.jsp'"/>
			</td>
		</tr>
	</table>
</form>
</section>
</body>
</html>