<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "boardone.*" %>
<%@ page import="memberone.*" %>
<%@ page import = "java.sql.Timestamp" %>

<%@ page import="boardAttach.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%request.setCharacterEncoding("UTF-8"); %>

<%	
	//MultipartRequest mr = new MultipartRequest(
	//	request, uploadPath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
		
	String savePath = "./boardone/upload";
	int uploadFileSizeLimit=5*1024*1024;
	String encType="UTF-8";
	ServletContext context = getServletContext();
	String uploadPath = context.getRealPath(savePath); //attach - uploadPath
	try {
		MultipartRequest multi = new MultipartRequest(
				request, uploadPath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
		String fileName = multi.getFilesystemName("uploadFile"); //attach - fileName
		
		//board테이블에 insert하는 작업
		BoardDto article = new BoardDto();
		article.setNum(Integer.parseInt(multi.getParameter("num"))); //0나옴..
		article.setWriter(multi.getParameter("writer"));
		article.setEmail(multi.getParameter("email"));
		article.setSubject(multi.getParameter("subject"));
		article.setPass(multi.getParameter("pass"));
		article.setRegdate(new Timestamp(System.currentTimeMillis()));
		article.setRef(Integer.parseInt(multi.getParameter("ref")));
		article.setStep(Integer.parseInt(multi.getParameter("step")));
		article.setDepth(Integer.parseInt(multi.getParameter("depth")));
		article.setContent(multi.getParameter("content"));
		article.setIp("default");
		//insert
		BoardDao dbPro = BoardDao.getInstance();
		dbPro.insertArticle(article);
		
		int bno = dbPro.findNum(); //attach-bno
		System.out.println(bno);
		System.out.println(fileName);
		if(fileName != null) {
			//Board_Attach 테이블에 insert하는 작업.
			BoardAttachDao dbBAD = BoardAttachDao.getInstance();
			dbBAD.attachFile(uploadPath, fileName, bno);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	response.sendRedirect("list.jsp");
%>	
