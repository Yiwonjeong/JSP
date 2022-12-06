<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>

<<script>
	$(function(){
		$('.btnNext').click(function(e){
			e.preventDefault();
			
			let pass = $('input[name=pass]').val();
			let uid = = $('#uid').text();
			
			console.log("uid : " + uid);
			console.log("pass: " + pass);
			
		});
	});
</script>
<main id="user">
        <section class="check passCheck">
        
            <form action="/Farmstory2/user/passCheck.do" method="post">
                <table border="0">
                    <caption>비밀번호 확인</caption>
                    <tr>
                    <td>아이디</td>
                    <td id="uid">${vo.uid}</td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td>
                    	<input type="password" name="pass" placeholder=" 비밀번호 입력"/>
                    	<span class="passResult"></span>
                    </td>
                </tr>
                </table>
            </form>

            <div>
                <a href="/Farmstory2/index.do" class="btn btnCancel">취소</a>
                <a href="/Farmstory2/user/myPage.do" class="btn btnNext">다음</a>
            </div>
        </section>
    </main>
<jsp:include page="../_footer.jsp"/>