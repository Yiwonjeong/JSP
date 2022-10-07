<%-- 필요한 외부 클래스 임포--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>


<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>page 지시어 - import속성으로 외부 클래스 불러오기</title>
	</head>
	<body>
	
		<%
		// 외부 클래스 생성
		Date today = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		String todayStr = dateFormat.format(today);
		out.println("오늘 날짜: " +todayStr);
		
		%>
		
	</body>
	</html>