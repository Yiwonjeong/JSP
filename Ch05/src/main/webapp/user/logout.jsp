<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.invalidate();

	// 자동 로그인 쿠키 삭제 (쿠키 유효기간을 0으로)
	
	Cookie c = new Cookie("cid", null);
	c.setMaxAge(0);
	response.addCookie(c);
	
	
	response.sendRedirect("./login.jsp");
%>