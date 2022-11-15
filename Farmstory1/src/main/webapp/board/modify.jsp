<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글 수정</title>
    <link rel="stylesheet" href="./css/style.css">

</head>
<body>
    <div id="wrapper">
        <header>
            <h3>Board System v1.0</h3>
            <p>
                <span>홍길동</span>님 반갑습니다. 
                <a href="./user/login.jsp">[로그아웃]</a>
            </p>
        </header>
        
        <main id="board">
            <section class="modify">
                <table border="0">
                    <caption>글 수정</caption>
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
                    <a href="./view.jsp" class="btn btnCancel">취소</a>
                    <input type="submit" class="btn btnModify" value="수정완료"> 
                </div>
                
            </section>
        </main>

        <footer>
           <p>ⓒCopyright by circle.or.kr</p> 
        </footer>
    </div>    
</body>
</html>