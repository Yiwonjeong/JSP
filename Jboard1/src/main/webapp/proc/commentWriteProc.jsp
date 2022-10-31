<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");
	String pg = request.getParameter("pg");
	String content = request.getParameter("content");
	String uid = request.getParameter("uid");
	String regip = request.getRemoteAddr();
	
	try{
		
		Connection conn = DBCP.getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_COMMENT);
		psmt.setString(1, no); // (form 글 번호: no = parent)
		psmt.setString(2, content);
		psmt.setString(3, uid);
		psmt.setString(4, regip);
		
		psmt.executeUpdate();
		psmt.close();
		conn.close();
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("/Jboard1/view.jsp?no="+no+"&pg="+pg);
%>