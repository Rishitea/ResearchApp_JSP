<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String remember=(String)request.getAttribute("remember");
	if(remember == null) {
		remember ="";
	}
	Cookie[] cookies = request.getCookies();
	if(cookies == null) {
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("remember")) {
				request.setAttribute("remember",cookie.getValue());
			}
		}
	}
%>

<title>Login</title>
</head>
<body>
<section>
	<article class="login">
		<form method="post" action="loginProc.jsp">
			<table class="loginTable">
				<tr>
					<th colspan="2">회원 로그인</th>
				</tr>
				<tr>
					<td><input type="text" class="id" name="id" value="<%=remember %>" id="uname" placeholder="아이디 입력" required/></td>
					<td><input class="form-check-input" type="checkbox" name="remember" required/></td>
				</tr>
				<tr>
					<td><input type="password" class="pass" name="pass" placeholder="비밀번호 입력"></td>
				</tr>
				<tr>
					<td colspan="2" class="loginsubmit">
						<input type="submit" value="로그인"/>
						<input type="button" value="회원가입" onClick="javascript:window.location='regForm.jsp'"/>
					</td>
				</tr>
			</table>
		</form>
	</article>	
</section>

</body>
</html>