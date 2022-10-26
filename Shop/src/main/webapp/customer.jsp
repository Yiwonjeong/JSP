<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.shop.db.DBCP"%>
<%@page import="com.mysql.cj.exceptions.ConnectionIsClosedException"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.shop.bean.CustomerBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 스크립트릿 (프로그램 코드 영역) -->
<%
	// 고객 정보 가져오기
	List<CustomerBean> customers = null;

	// 데이터베이스 작업
	try{
		
		// DBCP를 이용해 DB 접속
		Connection conn = DBCP.getConnection();
		
		// SQL 실행 객체 생성
		Statement stmt = conn.createStatement();
		
		// SQL 실행
		ResultSet rs = stmt.executeQuery("SELECT * FROM `Customer`");
		
		// 고객 저장 List 객체 생성
		customers = new ArrayList<>();
		
		// SQL 결과 처리
		while(rs.next()){
			CustomerBean cb = new CustomerBean();
			cb.setCustId(rs.getString(1));
			cb.setName(rs.getString(2));
			cb.setHp(rs.getString(3));
			cb.setAddr(rs.getString(4));
			cb.setRdate(rs.getString(5));
			
			customers.add(cb);
		}
		
		// 연결 해제
		rs.close();
		stmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!-- 뷰 영역 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Shop::customer</title>
	</head>
	<body>
		<h3>고객 목록</h3>
		
		<a href="./customer.jsp">고객목록</a>
		<a href="./order.jsp">주문목록</a>
		<a href="./product.jsp">상품목록</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>주소</th>
				<th>가입일</th>
			</tr>
			<% for ( CustomerBean cb : customers) { %>
			<tr>
				<td><%= cb.getCustId() %></td>
				<td><%= cb.getName() %></td>
				<td><%= cb.getHp() %></td>
				<td><%= cb.getAddr() %></td>
				<td><%= cb.getRdate() %></td>
			</tr>
			<% } %>
		</table>
	</body>
</html>