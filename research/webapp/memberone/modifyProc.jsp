<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "memberone.*" %>
<%	MemberDao dao = MemberDao.getInstance(); %>
<jsp:useBean id="dto" class="memberone.MemberDto" />
<jsp:setProperty property="*" name="dto" />
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String loginID = (String)session.getAttribute("loginID");
	dto.setId(loginID);
	dao.memberUpdate(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update PRocess</title>
<meta http-equiv="Refresh" content="3;url=main.jsp">

</head>
<body>
<article>
<font size="3" face="바탕체">
<b> 회원 정보가 수정되었습니다.</b><br><br>
3초 후에 로그인 페이지로 이동합니다.
</font>

</article>

</body>
</html>