<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String cookieId="";
	boolean flag = false;
	Cookie[] cookies = request.getCookies();
	for(Cookie c:cookies) {
		if((c.getName()).equals("remember")) {
			cookieId = c.getValue();
			flag = true;
		}
	}
	
	//if(cookies != null && cookies.length > 0) {
			//for(int i = 0 ; i < cookies.length ; i++) {
				//if(cookies[i].getName().equals("userId")) {
					//cookie = cookies[i].getValue();
			//}
		//}
	//}
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
					<td><input type="text" class="id" name="id" id="uname" placeholder="아이디 입력" <%if(flag){ %> value="<%=cookieId %>"<%} %> required/></td>
					<td><input name="remember" type="checkbox" value="remember" <%if(flag) { %> checked <%} %>/>아이디 기억하기</td>
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