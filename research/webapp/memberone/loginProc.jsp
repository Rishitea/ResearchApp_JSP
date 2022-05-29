<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "memberone.*" %>
<%	MemberDao dao = MemberDao.getInstance(); %>

<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	int check = dao.loginCheck(id,pass);
	String remember = request.getParameter("remember");

%>

<% if (check ==1 ){ //로그인 성공
		if(remember == null) {
			Cookie[] co = request.getCookies();
			if(co!=null) {
				for(Cookie c:co) {
					if((c.getName()).equals("remember")) {
						Cookie cookie = new Cookie("remember",id);
						cookie.setMaxAge(0);
						cookie.setPath("/research");
						response.addCookie(cookie);
						//System.out.println("쿠키 데이터 삭제 완료");
					}
				}
			}
		}else if(remember.equals("remember")) {
			Cookie cookie = new Cookie("remember",id);
			cookie.setMaxAge(60*10);
			cookie.setPath("/research");
			response.addCookie(cookie);
			//System.out.println("쿠키 생성 완료");
		}
		//System.out.println("로그인 성공");
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
