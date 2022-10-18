<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
        <main id="board">
            <section class="write">
                   <table border="0">
                    <caption>글 쓰기</caption>
                    <tr>
                        <td>제목</td>
                        <td><input type="text" class="title" placeholder="제목을 입력하세요."></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td><textarea name="content"></textarea></td>
                    </tr>
                    <tr>
                        <td>첨부</td>
                        <td>
                            <input type="file" value="파일 선택">
                        </td>
                    </tr>
                     </table>
                    <div>
                        <a href="/Jboard1/list.jsp" class="btn btnCancel">취소</a>
                        <input type="submit" class="btn btnWrite" value="작성완료"> 
                    </div> 
 
            </section>
        </main>
<%@ include file="./_footer.jsp" %>