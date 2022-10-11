<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

	<%
	// 오늘 날짜
	LocalDate today = LocalDate.now();
	
	// 내일 날짜
	LocalDateTime tomorrow = LocalDateTime.now().plusDays(1);
		
	%>
