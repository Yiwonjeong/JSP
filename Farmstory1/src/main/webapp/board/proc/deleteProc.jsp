<%@page import="java.io.File"%>
<%@page import="kr.co.farmstory1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");
	String pg = request.getParameter("pg");
	
	ArticleDAO dao = ArticleDAO.getInstance();
	
	// 글 삭제 + 댓글 삭제
	dao.deleteArticle(no);
	
	// 파일 삭제(DB)
	String fileName = ArticleDAO.getInstance().deleteFile(no);
	
	// 파일 삭제(디렉터리)
	if(fileName != null){
		
		String savePath = application.getRealPath("/file");
		File file = new File(savePath, fileName);
		
		if(file.exists()){
			file.delete();
		}
	}
	
	
	response.sendRedirect("/Farmstory1/board/list.jsp?pg=" + pg + "&result=201");
%>