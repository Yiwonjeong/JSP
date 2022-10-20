<%@page import="bean.PatientBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCPpat"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String pat_id = request.getParameter("pat_id");
	PatientBean pb = null;
	
	try{
		
		Connection conn = DBCPpat.getConnection();
		
		String sql = "SELECT * FROM `Patients` WHERE `pat_id`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, pat_id);
		
		ResultSet rs = psmt.executeQuery();
		if(rs.next()){
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
		}
		rs.close();
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>Patient 등록</h3>
		
		<a href="../2_DBCPTest.jsp">처음으로</a>
		<a href="./register.jsp">patient 등록</a>
		
		<form action="./modifyProc.jsp" method="post">
		
			<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="pat_id" readonly value="<%= pb.getPat_id()%>"/></td>
			</tr>
			<tr>
				<td>당담 의사</td>
				<td><input type="text" name="doc_id" value="<%= pb.getDoc_id()%>"/></td>
			</tr>
			<tr>
				<td>당담 간호사</td>
				<td><input type="text" name="nur_id" value="<%= pb.getNur_id()%>"/></td>
			</tr>
			<tr>
				<td>환자 성명</td>
				<td><input type="text" name="pat_name" value="<%= pb.getPat_name()%>"/></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td><input type="text" name="pat_jumin" value="<%= pb.getPat_jumin()%>"/></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="text" name="pat_gender" value="<%= pb.getPat_gender()%>"/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="pat_addr" value="<%= pb.getPat_addr()%>"/></td>
			</tr>
			<tr>
				<td>핸드폰 번호</td>
				<td><input type="text" name="pat_phone" value="<%= pb.getPat_phone()%>"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="pat_email" value="<%= pb.getPat_email()%>"/></td>
			</tr>
			<tr>
				<td>직업</td>
				<td><input type="text" name="pat_job" value="<%= pb.getPat_job()%>"/></td>
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