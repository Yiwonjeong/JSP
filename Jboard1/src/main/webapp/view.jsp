<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
        <main id="viewboard">
            <section class="view">
                <caption>글 보기</caption>
                <table border="0">
                    <tr>
                        <td>제목</td>
                        <td><input type="text" name="title" value="제목입니다" readonly></td>
                    </tr>
                    <tr>
                        <td>첨부파일</td>
                        <td>
                            <a href="#">2022 상반기 매출자료.xls</a>
                            <span>7회 다운로드</span>
                        </td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td><textarea name="content">내용 샘플입니다.</textarea></td>
                    </tr>
                </table>
                <div>
                    <a href="#" class="btn btnDelete">삭제</a>
                    <a href="/Jboard1/modify.jsp" class="btn btnModify">수정</a>
                    <a href="/Jboard1/list.jsp" class="btn btnList">목록</a>
                </div>
            </section>

            <!-- 댓글 목록 -->
            <section class="commentList">
                <h3>댓글 목록</h3>
                <article class="comment">
                    <span>
                        <span>길동이</span>
                        <span>20-05-13</span>
                    </span>
                    <textarea name="comment" readonly>댓글 샘플입니다.</textarea>
                    <div>
                        <a href="#">삭제</a>
                        <a href="#">수정</a>
                    </div>
                </article>
                <p class="empty">등록된 댓글이 없습니다.</p>
            </section>

            <!-- 댓글 쓰기  -->
            <section class="commentForm">
                <h3>댓글 쓰기</h3>
                <form action="#">
                    <textarea name="comment"></textarea>
                    <div>
                        <a href="#" class="btn btnCancel">취소</a>
                        <input type="submit" class="btn btnWrite" value="작성완료">
                    </div>
                </form>

            </section>

        </main>
<%@ include file="./_footer.jsp" %>