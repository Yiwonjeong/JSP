<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCPpat"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String pat_id = request.getParameter("pat_id");
	String doc_id = request.getParameter("doc_id");
	String nur_id = request.getParameter("nur_id");
	String pat_name = request.getParameter("pat_name");
	String pat_jumin = request.getParameter("pat_jumin");
	String pat_gender = request.getParameter("pat_gender");
	String pat_addr = request.getParameter("pat_addr");
	String pat_phone = request.getParameter("pat_phone");
	String pat_email = request.getParameter("pat_email");
	String pat_job = request.getParameter("pat_job");
	
	try{
		
		Connection conn = DBCPpat.getConnection();
		String sql = "UPDATE `Patients` SET `doc_id`=?, `nur_id`=?, `pat_name`=?, `pat_jumin`=?, `pat_gender`=?, `pat_addr`=?, `pat_phone`=?, `pat_email`=? `pat_job`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, doc_id);
		psmt.setString(2, nur_id);
		psmt.setString(3, pat_name);
		psmt.setString(4, pat_jumin);
		psmt.setString(5, pat_gender);
		psmt.setString(6, pat_addr);
		psmt.setString(7, pat_phone);
		psmt.setString(8, pat_email);
		psmt.setString(9, pat_job);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
			
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>