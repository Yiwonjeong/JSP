<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.PatientBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.DBCPpat"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	List<PatientBean> patients = new ArrayList<>();

	try{
		
		Connection conn = DBCPpat.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `Patients`");
		
		while(rs.next()){
			PatientBean pb = new PatientBean();
			pb.setPat_id(rs.getString(1));
			pb.setDoc_id(rs.getString(2));
			pb.setNur_id(rs.getString(3));
			pb.setPat_name(rs.getString(4));
			pb.setPat_jumin(rs.getString(5));
			pb.setPat_gender(rs.getString(6));
			pb.setPat_addr(rs.getString(7));
			pb.setPat_phone(rs.getString(8));
			pb.setPat_email(rs.getString(9));
			pb.setPat_job(rs.getString(10));
			
			patients.add(pb);
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
		<title>patients::list</title>
	</head>
	<body>
		<h3>Patients 목록</h3>
		
		<a href="../2_DBCPTest.jsp">처음으로</a>
		<a href="./register.jsp">patient 등록</a>
		
		<table border="1">
		<tr>
			<th>아이디</th>
			<th>당담 의사</th>
			<th>당담 간호사</th>
			<th>환자 성명</th>
			<th>주민번호</th>
			<th>성별</th>
			<th>주소</th>
			<th>핸드폰 번호</th>
			<th>이메일 </th>
			<th>직업</th>
			<th>관리</th>
		</tr>
		<% for (PatientBean pb : patients) { %>
		<tr>
			<td><%= pb.getPat_id() %></td>
			<td><%= pb.getDoc_id() %></td>
			<td><%= pb.getNur_id() %></td>
			<td><%= pb.getPat_name() %></td>
			<td><%= pb.getPat_jumin() %></td>
			<td><%= pb.getPat_gender() %></td>
			<td><%= pb.getPat_addr() %></td>
			<td><%= pb.getPat_phone() %></td>
			<td><%= pb.getPat_email() %></td>
			<td><%= pb.getPat_job() %></td>
			<td>
				<a href="./modify.jsp?=uid=<%= pb.getPat_id()%>">수정</a>
				<a href="./delete.jsp?=uid=<%= pb.getPat_id()%>">삭제</a>
			</td>
		</tr>
		<% } %>
			
		</table>
		 
		
	</body>
</html>