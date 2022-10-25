<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.shop.db.DBCPshop"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String orderNo = request.getParameter("orderNo");
	String orderCount = request.getParameter("orderCount");
	String orderId = request.getParameter("orderId");
	
	int result = 0;
	
	try{
		Connection conn = DBCPshop.getConnection();
		
		String sql = "insert into `order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values (?,?,?,NOW())";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, orderId);
		psmt.setString(2, orderNo);
		psmt.setString(3, orderCount);
		
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