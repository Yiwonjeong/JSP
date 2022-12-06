<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
<main id="board">
    <section class="write">
        <form action="/Farmstory2/board/write.do" method="post" enctype="multipart/form-data">
        <input type="hidden" name="uid" value="${sessUser.uid}"/>
        <input type="hidden" name="group" value="${group}"/>
        <input type="hidden" name="cate" value="${cate}"/>
            <table border="0">
                <caption>글 쓰기</caption>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                    	<textarea name="content" placeholder="내용을 입력하세요."></textarea>
                    </td>
                </tr>
                <tr>
                    <th>파일</th>
                    <td>
                        <input type="file" name="fname"/>
                    </td>
                </tr>
            </table>
            
            <div>
                <a href="/Farmstory2/board/list.do?group=${group}&cate=${cate}" class="btn btnCancel">취소</a>
                <input type="submit" value="작성완료" class="btn btnComplete"/>
            </div>
        </form>

    </section>
</main>
</article>
    </section>
</div>
<jsp:include page="../_footer.jsp"/>