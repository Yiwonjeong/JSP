<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.shop.db.DBCPshop"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.shop.bean.ProBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<ProBean> products = new ArrayList<>();

	try{
		
		Connection conn = DBCPshop.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `Product`");
		
		while(rs.next()){
			ProBean pb = new ProBean();
			pb.setProdNo(rs.getInt(1));
			pb.setProdName(rs.getString(2));
			pb.setStock(rs.getInt(3));
			pb.setPrice(rs.getInt(4));
			pb.setCompany(rs.getString(5));
			
			products.add(pb);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>


<!-- 주문 버튼 클릭하여 JSON 데이터 요청 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Shop::product</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(function(){
				$('.btnOrder').click(function(){
					
					$('section').empty();
					let orderNo = $(this).val();
					
					let table = "<table border='1'>";
						table += "<tr>";
						table += "<td>상품번호</td>";
						table += "<td><input type='text' name='orderNo' value='"+orderNo+"'/></td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td>수량</td>";
						table += "<td><input type='text' name='orderCount'/></td>";
						table += "</tr>";
						table += "<td>주문자</td>";
						table += "<td><input type='text' name='orderId'/></td>";
						table += "</tr>";
						table += "<td colspan='2' align='right'><button id='btnProductOrder'>주문하기</button></td>";
						table += "</tr>";
						table += "</table>";
		
					
					$('section').append("<h4>주문하기</h4>");
					$('section').append(table);
				
				});
			});
			
			/* 주문하기 폼 입력 후 '주문하기'버튼 클릭 시*/
			$(function(){
				$(document).on('click', '#btnProductOrder', function (e) {
					e.preventDefault();
					
					// 입력한 데이터 가져오기
					let orderNo = $('input[name=orderNo]').val();
					let orderCount = $('input[name=orderCount]').val();
					let orderId = $('input[name=orderId]').val();
					
					// 가져온 데이터(JSON) 생성하기
					let jsonData = {
							"orderNo":orderNo,
							"orderCount":orderCount,
							"orderId":orderId
					};
					
					console.log(jsonData);
					
					// 데이터 전송
					$.ajax({
						url: './insert.jsp',
						method: 'post',
						data: jsonData,
						dataTye: 'json',
						success:function(data){
							if(data.result == 1){
								alert('주문완료!');
							}else{
								alert('주문실패!');
							}
						}
					});
				});
			});
			
			
		</script>
		

	
	</head>
	<body>
		<h3>상품 목록</h3>
		<a href="./customer.jsp">고객목록</a>
		<a href="./order.jsp">주문목록</a>
		<a href="./product.jsp">상품목록</a>
		
		<table border="1">
			<tr>
				<th>상품번호</th>
				<th>상품명</th>
				<th>재고량</th>
				<th>가격</th>
				<th>제조사</th>
				<th>주문</th>			
			</tr>
			<% for (ProBean pb : products) { %>
			<tr>
				<td><%= pb.getProdNo() %></td>
				<td><%= pb.getProdName() %></td>
				<td><%= pb.getStock() %></td>
				<td><%= pb.getPrice() %></td>
				<td><%= pb.getCompany() %></td>
				<td>
					<button class="btnOrder" value="<%= pb.getProdNo() %>">주문</button>
				</td>
			</tr>
			<% } %>
		</table>
		
		<section></section>
		
	</body>
</html>