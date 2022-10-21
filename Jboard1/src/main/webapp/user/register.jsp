<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>

<script src="/Jboard1/js/validation.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/Jboard1/js/zipcode.js"></script>


<section id="user" class="register">
    <form action="/Jboard1/user/proc/registerProc.jsp" method="POST">
        <table border="0">
            <caption>사이트 이용정보 입력</caption>
            <tr>
                <td>아이디</td>
                <td>
                    <input type="text" name="uid" placeholder="아이디 입력"/>
                    <button type="button" id="btnIdCheck"><img src="/Jboard1/img/chk_id.gif" alt="중복확인"></button>
                    <span class="uidResult"></span>
                </td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td>
                    <input type="password" name="pass1" placeholder="비밀번호 입력"/>                            
                </td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td>
                    <input type="password" name="pass2" placeholder="비밀번호 확인 입력"/>
                    <span class="passResult"></span>
                </td>
            </tr>
        </table>
        <table border="0">
            <caption>개인정보 입력</caption>
            <tr>
                <td>이름</td>
                <td>
                    <input type="text" name="name" placeholder="이름 입력"/> 
                    <span class="nameResult"></span>                      
                </td>
            </tr>
            <tr>
                <td>별명</td>
                <td>
                    <p>공백없이 한글, 영문만 입력가능</p>
                    <input type="text" name="nick" placeholder="별명 입력"/>
                    <button type="button" id="btnNickCheck"><img src="/Jboard1/img/chk_id.gif" alt="중복확인"></button>
                    <span class="nickResult"></span>                            
                </td>
            </tr>
            <tr>
                <td>E-Mail</td>
                <td>
                    <input type="email" name="email" placeholder="이메일 입력"/>
                    <span class="emailResult"></span>
                </td>
            </tr>
            <tr>
                <td>휴대폰</td>
                <td>
                    <input type="text" name="hp" placeholder="- 포함 13자리 입력" minlength="13" maxlength="13" />
                	<span class="hpResult"></span>
                </td>
            </tr>
            <tr>
                <td>주소</td>
                <td>
                    <div>
                        <input type="text" name="zip" id="zip" placeholder="우편번호" readonly="readonly"/>                                
                        <button type="button" onclick="zipcode()" class="btnZip"><img src="/Jboard1/img/chk_post.gif" alt=""></button>
                    </div>                            
                    <div>
                        <input type="text" name="addr1" id="addr1" placeholder="주소를 검색하세요." readonly/>
                    </div>
                    <div>
                        <input type="text" name="addr2" id="addr2" placeholder="상세주소를 입력하세요."/>
                    </div>
                </td>
            </tr>
        </table>

        <div>
            <a href="/Jboard1/user/login.jsp" class="btn btnCancel">취소</a>
            <input type="submit"   class="btn btnRegister" value="회원가입"/>
        </div>

    </form>
</section>

 <%@ include file="./_footer.jsp" %> 