<%@page import="java.sql.Statement"%>
<%@page import="config.DBCPbook"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String custId = request.getParameter("custId");
	
	try{
		
		Connection conn = DBCPbook.getConnection();
		Statement stmt = conn.createStatement();
		stmt.executeUpdate("DELETE FROM `Customer` WHERE `custId`='"+custId+"'");
		
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("./list.jsp");
	
%>