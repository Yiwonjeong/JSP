<%@page import="kr.co.college.bean.RegisterBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.college.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.college.bean.LectureBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 스크립트릿 -->
<%
	// 수강 정보 가져오기
	List<RegisterBean> registers = null;
	
	// 데이터베이스 작업
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		
		String sql = "select r.regStdNo, s.stdName, l.lecName, r.regLecNo, r.regMidScore, r.regFinalScore, r.regTotalScore, r.regGrade "
				   + "from `Register` as r "
				   + "join `Lecture` as l on l.lecNo = r.regLecNo "
				   + "join `Student` as s on s.stdNo = r.regStdNo";
		ResultSet rs = stmt.executeQuery(sql);
		registers = new ArrayList<>();
		
		while(rs.next()){
			RegisterBean rb = new RegisterBean();
			rb.setRegStdNo(rs.getString(1));
			rb.setStdName(rs.getString(2));
			rb.setLecName(rs.getString(3));
			rb.setRegLecNo(rs.getInt(4));
			rb.setRegMidScore(rs.getInt(5));
			rb.setRegFinalScore(rs.getInt(6));
			rb.setRegTotalScore(rs.getInt(7));
			rb.setRegGrade(rs.getString(8));
			
			registers.add(rb);
			
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
		<title>College::register</title>
		<!-- 수강 신청 기능 -->
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
					let regStdNo = $('input[name=regStdNo]').val();
					let stdName = $('input[name=regStdNo]').val();
					let regLecNo = $('select[name=regLecNo]').val();
				
					let jsonData = {
							"regStdNo":regStdNo,
							"stdName":stdName,
							"regLecNo":regLecNo
					};
					
					$.post('./registerProc.jsp', jsonData, function(data){
						if(data.result > 0){
							alert('신청완료!');
						}else{
							alert('신청실패!');
						}
					});
					
				});
				
				
				/* 신청강좌 목록 출력 기능 */		
				$.ajax({
					url: '/College/proc.getLectures.jsp',
					type: 'GET',
					dataType: 'json'
						success: function(data){
		                	console.log(data);
		                	$().
						}
				});
				
				
			});
		</script>
	
	
	</head>
	<body>
		<h3>수강관리</h3>
			
			<a href="./lecture.jsp">강좌관리</a>
			<a href="./register.jsp">수강관리</a>
			<a href="./student.jsp">학생관리</a>
			
			<h4>수강현황</h4>

			<input type="text" name="input_stdNo"/>
			<button class="btnsearch">검색</button>
			<button class="btnAdd">수강신청</button>
			
			<table border="1">
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>강좌명</th>
					<th>강좌코드</th>
					<th>중간시험</th>
					<th>기말시험</th>
					<th>총점</th>
					<th>등급</th>
				</tr>
				<% for (RegisterBean rb : registers ) {%>
				<tr>
					<td><%= rb.getRegStdNo() %></td>
					<td><%= rb.getStdName() %></td>
					<td><%= rb.getLecName() %></td>
					<td><%= rb.getRegLecNo() %></td>
					<td><%= rb.getRegMidScore() %></td>
					<td><%= rb.getRegFinalScore() %></td>
					<td><%= rb.getRegTotalScore() %></td>
					<td><%= rb.getRegGrade() %></td>
				</tr>
				<% } %>
			</table>
			
			<!--  수강 신청  -->
			<section style="display:none;">
				<h4>수강신청</h4>
				<button class="btnClose">닫기</button>
				<table border="1">
					<tr>
						<td>학번</td>
						<td><input type="text" name="regStdNo"/></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="stdName"/></td>
					</tr>
					<tr>
						<td>신청강좌</td>
						<td>
							<form>
							  <select id="regLecNo" name="regLecNo">
							    <option>1</option>
							    <option>2</option>
							    <option>3</option>
							    <option>4</option>
							    <option>5</option>
							    <option>6</option>
							    <option>7</option>
							    <option>8</option>
							  </select>
							</form>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right"><input type="submit" value="신청"/></td>
					</tr>
				</table>
			</section>
	</body>
</html>