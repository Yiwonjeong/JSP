<%@page import="kr.co.farmstory1.bean.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserBean sessUesr = (UserBean)session.getAttribute("sessUser");
	
	if(sessUesr == null){
		// 로그인을 안했으면
		pageContext.forward("/Farmstory1/user/login.jsp");
	} else {
		// 로그인을 했으면
		pageContext.forward("/Farmstory1/board/list.jsp");
	}
%>