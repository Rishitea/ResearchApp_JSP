<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "boardone.BoardDao" %>
<%@ page import = "boardone.BoardDto" %>
<% String loginID = (String)session.getAttribute("loginID");%>
<% if(loginID != null) { %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	try {
		BoardDao dbPro = BoardDao.getInstance();
		BoardDto article = dbPro.updateGetArticle(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyBoard</title>
<script src="script.js"></script>
</head>
<body>
<section>
<b>글수정</b>
<article>
	<form method="post" name="writeForm"
		action="updateProc.jsp?num=<%=num %>&pageNum=<%=pageNum %> onsubmit="return writeSave()">
		<input type="hidden" name="writer" value="<%=article.getWriter() %>">
		<table class="board">
			<tr>
				<td class="attr">이름</td>
				<td><%=article.getWriter() %></td>
			</tr>
			<tr>
				<td class="attr">이메일</td>
				<td><input type="email" name="email" value="<%=article.getEmail() %>"/></td>
			</tr>
			<tr>
				<td class="attr">제목</td>
				<td>
					<input class="input" type="text" name="subject" value="<%=article.getSubject() %>"/>
				</td>
			</tr>
			<tr>
				<td class="attr">내용</td>
				<td>
				<textarea name="content" rows="13" cols="50"><%=article.getContent() %></textarea>
				</td>
			</tr>
			<tr>
				<td class="attr">비밀번호</td>
				<td><input type="password" name="pass" /></td>
			</tr>
			<tr>
				<td colspan="2" class="attr">
					<input type="submit" value="글수정"/>
					<input type="reset" value="다시 작성" />
					<input type="button" value="목록" onClick="window.location='list.jsp'">
				</td>
			</tr>
		</table>	 
		</form>
	</article>
	</section>
	<!-- 예외처리<2> -->
	<% }catch(Exception e) { e.printStackTrace(); } %>

<%} else { %>
	<script>
		alert("정상적인 접근이 아닙니다. 로그인해주세요.");
		location.href="../memberone/login.jsp";
	</script>
<% } %>	
</body>
</html>