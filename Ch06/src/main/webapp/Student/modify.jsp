<%@page import="java.sql.ResultSet"%>
<%@page import="bean.StudentBean"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송데이터 수신
	request.setCharacterEncoding("utf-8");
	String stdNo = request.getParameter("stdNo");
	
	StudentBean sb = null;
	
 	try{
 		Connection conn = DB.getInstance().getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `student` WHERE `stdNo`= ' "+stdNo+" '");
		
		if(rs.next()){
			sb = new StudentBean();
			sb.setStdNo(rs.getString(1));
			sb.setStdName(rs.getString(2));
			sb.setStdHp(rs.getString(3));
			sb.setStdYear(rs.getInt(4));
			sb.setStdAddress(rs.getString(5));
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
 	}catch(Exception e){
 		e.printStackTrace();
 	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>student::modify</title>
	</head>
	<body>
		<h3>student 수정</h3>
		<a href="../1_JDBCTest.jsp">처음으로</a>
		<a href="./list.jsp">student 목록</a>
		<form action="./modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>학번</td>
					<td><input type="text" name="stdNo" readonly="readonly" value="<%= sb.getStdNo()%>"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="stdName" value="<%= sb.getStdName()%>"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="stdHp" value="<%= sb.getStdHp()%>"></td>
				</tr>
				<tr>
					<td>학년</td>
					<td>
						<select name="stdYear">
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="stdAddress" value="<%= sb.getStdAddress()%>"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정"/>
					</td>
				</tr>	
			</table>
		</form>
	</body>
</html>