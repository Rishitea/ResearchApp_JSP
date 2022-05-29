<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "dao" class="memberone.MemberDao"/>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	int check = dao.loginCheck(id,pass);

%>

<% if (check ==1 ){ //로그인 성공
	session.setAttribute("loginID",id);
	response.sendRedirect("main.jsp");
	} else if (check == 0) { //비번 틀림	
%>
<script>
	alert("비밀번호가 틀렸습니다.");
	history.go(-1);
</script>
<%
	} else { //아이디가 없음
%>
<script>
	alert("아이디가 존재하지 않습니다.");
	history.go(-1);
</script>
<%
	}
%>
