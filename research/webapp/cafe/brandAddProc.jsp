<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cafe.BrandDAO" %>
<%@ page import="cafe.BrandVO" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<%
	String brandName = request.getParameter("brandName");//brand.jsp에서 받은 파라미터
	BrandDAO dbBrand = BrandDAO.getInstance();
	boolean result = dbBrand.checkBrand(brandName);
	if(result){
	response.sendRedirect("./brand.jsp");
	return;
	}
	
	dbBrand.insertBrand(brandName); //DB 업데이트(Brand 테이블에 입력값 추가)
	response.sendRedirect("./reason.jsp");
	%>
	
