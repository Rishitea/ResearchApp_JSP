<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cafe.BrandDAO" %>
<%@ page import="cafe.BrandVO" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<%
	String brandType = request.getParameter("brandType");//brand.jsp에서 받은 파라미터
	BrandDAO dbBrand = BrandDAO.getInstance();
	boolean result = dbBrand.checkBrand(brandType);
	if(result){
	response.sendRedirect("./brand.jsp");
	return;
	}
	
	dbBrand.insertBrand(brandType); //DB 업데이트(Brand 테이블에 입력값 추가)
	response.sendRedirect("./reason.jsp");
	%>
	
