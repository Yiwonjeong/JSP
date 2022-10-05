<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>response</title>
	</head>
	<body>
		<h3>response 처리 페이지</h3>
	</body>
	</html>
	<%
		// 페이지를 출력이 아닌 파일 다운로드로 응답
		response.setHeader("Content-Type", "application/octet-stream");
	%>