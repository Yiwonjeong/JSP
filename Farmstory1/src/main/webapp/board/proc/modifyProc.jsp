<%@page import="kr.co.farmstory1.dao.ArticleDAO"%>
<%
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");
	String pg = request.getParameter("pg");
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");
	String title = request.getParameter("title");
	String content = request.getParameter("content"); 
	ArticleDAO dao = ArticleDAO.getInstance();
	
	int result = dao.updateArticle(no, title, content);
	
	response.sendRedirect("/Farmstory1/board/view.jsp?group=" + group + "&cate=" + cate + "&pg=" + pg + "&no=" + no);
%>