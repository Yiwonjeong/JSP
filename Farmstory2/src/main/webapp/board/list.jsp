<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
<main id="board">
    <section class="list">                
        <form action="#">
            <input type="text" name="search" placeholder="제목 키워드, 글쓴이 검색">
            <input type="submit" value="검색">
        </form>
        
        <table border="0">
            <caption>글 목록</caption>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>날짜</th>
                <th>조회</th>
            </tr>                    
 			<c:forEach var="article" items="${articles}">                    
            <tr>
                <td>${pageStartNum = pageStartNum - 1}</td>
                <td><a href="/Farmstory2/board/view.do?group=${group}&cate=${cate}&no=${article.no}&pg=${currentPage}">${article.title} [${article.comment}]</a></td>
                <td>${article.nick}</td>
                <td>${article.rdate.substring(2, 10)}</td>
                <td>${article.hit}</td>
            </tr>
            </c:forEach>
            <c:if test="${total eq 0}">
            <tr>
            	<td colspan="5" align="center">등록된 게시글이 없습니다.</td>
            </tr>
            </c:if>
        </table>

        <div class="page">
        	<c:if test="${pageGroupStart gt 1}">
            	<a href="/Farmstory2/board/list.do?pg=${pageGroupStart - 1}&search=${search}"" class="prev">이전</a>
            </c:if>
            <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
            	<a href="/Farmstory2/board/list.do?pg=${i}&search=${search}" class="num ${currentPage eq i?'current':'off'}">${i}</a>
            </c:forEach>
            <c:if test="${pageGroupEnd lt lastPageNum}">
            	<a href="/Farmstory2/board/list.do?pg=${pageGroupEnd + 1}&search=${search}" class="next">다음</a>
            </c:if>
        </div>

        <a href="/Farmstory2/board/write.do?group=${group}&cate=${cate}" class="btn btnWrite">글쓰기</a>
        
    </section>
</main>
</article>
    </section>
</div>
<jsp:include page="../_footer.jsp"/>