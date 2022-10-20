<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
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
		
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:com/env");
		
		DataSource ds = (DataSource) ctx.lookup("dbcp_java2_hospital");
		Connection conn = ds.getConnection();
		
		String sql = "INSERT INTO `Patients` VALUES (?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, pat_id);
		psmt.setString(2, doc_id);
		psmt.setString(3, nur_id);
		psmt.setString(4, pat_name);
		psmt.setString(5, pat_jumin);
		psmt.setString(6, pat_gender);
		psmt.setString(7, pat_addr);
		psmt.setString(8, pat_phone);
		psmt.setString(9, pat_email);
		psmt.setString(10, pat_job);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
	
%>