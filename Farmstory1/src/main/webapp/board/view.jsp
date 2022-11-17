<%@page import="java.util.List"%>
<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="kr.co.farmstory1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/_header.jsp" %>
<%
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");
	String no = request.getParameter("no");
	String pg = request.getParameter("pg");
	
	ArticleDAO dao = ArticleDAO.getInstance();
	
	dao.updateArticleHit(no); // 조회수 +1
	ArticleBean ab = dao.selectArticle(no); // 게시물을 가져오기
	
	// 댓글 가져오기
	List<ArticleBean> comments = dao.selectComments(no);
	dao.close();
	
	pageContext.include("/board/_"+group+".jsp");
%>
<script src="/Farmstory1/board/js/comment.js"></script>
<script>
	$(document).ready(function () {	
		
		// 글 삭제
		$('.btnRemove').click(function (e) {
			let isDelete = confirm('정말 삭제하시겠습니까?');
			
			if(isDelete){
				return true;
			}else {
				return false;
			}
		});
		
		// 게시글의 댓글 유무 확인
		commentEmpty();
		
		// 댓글 삭제
		commentDelete();
		
		// 댓글 수정
		commentModify();
		
		// 댓글 작성 
		commentWrite();
		
		$('.btnCalcel').click(function (e) {
			e.preventDefault();
			$('textarea[name=content]').val('');
		})
	});
</script>        
<main id="board">
    <section class="view">
        <table border="0">
            <caption>글 보기</caption>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" value="<%= ab.getTitle()%>" readonly/></td>
            </tr>
            <tr>
                <th>파일</th>
                <td>
                	<a href="/Farmstory1/board/proc/download.jsp?parent=<%= ab.getNo() %>"><%= ab.getOriName() %></a>&nbsp;<span><%= ab.getDownload() %>회</span> 다운로드
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" readonly><%= ab.getContent() %></textarea>
                </td>
            </tr>                    
        </table>
        
        <div>
            <a href="#" class="btn btnRemove">삭제</a>
            <a href="./modify.jsp?no=<%= no %>&group=<%= group %>&cate=<%= cate %>&pg=<%= pg %>" class="btn btnModify">수정</a>
            <a href="./list.jsp?group=<%= group %>&cate=<%= cate %>" class="btn btnList">목록</a>
        </div>

        <!-- 댓글목록 -->
        <section class="commentList">
            <h3>댓글목록</h3>                   
			
			<% for(ArticleBean comment : comments){ %>
            <article>
                <span class="nick"><%= comment.getNick() %></span>
                <span class="date"><%= comment.getRdate() %></span>
                <p class="content"><%= comment.getContent() %></p>  
                <% if(sessUser.getUid().equals(comment.getUid())){ %>                      
                <div>
                   <a href="#" class="remove" data-no="<%= comment.getNo()%>">삭제</a>
                   <a href="#" class="modify" data-no="<%= comment.getNo() %>">수정</a>
                </div>
                 <%} %>
            </article>
            <%} %>

            <p class="empty">등록된 댓글이 없습니다.</p>

        </section>

        <!-- 댓글쓰기 -->
        <section class="commentForm">
            <h3>댓글쓰기</h3>
            <form action="#">
            	<input type="hidden" name="uid" value="<%= sessUser.getUid() %>">
                <input type="hidden" name="no" value="<%= no %>">
                <textarea name="content" placeholder="댓글을 입력하세요."></textarea>
                <div>
                    <a href="#" class="btn btnCancel">취소</a>
                    <input type="submit" value="작성완료" class="btn btnComplete"/>
                </div>
            </form>
        </section>

    </section>
 </main>

<%@ include file="/_footer.jsp" %>