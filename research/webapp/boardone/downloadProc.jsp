<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name"); //파일명
	
	String savePath = getServletContext().getRealPath("/boardone/upload"); //경로
	File file = new File(savePath, name);
	InputStream is = new FileInputStream(file);
	
	out.clear();
	out = pageContext.pushBody();
	OutputStream os = response.getOutputStream();
	
	String originFileName = new String(name.getBytes(),"iso-8859-1");
	
	response.setHeader("Content-Disposition", "attachment; filename=\"" + originFileName + "\"");
	response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
	response.setHeader("Content-Length", ""+file.length());
	
	byte buffer[] = new byte[(int)file.length()];
	int leng = 0;
	while( (leng = is.read(buffer)) > 0){
		os.write(buffer,0,leng);
	}
%>
