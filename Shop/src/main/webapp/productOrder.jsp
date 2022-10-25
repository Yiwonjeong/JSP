<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Shop::product</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(function(){
				$('input[type=submit]').click(function(e){
					e.preventDefault();
					
					// 입력한 데이터 가져오기
					let orderId = $('input[name=orderId]').val();
					let orderCount = $('input[name=orderCount]').val();
					let orderName = $('input[name=orderName]').val();
					
					// 데이터 전송 생성하기 (JSON)
					let jsonData = {
						"orderId":orderId,
						"orderCount":orderCount,
						"orderName":orderName
					};
					
					// 데이터 전송
					$.ajax({
						url: "./product.jsp",
						type: 'post',
						data: 'jsonData',
						success: function(data){
							console.log(data);
						}
					});
				});
			});
		</script>
	</head>
	<body>
		<h3>주문하기</h3>
		
		<form action="#">
			<table border="1">
				<tr>
					<td>상품번호</td>
					<td><input type="text" name="orderId"/></td>
				</tr>
				<tr>
					<td>수량</td>
					<td><input type="text" name="orderCount"/></td>
				</tr>
				<tr>
					<td>주문자</td>
					<td><input type="text" name="orderNo"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="주문하기"/></td>
				</tr>
			</table>
		</form>
	</body>
</html>
