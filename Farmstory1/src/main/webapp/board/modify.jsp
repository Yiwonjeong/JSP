<%@page import="kr.co.farmstory1.dao.ArticleDAO"%>
<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/_header.jsp" %>
<%
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");
	pageContext.include("/board/_"+group+".jsp");
	
	String no = request.getParameter("no");
	String pg = request.getParameter("pg");
	ArticleBean ab = ArticleDAO.getInstance().selectArticle(no);
%>

<main id="board">
    <section class="modify">

        <form action="./proc/modifyProc.jsp">
        <input type="hidden" name="no" value="<%= no %>">
        <input type="hidden" name="pg" value="<%= pg %>">
        <input type="hidden" name="group" value="<%= group %>">
	    <input type="hidden" name="cate" value="<%= cate %>">
            <table border="0">
                <caption>글 수정</caption>
                <tr>
                    <th>제목</th>
                    <td>
                    	<input type="text" name="title" placeholder="제목을 입력하세요." value="<%= ab.getTitle() %>">
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea name="content"><%= ab.getContent() %></textarea>
                    </td>
                </tr>
            </table>
            <div>
                <a href="./view.jsp?no=<%= no %>&group=<%= group %>&cate=<%= cate %>&pg=<%= pg %>" class="btn btnCalcel">취소</a>
                <input type="submit" value="수정완료" class="btn btnComplete"/>
            </div>
        </form>

    </section>
</main>


<%@ include file="/_footer.jsp" %>