<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String no =request.getParameter("no");
	String content =request.getParameter("content");
	
	Date now = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String rdate = sdf.format(now);
	
	int result = ArticleDAO.getInstance().updateComment(content, no);
	
	JsonObject json = new JsonObject();
	json.addProperty("rdate", rdate);
	json.addProperty("result", result);
	
	out.print(json.toString());
%>