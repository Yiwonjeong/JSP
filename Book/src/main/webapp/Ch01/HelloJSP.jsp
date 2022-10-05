<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP File 기본구조</title>
	</head>
	<body>
	
		
		<%
		
		// 스크립트릿(프로그래밍 코드 영역)
		String str1 = "JSP";
		String str2 = "안녕하세요!";
		int var1 = 1;
		boolean var2 = true;
		double var3 = 3.14;
		
		// 출력방법1) JSP 출력 객체로 HTML 출력
		out.println("<p>str1: " + str1 + "</p>");
		out.println("<p>str2: " + str2 + "</p>");
		out.println("<p>var1: " + var1 + "</p>");
		out.println("<p>var2: " + var2 + "</p>");
		out.println("<p>var3: " + var3 + "</p>");
		
		%>
		
		<!-- 출력방법2) 표현식(Expression) -->
		<p> str1: <%=str1 %>  </p>
		<p> str1: <%=str2 %>  </p>
		<p> str1: <%=var1 %>  </p>
		<p> str1: <%=var2 %>  </p>
		<p> str1: <%=var3 %>  </p>
		
	</body>
	</html>