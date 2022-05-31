<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="memberone.*" %>
<jsp:useBean id="dto" class="memberone.MemberDto"/>
<jsp:setProperty name="dto" property="*"/>

<% 	String writer = (String)session.getAttribute("loginID");
	
	if(writer != null) {
		String email = ""; //dto.getEmail();
		MemberDao memberDao = MemberDao.getInstance();
		email = memberDao.getMember(writer).getEmail();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="script.js"></script>
<title>My Board</title>
</head>

<body>

	<% //새글, 답글 구변용
	int num=0;
	int ref=1;
	int step=0;
	int depth = 0;
	try{
		if(request.getParameter("num")!=null) {
			num=Integer.parseInt(request.getParameter("num"));
			ref=Integer.parseInt(request.getParameter("ref"));
			step=Integer.parseInt(request.getParameter("step"));
			depth=Integer.parseInt(request.getParameter("depth"));
		}
%>	
	<section>
	<b>글쓰기</b>
	<article>
		<form method="post" name="writeForm" action="writeProc.jsp" onsubmit="return writeSave()" enctype="multipart/form-data">
		<table class="board">
			<tr>
				<td class="attr"> 이름 </td>
				<td><input type="text" name="writer" value="<%=writer%>" readonly/></td>
			</tr>
			<tr>
				<td class="attr"> 제목 </td>
				<td>
				<%if(request.getParameter("num")==null) { %>
				<input class="input" type="text" name="subject"/>
				<%} else { %>
				<input class="input" type="text" name="subject" value="[답변]"/>
				<%} %>
				</td>
			</tr>
			<tr>
				<td class="attr"> 내용 </td>
				<td>
					<textarea name="content" rows="13" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<td class="attr">비밀번호</td>
				<td><input type="password" name="pass" /></td>
			</tr>
			<tr>
				<td class="attr">파일 선택</td>
				<td><input type="file" name="uploadFile"/></td>
			<tr>
				<td colspan="2" class="attr">
					<input type="submit" value="글쓰기" />
					<input type="reset" value="다시 작성" />
					<input type="button" value="목록" onClick="window.location='list.jsp'">
				</td>
			</tr>
		</table>
		<input type="hidden" name="email" value="<%=email%>"/>
		<input type="hidden" name="num" value="<%=num %>"/>
		<input type="hidden" name="ref" value="<%=ref %>"/>
		<input type="hidden" name="step" value="<%=step %>"/>		
		<input type="hidden" name="depth" value="<%=depth %>"/>
		</form>
	</article>
	</section>
	<%} catch(Exception e) {
		e.printStackTrace();
	}%>
		
<%} else { %>
	<script>
		alert("정상적인 접근이 아닙니다. 로그인해주세요.");
		location.href="../memberone/login.jsp";
	</script>
<% } %>	

</body>
</html>