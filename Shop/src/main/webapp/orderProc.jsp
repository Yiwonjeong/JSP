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
		
		// 트랜잭션 
		conn.setAutoCommit(false);
		
		// SQL 실행 객체 생성
		String sql = "INSERT INTO `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values (?,?,?,NOW())";
		// 재고 관리
		/* 
		string sql = "UPDATE [Product] SET [Quantity]=[Quantity] - 1 WHERE [Product Name] = @product";
        */
		String update_stock_sql = "UPDATE `product` SET " 
						   	  + "`stock`=`stock`- (SELECT `orderCount` FROM `order` ORDER BY orderDate DESC LIMIT 1)"
							  + "WHERE `prodNo`= ?";   
		
		
		PreparedStatement psmt1 = conn.prepareStatement(sql);
		psmt1.setString(1, prodOrderer);
		psmt1.setString(2, prodNo);
		psmt1.setString(3, prodCount);
		
		PreparedStatement psmt2 = conn.prepareStatement(update_stock_sql);
		psmt2.setString(1, prodNo);
		
		// SQL 실행
		psmt1.executeUpdate();
		result = psmt2.executeUpdate();
		
		conn.commit();
		
		// 연결 해제
		psmt1.close();
		psmt2.close();
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