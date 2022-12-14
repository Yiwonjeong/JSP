<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user2 manager</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script src="./js/list.js"></script>
		<script src="./js/register.js"></script>
		<script src="./js/modify.js"></script>
		<script >
			$(document).ready(function () {
				
				// user2 목록 불러오기
				list();
				
				// user2 목록화면
				$(document).on('click', '#userList', function(e) { // 2. 그래서 이 방식을 사용.	
					e.preventDefault();
					list();
				});
				
				//$('#userList').click(function () {}); // 1.웹브라우저 로딩할때 해당 #userList가 없으므로 동작되지 않는다.
				
				
				// user2 등록화면 
				$(document).on('click', '#userAdd', function(e) {
					e.preventDefault();
					register();
				});
				
				// user2 등록하기
				$(document).on('click','#btnRegister', function () {
					// 데이터 가져오기
					let uid = $('input[name=uid]').val();
					let name = $('input[name=name]').val();
					let hp = $('input[name=hp]').val();
					let age = $('input[name=age]').val();
					
					// JSON 생성
					let jsonData = {
							"uid":uid,
							"name":name,
							"hp":hp,
							"age":age
					};
					console.log(jsonData);
					// 전송
					$.ajax({
						url:'./data/register.jsp',
						method: 'post',
						data: jsonData,
						dataType: 'json',
						success: function (data) {
							if(data.result == 1){
								alert('입력성공!');
							} else {
								alert('입력실패!');
							}
							list(); // 목록 화면전환
						}
					});
				});
				
				// user2 수정화면
				$(document).on('click', '#userModify', function (e) {
					e.preventDefault();
					
					// 수정 하기 전의 데이터 값을 입력 해놓기위한 용도로
					// 수정 버튼을 누른 행의 uid, name, hp, age값이 들어있는 td태그를 저장한다.
					let user = $(this).parent().parent().children('td'); // a -> td(관리 컬럼) -> tr -> td(아이디, 이름, 휴대폰, 나이, 관리)
					
					modify(user); // 파라미터로 user변수를 보낸다.
				});
				
				// user2 수정하기
				$(document).on('click', '#btnModify', function() {
					// 데이터 가져오기
					let uid = $('input[name=uid]').val();
					let name = $('input[name=name]').val();
					let hp = $('input[name=hp]').val();
					let age = $('input[name=age]').val();
					
					// JSON 데이터로 변환
					let jsonData = {
							"uid":uid,
							"name":name,
							"hp":hp,
							"age":age
					}
					
					$.ajax({
						url:"./data/modify.jsp",
						type: 'post',
						data: jsonData,
						dataType: 'json',
						success: function (data) {
							if(data.result == 1){
								alert('수정성공!');
							} else {
								alert('수정실패!');
							}
							list(); // 목록 화면전환
						}
					})
					
				});
				
				
				// user2 삭제화면
				$(document).on('click','#userDelete', function(e){
					
					let uid = $(this).parent().parent().children('td:eq(0)').text();
					
					let jsonData = {
							"uid":uid
					}
					
					$.ajax({
						url:'./data/delete.jsp',
						type: 'post',
						dataType: 'json',
						data:jsonData,
						success: function (data) {
							if(data.result == 1){
								alert('삭제 성공');
							} else {
								alert('삭제 실패');
							}
							list(); // 목록 화면전환
						}
					});
					
				});
				
				
			
			});
		</script>
	</head>
	<body>
		<h3>user2 관리자</h3>
		
		<nav></nav>
		<section></section>
	</body>
</html>