<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.college.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.cj.exceptions.ConnectionIsClosedException"%>
<%@page import="kr.co.college.bean.StudentBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 스크립트릿 -->
<%
	List<StudentBean> students = null;

	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `Student`");
		students = new ArrayList<>();
		
		while(rs.next()){
			StudentBean sb = new StudentBean();
			sb.setStdNo(rs.getString(1));
			sb.setStdName(rs.getString(2));
			sb.setStdHp(rs.getString(3));
			sb.setStdYear(rs.getInt(4));
			sb.setStdAddress(rs.getString(5));
			
			students.add(sb);
		}
		rs.close();
		stmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!-- 뷰 영역 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>College::student</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(function(){
				$('.btnAdd').click(function(){
					$('section').show();
				});
				
				$('.btnClose').click(function(){
					$('section').hide();
				});
				
				$('input[type=submit]').click(function(){
					let stdNo = $('input[name=stdNo]').val();
					let stdName = $('input[name=regStdNo]').val();
					let stdHp = $('input[name=stdHp]').val();
					let stdYear = $('select[name=stdYear]').val();
					let stdAddress = $('input[name=stdAddress]').val();
				
					let jsonData = {
							"stdNo":stdNo,
							"stdName":stdName,
							"stdHp":stdHp
							"stdYear":stdYear
							"stdAddress":stdAddress
					};
					
					$.post('./studentProc.jsp', jsonData, function(data){
						if(data.result > 0){
							alert('등록완료!');
						}else{
							alert('등록실패!');
						}
					});
					
				});
			});
		</script>
	</head>
	<body>
		<h3>학생관리</h3>
			
			<a href="./lecture.jsp">강좌관리</a>
			<a href="./register.jsp">수강관리</a>
			<a href="./student.jsp">학생관리</a>
			
		<h4>학생목록</h4>
		<button class="btnAdd">등록</button>
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>학년</th>
				<th>주소</th>
			</tr>
			<% for (StudentBean sb : students) { %>
			<tr>
				<td><%= sb.getStdNo() %></td>
				<td><%= sb.getStdName() %></td>
				<td><%= sb.getStdHp() %></td>
				<td><%= sb.getStdYear() %></td>
				<td><%= sb.getStdAddress() %></td>
			</tr>
			<% } %>
		</table>
		
		<!--  학생 등록  -->
		<section>
			<h4>학생등록</h4>
			<button class="btnClose">닫기</button>
			<table border="1">
				<tr>
					<td>학번</td>
					<td><input type="text" name="stdNo"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="stdName"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="stdHp"/></td>
				</tr>
				<tr>
					<td>학년</td>
					<td>
						<form>
						  <select name="stdYear" >
						    <option value="none">학년선택</option>
						    <option value="" selected>1학년</option>
						    <option value="">2학년</option>
						    <option value="">3학년</option>
						    <option value="">4학년</option>
						  </select>
						</form>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="stdAddress"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="등록"/></td>
				</tr>
			</table>
		</section>
	</body>
</html>