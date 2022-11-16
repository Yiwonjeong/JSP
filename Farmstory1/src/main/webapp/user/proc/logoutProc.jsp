<%@page import="kr.co.farmstory1.bean.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.invalidate(); // 로그인 회원 정보 삭제
	response.sendRedirect("/Farmstory1");
	
	//UserBean sessUser = (UserBean) session.getAttribute("sessUser");
%>
<!-- 
	<script>
		if(sessUser==null){
			alert('로그아웃 되었습니다.');
		}
	</script>
 -->

