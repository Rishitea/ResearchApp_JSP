<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="cafe.CoffeeDAO" %>
<%@ page import="cafe.CoffeeVO" %>

 <!--
 1. 선택값 1 or 2 => Coffee Table에 updateC 메서드 활용하여 DB에 업데이트
 2. 선택값 1(프차) => brand.jsp로 연결 (-> brandproc.jsp -> reason.jsp -> reasonproc.jsp)
 3. 선택값 2(일반 카페) => reason.jsp로 연결 (->reasonproc.jsp)
 -->

<%
	
	int cafeType = Integer.parseInt(request.getParameter("cfC"));//joinResearch에서 받은 파라미터
	if (cafeType == 1 || cafeType ==2) {
		CoffeeDAO dbCoffee = CoffeeDAO.getInstance();
		dbCoffee.updateC(cafeType); //DB업데이트(coffee)
		if (cafeType == 1) {
			session.setAttribute("cafeType", "1");
			response.sendRedirect("./brand.jsp");
		} else {
			session.setAttribute("cafeType", "2");
			response.sendRedirect("./reason.jsp");
		}
	}
%>
