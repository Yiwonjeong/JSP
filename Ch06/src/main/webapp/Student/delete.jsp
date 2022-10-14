<%@page import="java.sql.Statement"%>
<%@page import="config.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");	
	String stdNo = request.getParameter("stdNo");
	
	try{
		
		Connection conn = DB.getInstance().getConnection();
		Statement stmt = conn.createStatement();
		stmt.executeUpdate("DELETE FROM `student` WHERE `stdNo`='"+stdNo+"'");
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");

%>