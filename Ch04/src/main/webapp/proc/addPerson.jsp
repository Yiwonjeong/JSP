<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	// 기존 전송 데이터 수신 (실제 사용도 높음)
	/* request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String hp = request.getParameter("hp");
	String addr = request.getParameter("addr"); */
%>
	<!-- 전송 데이터 수신 (Bean 태그, 실제 사용도 낮음) -->
	<jsp:useBean id="pb" class="bean.PersonBean">
		<!-- <jsp:setProperty property="*" name="pb"/> -->
	 	<jsp:setProperty property="name" name="pb"/>
	 	<jsp:setProperty property="age" name="pb"/>
	 	<jsp:setProperty property="hp" name="pb"/>
	 	<jsp:setProperty property="addr" name="pb"/>
	</jsp:useBean>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>3_useBean: addPerson</title>
	</head>
	<body>
		<h3>전송 데이터 출력</h3>
		<p>
			이름: <%= pb.getName() %><br/>
			나이: <%= pb.getAge() %><br/>
			휴대폰: <%= pb.getHp() %><br/>
			주소: <%= pb.getAddr() %><br/>
		</p> 
		
		<a href="../3_useBean 액션태그.jsp">뒤로가기</a>
	</body>
</html>