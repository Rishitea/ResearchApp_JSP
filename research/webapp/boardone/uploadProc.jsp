<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="article" scope="page" class="boardone.BoardDto">
<jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
	String savePath = "./boardone/upload";
	int uploadFileSizeLimit=5*1024*1024;
	String encType="UTF-8";
	
	ServletContext context = getServletContext();
	String uploadPath = context.getRealPath(savePath); //attach - uploadPath
	try {
		MultipartRequest multi = new MultipartRequest(
				request, uploadPath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
		String fileName = multi.getFilesystemName("uploadFile"); //attach - fileName
		if(fileName == null) {
			System.out.print("업로드 실패");
		} else {
			System.out.println("업로드 성공");
		}
		int bno = article.getNum();
%>		
	<meta http-equiv="Refresh" content="0;url=writeProc.jsp?uploadPath=<%=uploadPath%>&fileName=<%=fileName%>&bno=<%=bno%>">

<%	} catch (Exception e) {
		e.printStackTrace();
	}
	
%>