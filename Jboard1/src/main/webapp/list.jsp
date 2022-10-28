<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	String pg = request.getParameter("pg");
	
	// 게시글 목록 처리 관련 변수 선언
	int limitStart = 0;
	int currentPage = 1;
	int total = 0;
	int lastPageNum = 0;
	int pageGroupCurrent = 1;
	int pageGroupStart = 1;
	int pageGroupEnd = 0;
	int pageStartNum = 0;
	
	// 게시글 DAO 객체 가져오기
	ArticleDAO dao = ArticleDAO.getInstance();
	
	// 전체 게시글 개수 구하기
	total = dao.selectCountTotal();
	
	// 페이지 마지막 번호 계산하기
	if(total % 10 == 0){
 		lastPageNum = (total / 10);
 	}else{
 		lastPageNum = (total / 10) + 1; 		
 	}
	
	// 현재 페이지 게시글 limit 시작값 계산하기
	if(pg != null){
		currentPage = Integer.parseInt(pg);
	}
	limitStart = (currentPage - 1) * 10; // 1page->0, 2page->10, 3page->20...
	
	// 페이지 그룹 계산
	pageGroupCurrent = (int)Math.ceil(currentPage / 10.0); // 1group(1~10), 2group(11~20), 3group(21~30)...
	pageGroupStart = (pageGroupCurrent - 1) *10 + 1;	// 1group: 1, 2group:11, 3group:21...
	pageGroupEnd = pageGroupCurrent * 10; // 1group: 10, 2group:20, 3group:30...
	
	if(pageGroupEnd > lastPageNum){
		pageGroupEnd = lastPageNum;
	}
	
	// 페이지 시작 번호 계산하기
	pageStartNum = total - limitStart;
 	
	// 현재 페이지 게시글 가져오기
 	List<ArticleBean> articles = dao.selectArticles(limitStart);
	

%>
<%@ include file="./_header.jsp" %>
<main id="board">
    <section class="list">
        <table border="0">
            <caption>글 목록</caption>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>날짜</th>
                <th>조회</th>
            </tr>  
            <% for (ArticleBean article : articles) {%>                  
            <tr>
                <td><%= pageStartNum-- %></td>
                <td><a href="/Jboard1/view.jsp?no=<%= article.getNo() %>&pg=<%= currentPage %>"><%= article.getTitle() %>[<%= article.getFile() %>]</a></td>
                <td><%= article.getNick() %></td>
                <td><%= article.getRdate().substring(2,10) %></td>
                <td><%= article.getHit() %></td>
            </tr>
            <% } %>
        </table>

        <div class="page">
        	<% if (pageGroupStart > 1){ %>
            <a href="/Jboard1/list.jsp?pg=<%= pageGroupStart - 1 %>" class="prev">이전</a>
            <% } %>
            <% for (int i=pageGroupStart; i<=pageGroupEnd; i++){ %>
            <a href="/Jboard1/list.jsp?pg=<%= i %>" class="num <%= (currentPage == i)?"current":"off"%>"><%= i %></a>
			<% } %>
			<% if (pageGroupEnd < lastPageNum){ %>
            <a href="/Jboard1/list.jsp?pg=<%= pageGroupEnd + 1 %>" class="next">다음</a>
         	<% } %>
        </div>

        <a href="/Jboard1/write.jsp" class="btn btnWrite">글쓰기</a>
        
    </section>
</main>
<%@ include file="./_footer.jsp" %>   