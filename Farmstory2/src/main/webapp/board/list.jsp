<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
<script>
	$(function(){
		$(document).on('click', '#btnSearch', function(e){
			e.preventDefault();
			
			let searchType = $('select[name=searchType]').val();
			let search = $('input[name=search]').val();
			
			console.log("searchType: "+searchType);
			console.log("search: "+search);
			
			// '검색' 버튼을 눌렀을 때 기존 게시글은 사라진다.
			$('#articleList > td').hide();
			
			// 방법 1:contains() 필터를 활용하여 검색어(search)를 포함하는 화면만 나타나게 한다.
			// 한 페이지 내에서만 검색이 가능해서 불가능.
			//if(search != ""){
			// let temp = $("#articleList > td:contains('" + search + "')");	
			//$(temp).parent().show();
			// console.log("temp: "+temp);
			//}else{}
			
			// 방법 2: apple 검색 시: 보내는 주소에 searchType=title&search=apple 추가
			// let url = "/Farmstory2/board/list.do"
			// url = url + "?searchType=" + $('select[name=searchType]').val();
			// url = url + "&search=" + $('input[name=search]').val();
			// location.href = url;
			// console.log(url);
		});
		
		
		
		
	});
</script>
<main id="board">
    <section class="list">                
        <form action="#">
            <input type="hidden" name="group" value="${group}">
            <input type="hidden" name="cate" value="${cate}">
   	            <select name="searchType">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="nick">글쓴이</option>
				</select>
                   <input type="text" name="search" placeholder="제목 키워드, 글쓴이 검색">
                   <!-- <input type="submit" value="검색" class="btn btnSearch" id="btnSearch">  -->
                   <button type="button" class="btn btnSearch" id="btnSearch">검색</button>
        </form>
        
        <table border="0" >
            <caption>글 목록</caption>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>날짜</th>
                <th>조회</th>
            </tr>                 
            <c:forEach var="article" items="${articles}">    
            <tr id="articleList">
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