<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>userProc</title>
	</head>
	<body>
		<h4>클라이언트가 입력한 데이터</h4>
		<p>
			아이디= <%= uid %><br/>
			이름= <%= name %><br/>
			나이= <%= age %><br/>
		</p>
		
		<a href="request.jsp">뒤로가기</a>
	</body>
</html>