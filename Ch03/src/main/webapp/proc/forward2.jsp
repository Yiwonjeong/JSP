<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>forward1</title>
	</head>
	<body>
		<h3>forward1 페이지</h3>
	</body>
</html>
<%
	// forward는 서버 자원 내에서 페이지 이동이기 때문에 타 서버 자원으로 forwarding 안 된다. 
	pageContext.forward("https://naver.com");
%>
	