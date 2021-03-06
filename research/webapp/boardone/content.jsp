<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "boardone.*, java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat"%>

<%@ page import = "boardAttach.*" %>

<% String loginID = (String)session.getAttribute("loginID");%>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<% if(loginID != null) { %>
</head>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	try {
		BoardDao dbPro = BoardDao.getInstance();
		BoardDto article = dbPro.getArticle(num);
		int ref = article.getRef();
		int step = article.getStep();
		int depth = article.getDepth();
%>

<body>
<section>
<article>
<b>글 내용 보기</b> <br/><br/>
<form>
	<table class="contenttable">
		<tr>
			<th>글번호</th>
			<td><%=article.getNum() %></td>
			<th>조회수</th>
			<td><%= article.getReadcount() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= article.getWriter() %></td>
			<th>작성일</th>
			<td><%= article.getRegdate() %></td>
		</tr>
		<tr>
			<th>글제목</th>
			<td colspan="3" class="contenttitle"><%= article.getSubject() %></td>
		</tr>
		<tr>
			<th>글내용</th>
			<td colspan="3" class="content"><pre><%=article.getContent() %></pre></td>
		</tr>
		<tr>
			<th>첨부파일</th>
	
<% 
	BoardAttachDao dbBAD = BoardAttachDao.getInstance();
	BoardAttachDto temp;
	String re = "";
	List<BoardDto> l = dbPro.getArticles();
	for(BoardDto b : l){
		if(b.getNum()==num){
			re=dbBAD.select(b.getNum());	%>
			<td>
			<%if (re !="no file") {%>
			<a href="downloadProc.jsp?name=<%=re %>"><%=re %></a></td> 
			<%} else {%>
				<%="no file" %>
			<%}%>
		<%break;
		}
	}
%>	
		</tr>
		<tr>
			<td colspan="4">
				<input type="button" value="글수정" onClick="document.location.href='updateForm.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum %>'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제" onClick="document.location.href='deleteForm.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum %>'">
				&nbsp;&nbsp;&nbsp;&nbsp;
		<!-- 수정<1> -->
				<input type="button" value="글목록" onClick="document.location.href='list.jsp?pageNum=<%=pageNum %>'">
			</td>
		</tr>
	</table>
	<%} catch(Exception e) {} %>
</form>
</article>
</section>
<%} else { %>
	<script>
		alert("정상적인 접근이 아닙니다. 로그인해주세요.");
		location.href="../memberone/login.jsp";
	</script>
<% } %>	
</body>
</html>