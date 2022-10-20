<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>patient::register</title>
	</head>
	<body>
		<h3>Patient 등록</h3>
		
		<a href="../2_DBCPTest.jsp">처음으로</a>
		<a href="./register.jsp">patient 등록</a>
		
		<form action="./registerProc.jsp" method="post">
		
			<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="pat_id"/></td>
			</tr>
			<tr>
				<td>당담 의사</td>
				<td><input type="text" name="doc_id"/></td>
			</tr>
			<tr>
				<td>당담 간호사</td>
				<td><input type="text" name="nur_id"/></td>
			</tr>
			<tr>
				<td>환자 성명</td>
				<td><input type="text" name="pat_name"/></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td><input type="text" name="pat_jumin"/></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="text" name="pat_gender"/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="pat_addr"/></td>
			</tr>
			<tr>
				<td>핸드폰 번호</td>
				<td><input type="text" name="pat_phone"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="pat_email"/></td>
			</tr>
			<tr>
				<td>직업</td>
				<td><input type="text" name="pat_job"/></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록"/>
				</td>
			</tr>
			</table>	
				
		</form>
		
	</body>
</html>