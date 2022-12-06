<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp"/>
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/Jboard2/js/zipcode.js"></script>
<script src="/Jboard2/js/validation.js"></script>
<script>
	$(function(){
		
		// 회원수정 버튼 클릭 
		$('.btnPassUpdate').click(function(e){
			e.preventDefault();
			
			let pass1 = $('input[name=pass1]').val();
			let pass2 = $('input[name=pass2]').val();
			
			if(pass1 == pass2){
								
				if(pass2.match(regPass)){
					
					let uid = $('#uid').val();
					
					let jsonData = {
						"uid": uid,
						"pass": pass2
					};
									
					$.ajax({
						url: '/Jboard2/user/updatePass.do',
						method: 'post',
						data: jsonData,
						dataType: 'json',
						success: function(data){
							if(data.result > 0){
								alert('비밀번호가 변경되었습니다.');
							}
						}
					});
					
				}else{
					$('.resultPass').css('color', 'red').text('영문, 숫자, 특수문자 조합 최소 5자 이상 이어야 합니다.');
				}				
			}else{
				$('.resultPass').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
			}
			
		});
		
		// 탈퇴하기 버튼 클릭
		$('.btnWithdrawal').click(function(e){
			
			
		});
		
	});
</script>
        <main id="user">
            <section class="register">
                <form action="#">
                <input type="hidden" id="uid" value="${sessUser.uid}" />
                    <table border="1">
                        <caption>회원정보 설정</caption>
                        <tr>
                            <td>아이디</td>
                            <td>${sessUser.uid}</td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td>
                                <input type="password" name="pass1" placeholder="비밀번호 입력"/>
                                <span class="resultPass"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호 확인</td>
                            <td>
                                <input type="password" name="pass2" placeholder="비밀번호 입력 확인"/>
                                <button type="button" class="btn btnPassUpdate">비밀번호 수정</button>
                            </td> 
                        </tr>
                        <tr>
                        	<td>회원가입일</td>
                        	<td>${sessUser.rdate}</td>
                        </tr>
                    </table>

                    <table border="1">
                        <caption>개인 정보 수정</caption>
                        <tr>
                            <td>이름</td>
                            <td>
                                ${sessUser.name}
                            </td>
                        </tr>
                        <tr>
                            <td>별명</td>
                            <td>
                                <p class="nickInfo">한글, 영문, 숫자 공백 없이 입력</p>
                                <input type="text" name="nick" value="${sessUser.nick}"/>
                                <button type="button" id="btnNickCheck"><img src="/Jboard2/img/chk_id.gif" alt="중복확인"></button>
                                <span class="resultNick"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td>
                                <input type="email" name="email" value="${sessUser.email}"/>
                                <span class="resultEmail"></span>
                                <button type="button" id="btnEmail"><img src="/Jboard2/img/chk_auth.gif" alt="인증번호 받기"></button>
                                <div class="auth">
                                    <input type="text" name="auth" placeholder="인증번호 입력"/>
                                    <button type="button" id="btnEmailConfirm"><img src="../img/chk_confirm.gif" alt="확인"/></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>휴대폰</td>
                            <td>
                                <input type="text" name="hp" value="${sessUser.hp}"/>
                                <span class="resultHp"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                <input type="text" name="zip" id="zip" value="${sessUser.zip}"/>
                                <button type="button"><img src="/Jboard2/img/chk_post.gif" alt="우편번호 찾기"></button>
                                <input type="text" name="addr1" value="${sessUser.addr1}"/>
                                <input type="text" name="addr2" value="${sessUser.addr2}"/>
                            </td>
                        </tr>
                        <tr>
                        	<td>회원탈퇴</td>
                        	<td>
                        		<button type="button" class="btn btnWithdrawal" style="padding: 6px; background: #ed2f2f; color:#fff;">탈퇴하기</button>
                        	</td>
                        </tr>
                    </table>
                    <div>
                        <a href="/Jboard2/user/login.do" class="btn btnCancel">취소</a>
                        <input type="submit" value="회원수정" class="btn btnUpdate"/>
                    </div>
                </form>
            </section>
        </main>
<jsp:include page="./_footer.jsp"/>