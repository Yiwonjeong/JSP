<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.shop.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.shop.bean.OrderBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 스크립트릿 (프로그램 코드 영역) -->
<%
	// 주문 정보 가져오기
	List<OrderBean> orders = null;

	// 데이터베이스 작업
	try{
		
		// DBCP를 이용해 DB 접속
		Connection conn = DBCP.getConnection();
		
		// SQL 실행 객체 생성
		Statement stmt = conn.createStatement();
		String sql = "SELECT o.orderNo, c.name, p.prodName, o.orderCount, o.orderDate "
				   + " FROM `order` as o"
				   + " join `customer` as c on o.orderid = c.custid"
				   + " join `product` as p on o.orderProduct = p.prodNo";
		
		// SQL 실행
		ResultSet rs = stmt.executeQuery(sql);
		
		// 주문 저장 List 객체 생성
		orders = new ArrayList<>();
		
		// SQL 결과 처리
		while(rs.next()){
			OrderBean ob = new OrderBean();
			ob.setOrderNo(rs.getInt(1));
			ob.setName(rs.getString(2));
			ob.setProdName(rs.getString(3));
			ob.setOrderCount(rs.getInt(4));
			ob.setOrderDate(rs.getString(5));
			
			orders.add(ob);
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
		<title>Shop::order</title>
	</head>
	<body>
		<h3>주문 목록</h3>
		
		<a href="./customer.jsp">고객목록</a>
		<a href="./order.jsp">주문목록</a>
		<a href="./product.jsp">상품목록</a>
		
		<table border="1">
			<tr>
				<th>주문번호</th>
				<th>주문자</th>
				<th>주문상품</th>
				<th>주문수량</th>
				<th>주문일</th>
			</tr>
			<% for(OrderBean ob : orders){ %>
			<tr>
				<td><%= ob.getOrderNo() %></td>
				<td><%= ob.getName() %></td>
				<td><%= ob.getProdName() %></td>
				<td><%= ob.getOrderCount() %></td>
				<td><%= ob.getOrderDate() %></td>
			</tr>
			<% } %>
		</table>
	</body>
</html>