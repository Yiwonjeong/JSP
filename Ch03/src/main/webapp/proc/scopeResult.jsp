<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>scopeResult</title>
	</head>
	<body>
		<h4>내장 객체 값 확인</h4>
		<p>
			pageContext 화면: <%= pageContext.getAttribute("name") %><br/>
			request 화면: <%= request.getAttribute("name") %><br/>
			session 화면: <%= session.getAttribute("name") %><br/>
			application 화면: <%= application.getAttribute("name") %><br/>
		</p>
		
		<a href="/Ch03/proc/scopeResult.jsp">결과확인</a>
	</body>
</html>