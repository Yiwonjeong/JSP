<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ub" class="bean.UserBean">
	<jsp:setProperty property="*" name="ub"/>
</jsp:useBean>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addUser</title>
	</head>
	<body>
		<h3>전송 데이터 출력</h3>
		<p>
			아이디: <%= ub.getId() %><br/>
			비밀번호: <%= ub.getPw() %><br/>
			이름: <%= ub.getName() %><br/>
			생일: <%= ub.getBirth() %><br/>
			성별: <%= ub.getGender() == 1? "남자" : "여자" %><br/>
			주소: <%= ub.getAddr() %><br/>
			취미: <%= String.join(",", ub.getHobby()) %><br/>
		</p> 
		
		<a href="../3_useBean 액션태그.jsp">뒤로가기</a>
	</body>
</html>