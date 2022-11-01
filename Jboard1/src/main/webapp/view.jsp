<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");
	String pg = request.getParameter("pg");
	
	ArticleDAO dao = ArticleDAO.getInstance();
	
	// 조회수 +1
	dao.updateArticleHit(no);
	
	// 글 가져오기
	ArticleBean article = dao.selectArticle(no);
	
	// 댓글 가져오기
	List<ArticleBean> comments = dao.selectComments(no);
	
	
%>
<%@ include file="_header.jsp" %>
<script>

	$(document).ready(function(){
		
		// 댓글 수정
		$(document).on('click', '.modify', function(e){
			
			e.preventDefault();
			
			let txt = $(this).text();
			let p_tag = $(this).parent().prev();
			
			if(txt == '수정'){
				// 수정모드
				$(this).text('수정완료');
				p_tag.attr('contentEditable', true); 
				p_tag.focus();
			}else{
				// 수정완료
				let no = $(this).attr('data-no');
				let content = p_tag.text();
				
				let jsonData = {
						"no": no,
						"content": content
				};
				
				console.log(jsonData);
				
				
				$.ajax({
					url: '/Jboard1/proc/commentModifyProc.jsp',
					type: 'POST',
					data: jsonData,
					dataType: 'json',
					success: function(data){
						
						if(data.result == 1){
							alert('댓글이 수정되었습니다.');
							$(this).text('수정');
							p_tag.attr('contentEditable', false); 
						}
					}
				});
				
			}
			
			
		});
		
		
		
		// 댓글 작성
		$('.commentForm > form').submit(function(){
			
			let no 		= $(this).children('input[name=no]').val(); //this: form, children: input들	
			let uid 	= $(this).children('input[name=uid]').val();
			let textarea =  $(this).children('textarea[name=content]');
			let content =  textarea.val();
			
			if(content == ''){
				alert('댓글을 작성하세요.');
				return false;
			}
			
			let jsonData = {
					"no":no,
					"uid":uid,
					"content":content
			}
			
			$.ajax({
				url:'/Jboard1/proc/commentWriteProc.jsp',
				method:'POST',
				data: jsonData,
				dataType:'json',
				success:function(data){
					console.log(data);
					
					if(data.result > 0){
						
						let article = "<article>";
						article += "<span class='nick'>"+data.nick+"</span>";
						article += "<span class='date'>"+data.date+"</span>";
						article += "<p class='content'>"+data.content+"</p>";
						article += "<div>";
						article += "<a href='#' class='remove'>삭제</a>";
						article += "<a href='#' class='modify'>수정</a>";
						article += "</div>";
						article += "</article>";
					
					$('.commentList > empty').hide();
					$('.commentList').append(article);
					textarea.val('');
						
					}
				}
			});
			
			return false;
		});
		
		
	});
</script>
<main id="board">
    <section class="view">
        <table border="0">
            <caption>글 보기</caption>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" readonly value="<%= article.getTitle() %>"/></td>
            </tr>
            <% if (article.getFile() > 0) { %>
            <tr>
                <th>첨부파일</th>
                <td>
                    <a href="/Jboard1/proc/download.jsp?parent=<%= article.getNo() %>"><%= article.getOriName() %></a>&nbsp;<span>(<%= article.getDownload() %>회</span> 다운로드)
                </td>
            </tr>
            <% } %>
            <tr>
                <th>내용</th>
                <td>
                   <textarea name="content" readonly><%= article.getContent() %></textarea>
              		</td>
            </tr>
            
        </table>
        <div>
            <a href="#" class="btn btnRemove">삭제</a>
            <a href="/Jboard1/modify.jsp" class="btn btnModify">수정</a>
            <a href="/Jboard1/list.jsp?pg=<%= pg %>" class="btn btnList">목록</a>
        </div>

        <!-- 댓글 목록 -->
        <section class="commentList">
            <h3>댓글목록</h3>                   
			
			<% for(ArticleBean comment : comments){ %>
            <article>
                <span class="nick"><%= comment.getNick() %></span>
                <span class="date"><%= comment.getRdate().substring(2, 10) %></span>
                <p class="content"><%= comment.getContent() %></p>                        
                <div>
                    <a href="#" class="remove" data-no="<%= comment.getNo() %>">삭제</a>
                    <a href="#" class="modify" data-no="<%= comment.getNo() %>">수정</a>
                </div>
            </article>
			<% } %>
			
			<% if(comments.size() == 0){ %>
            <p class="empty">등록된 댓글이 없습니다.</p>
			<% } %>
        </section>

        <!-- 댓글 쓰기 -->
        <section class="commentForm">
            <h3>댓글쓰기</h3>
            <form action="#" method="post">
            	<input type="hidden" name="uid" value="<%= ub.getUid() %>">
            	<input type="hidden" name="no" value="<%= no %>">
                <textarea name="content" placeholder="댓글을 입력하세요."></textarea>
                <div>
                    <a href="#" class="btn btnCalcel">취소</a>
                    <input type="submit" value="작성완료"  class="btn btnComplete">
                </div>
            </form>

        </section>
    </section>
 <%@ include file="_footer.jsp" %>