<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2_표현언어 내장객체</title>
		<!-- 
			날짜: 2022/11/08
			이름: 이원정
			내용: JSP 표현언어 내장객체 실습하기
			
		 -->
	</head>
	<body>
		<h3>2. 표현언어 내장객체</h3>
		<%
			pageContext.setAttribute("name", "김유신"); // page영역에 김유신 저장
			request.setAttribute("name", "김춘추");		// request영역에 김춘추 저장
			session.setAttribute("name", "장보고");		// session영역에 장보고 저장
			application.setAttribute("name", "강감찬"); // application영역에 강감찬 저장
		%>
		<p>
			pageScope name: ${pageScope.name} <br/>					<!-- pageScope에 김유신 출력 -->
			requestScope name: ${requestScope.name} <br/>			<!-- (★)requestScope에 김춘추 출력 -->
			sessionScope name: ${sessionScope.name} <br/>			<!-- (★)sessionScope에 장보고 출력 -->
			applicationScope name: ${applicationScope.name} <br/>	<!-- applicationScope에 강감찬 출력 -->
		</p>		


	</body>
</html>