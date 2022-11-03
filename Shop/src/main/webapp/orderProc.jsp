<%@page import="kr.co.shop.db.DBCP"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// product.jsp에서 입력한 데이터 수신
	request.setCharacterEncoding("utf-8");
	String prodNo = request.getParameter("prodNo");
	String prodCount = request.getParameter("prodCount");
	String prodOrderer = request.getParameter("prodOrderer");
	
	// 전송 결과 성공/실패 여부를 알기 위한 변수 생성
	int result = 0;
	
	try{
		// DB 접속
		Connection conn = DBCP.getConnection();
		
		// SQL 실행 객체 생성
		String sql = "INSERT INTO `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values (?,?,?,NOW())";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, prodOrderer);
		psmt.setString(2, prodNo);
		psmt.setString(3, prodCount);
		
		// SQL 실행
		result = psmt.executeUpdate();
		
		// 연결 해제
		psmt.close();
		conn.close();
	
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// JSON 데이터로 변환 (JSON 출력)
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	String jsonData = json.toString();
	out.print(jsonData);
%>