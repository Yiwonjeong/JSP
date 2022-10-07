<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>application 객체</title>
		<!-- 날짜: 2022/10/07
			이름: 이원정
			내용: JSP application 내장 객체 실습하기 
			
			application 내장 객체
			- 현재 웹 애플리케이션을 실행하는 WAS(톰캣)의 환경 객체
			- 서버 환경값(Context)를 설정하고 참조, 로그 작업 지원
		-->
	</head>
	<body>
		<h3>[application 내장 객체]</h3>
		
		<h4>서버 정보</h4>
		<%= application.getServerInfo() %>
		
		<h4>파라미터 정보</h4>
		<%
			String value = application.getInitParameter("PARAM1");
			out.println("PARAM1 값: " + value + "<br/>");
			
			String value2 = application.getInitParameter("PARAM2");
			out.println("PARAM2 값: " + value2 + "<br/>");
		%>
		
		<h4>로그 정보</h4>
		<% application.log("로그기록"); %>
		
		<h4>자원 경로</h4>
		<!-- inc의 _header파일의 실제 경로를 알아보자. -->
		<%= application.getRealPath("/inc/_header.jsp") %>
		
	</body>
</html>