<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cafe.BrandDAO" %>
<%@ page import="cafe.BrandVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<!--
((cFC=1) brand.jsp ->) brandproc.jsp -> reason.jsp 
(-> reasonproc.jsp)
name="brandType", value="brandVo.getNumber()" 로 가져옴.
 -->
<html>
<head>
<%
	int brandType = Integer.parseInt(request.getParameter("brandType"));//brand.jsp에서 받은 파라미터
	BrandDAO dbBrand = BrandDAO.getInstance();
	dbBrand.updateCount(brandType);
	response.sendRedirect("./reason.jsp");
%>
