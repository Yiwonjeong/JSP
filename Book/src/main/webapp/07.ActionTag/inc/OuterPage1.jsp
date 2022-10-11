<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>포함될 외부 JSP 파일1</title>
	</head>
	<body>
		<h2>외부 파일1</h2>
		
		<!-- String 타입 변수 선언 -->
		<%
			String newVar1 = "고구려 세운 동명왕";
		%>
		
		<!-- page와 request 내장 객체 영역에서 속성을 읽어와 출력 -->
		<ul>
			<li>page 영역 속성 : <%= pageContext.getAttribute("pAttr") %></li>
			<li>request 영역 속성 : <%= request.getAttribute("rAttr") %></li>
		</ul>
		
	</body>
</html>