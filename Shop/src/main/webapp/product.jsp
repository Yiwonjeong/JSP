<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.shop.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.shop.bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 스크립트릿 (프로그램 코드 영역) -->
<%
	//제품 정보 가져오기
	List<ProductBean> products = null;

	//데이터베이스 작업
	try{
		
		// DBCP를 이용해 DB 접속
		Connection conn = DBCP.getConnection();
		
		// SQL 실행 객체 생성
		Statement stmt = conn.createStatement();
		
		// SQL 실행
		ResultSet rs = stmt.executeQuery("SELECT * FROM `Product`");
		
		// 제품 저장 List 객체 생성
		products = new ArrayList<>();
		
		// SQL 결과 처리
		while(rs.next()){
			ProductBean pb = new ProductBean();
			pb.setProdNo(rs.getInt(1));
			pb.setProdName(rs.getString(2));
			pb.setStock(rs.getInt(3));
			pb.setPrice(rs.getInt(4));
			pb.setCompany(rs.getString(5));
			
			products.add(pb);
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
		<title>Shop::product</title>
		<!-- product 주문하기 기능 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
		
			$(function(){
				
				$('.btnOrder').click(function(){
					let prodNo = $(this).val();
					$('section').show().find('input[name=prodNo]').val(prodNo);
				});
				
				
				$('.btnClose').click(function(){
					$('section').hide();
				});
				
				
				$('input[type=submit]').click(function(){
					
					let prodNo = $('input[name=prodNo]').val();
					let prodCount = $('input[name=prodCount]').val();
					let prodOrderer = $('input[name=prodOrderer]').val();
					
					let jsonData = {
							"prodNo":prodNo,
							"prodCount":prodCount,
							"prodOrderer":prodOrderer
					};
					
				$.post('./orderProc.jsp', jsonData, function(data){
						
						if(data.result > 0){
							alert('주문완료!');
						}else{
							alert('주문실패!');
						}
					});
				
				
				});
				
			});
		
/* 			$(function(){
				
				$(document).on('click', '.btnOrder', function(e) {
					
					e.preventDefault();
					
					let prodNo = $(this).val();
					$('section').empty(); //'주문하기' section 중복 출력 방지
					
					
					let table = "<table border='1'>";
					table += "<tr>";
					table += "<td>상품번호</td>";
					table += "<td><input type='text' name='prodNo' value='"+prodNo+"'/></td>";
					table += "</tr>";
					table += "<tr>";
					table += "<td>수량</td>";
					table += "<td><input type='text' name='orderCount'/></td>";
					table += "</tr>";
					table += "<td>주문자</td>";
					table += "<td><input type='text' name='custId'/></td>";
					table += "</tr>";
					table += "<td colspan='2' align='right'><input type='submit' value='주문하기'></td>";
					table += "</tr>";
					table += "</table>";
					
					$('section').append("<h4>주문하기</h4>");
					$('section').append(table);
					
				});
				
			}); */
			
			/* $(function(){
				$(document).on('click', 'input[type=submit]', function(e) {
					// 원래 이벤트 기능 제거
					e.preventDefault();
					
					// 입력한 데이터 가져오기
					let orderNo = $('input[name=prodNo]').val();
					let orderCount = $('input[name=orderCount]').val();
					let orderId = $('input[name=custId]').val();
					
					// JSON 형태로 변환
					let jsonData = {
							"prodNo":orderNo,
							"orderCount":orderCount,
							"custId":orderId
					}
					
					console.log(jsonData);
					
					// AJAX을 이용해 orderProc으로 JSON 데이터 전송
					$.ajax({
						url: './orderProc.jsp',
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
			}); */
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
			<% for (ProductBean pb : products) { %>
			<tr>
				<td><%= pb.getProdNo() %></td>
				<td><%= pb.getProdName() %></td>
				<td><%= pb.getStock() %></td>
				<td><%= pb.getPrice() %></td>
				<td><%= pb.getCompany() %></td>
				<td><button class="btnOrder" value="<%= pb.getProdNo() %>">주문</button></td>
			</tr>
			<% } %>
		</table>
		
		<!-- 주문장 테이블 출력 -->
		<section style="display:none;">
			<h4>주문하기</h4>
			<table border="1">
				<tr>
					<td>상품번호</td>
					<td><input type="text" name="prodNo" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>수량</td>
					<td><input type="text" name="prodCount" /></td>
				</tr>
				<tr>
					<td>주문자</td>
					<td><input type="text" name="prodOrderer" /></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="주문하기"/></td>
				</tr>
			</table>
			<button class="btnClose">닫기</button>
		</section> 
		
	</body>
</html>