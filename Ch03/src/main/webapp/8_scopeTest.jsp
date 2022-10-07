<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내장 객체와 영역(Scope)</title>
		<!-- 
			날짜: 2022/10/07
			이름: 이원정
			내용: JSP exception 내장 객체 실습하기
			
			내장객체영역
			- JSP 내장 객체가 저장되는 메모리의 유효기간. 
			- 웹은 페이지가 모여 하나의 요청을 처리, 요청이 모여 하나의 세션을, 다시 세션이 모여 웹 애플리케이션을 구성.
		 -->
	</head>
	<body>
		<h3>Scope</h3>
		
		<%
			// 내장 객체 영역 값 설정
			pageContext.setAttribute("name", "김유신");
			request.setAttribute("name", "김춘추");
			session.setAttribute("name", "장보고");
			application.setAttribute("name", "이순신");
		%>
		
		<h4>내장 객체 값 확인</h4>
		<p>
			pageContext 화면: <%= pageContext.getAttribute("name") %><br/>
			request 화면: <%= request.getAttribute("name") %><br/>
			session 화면: <%= session.getAttribute("name") %><br/>
			application 화면: <%= application.getAttribute("name") %><br/>
		</p>
		
		<%
			pageContext.forward("./proc/scopeResult.jsp");
		%>
		
		
		
	</body>
</html>