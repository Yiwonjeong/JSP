<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
<script src="/Farmstory2/js/zipcode.js"></script>
<script src="/Farmstory2/js/validation.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- 우편번호 찾기 오픈 API -->
<main id="user">
    <section class="register">

        <form action="/Farmstory2/user/myPage.do" method="post">
            <table border="1">
                <caption>사이트 이용정보 입력</caption>
                <tr>
                    <td>아이디</td>  <!-- 변경X -->
                    <td></td>
                </tr>
                <tr>
                    <td>새 비밀번호</td>
                    <td>
                        <input type="password" name="pass1" placeholder="새 비밀번호 입력"/>
                        <span class="passResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>새 비밀번호 확인</td>
                    <td>
                        <input type="password" name="pass2" placeholder="새 비밀번호 입력"/>
                    </td>
                </tr>
            </table>

            <table border="1">
                <caption>개인정보 입력</caption>
                <tr>
                    <td>이름</td>	<!-- 변경X -->
                    <td>
                        <input type="text" name="name" placeholder="이름 입력"/>  
                        <span class="nameResult"></span>                      
                    </td>
                </tr>
                <tr>
                    <td>별명</td>
                    <td>
                        <p class="nickInfo">공백없는 한글, 영문, 숫자 입력</p>
                        <input type="text" name="nick" placeholder="별명 입력"/>
                        <button type="button" id="btnNickCheck"><img src="/Farmstory2/img/chk_id.gif" alt="중복확인"/></button>
                        <span class="nickResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        <input type="email" name="email" placeholder="이메일 입력"/>
                        <button type="button" id="btnEmailAuth"><img src="/Farmstory2/img/chk_auth.gif" alt="인증번호 받기"/></button>
                        <div class="auth">
                            <input type="text" name="auth" placeholder="인증번호 입력"/>
                            <button type="button" id="btnEmailConfirm"><img src="/Farmstory2/img/chk_confirm.gif" alt="확인"/></button>
                       		<br/><span class="emailResult"></span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td>
                    	<input type="text" name="hp" placeholder="휴대폰 입력"/>
                    	<span class="hpResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <input type="text" name="zip" id="zip" placeholder="우편번호"/>
                        <button type="button" onclick="zipcode()"><img src="/Farmstory2/img/chk_post.gif" alt="우편번호찾기"/></button>
                        <input type="text" name="addr1" id="addr1" placeholder="주소 검색"/>
                        <input type="text" name="addr2" id="addr2" placeholder="상세주소 입력"/>
                    </td>
                </tr>
            </table>

            <div>
                <a href="/Farmstory2/user/login.do" class="btn btnCancel">취소</a>
                <input type="submit" value="회원정보 변경" class="btn btnUpdate"/>
            </div>

        </form>

    </section>
</main>
<jsp:include page="../_footer.jsp"/>