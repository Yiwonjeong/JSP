<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.college.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//register.jsp에서 입력한 데이터 수신
	request.setCharacterEncoding("utf-8");
	String regStdNo = request.getParameter("regStdNo");
	String stdName = request.getParameter("stdName");
	String regLecNo = request.getParameter("regLecNo");
	
	int result = 0;

	try{
		
		Connection conn = DBCP.getConnection();
		
		String sql = "INSERT INTO `Register` (`regStdNo`, `stdName`, `regLecNo`) VALUES (?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, regStdNo);
		psmt.setString(2, stdName);
		psmt.setString(3, regLecNo);
		
		result= psmt.executeUpdate();
		
		psmt.close();
		conn.close();
				
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	String jsonData = json.toString();
	out.print(jsonData);
%>