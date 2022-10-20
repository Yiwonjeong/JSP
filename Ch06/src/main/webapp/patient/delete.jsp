<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCPpat"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String pat_id = request.getParameter("pat_id");
	
	try{
		
		Connection conn = DBCPpat.getConnection();
		
		String sql = "DELETE FROM `Patients` WHERE `pat_id`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, pat_id);
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>