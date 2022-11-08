<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.college.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// lecture.jsp에서 입력한 데이터 수신
	request.setCharacterEncoding("utf-8");
	String lecNo = request.getParameter("lecNo");
	String lecName = request.getParameter("lecName");
	String lecCredit = request.getParameter("lecCredit");
	String lecTime = request.getParameter("lecTime");
	String lecClass = request.getParameter("lecClass");
	
	// 전송 결과 성공/실패 여부를 알기 위한 변수 생성
	int result = 0;
	
	try{
		
		Connection conn = DBCP.getConnection();
		
		String sql = "INSERT INTO `Lecture` (`lecNo`, `lecName`, `lecCredit`, `lecTime`, `lecClass`) VALUES (?,?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, lecNo);
		psmt.setString(2, lecName);
		psmt.setString(3, lecCredit);
		psmt.setString(4, lecTime);
		psmt.setString(5, lecClass);
		
		result = psmt.executeUpdate();
		
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