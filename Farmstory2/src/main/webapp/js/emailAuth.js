/**
 * 
 */
let preventDoubleClick = false;
let isEmailAuthOk = false;
 
 
$(function(){
	
	// 이메일 검사하기
		$('input[name=email]').focusout(function () {
			
			let email = $(this).val();
			
			if(email.match(reEmail)){
				isEmailok = true;
				$('.emailResult').text('');
			} else{
				isEmailok = false;
				$('.emailResult').css('color', 'red').text('유효하지 않는 이메일입니다.');
			}
		});
		
	// 인증번호 숫자 유효성 체크
		$('input[name=auth]').keyup(function () {
			authNumber = $(this).val();
			if(!authNumber.match(reAuth)){
				$(this).val('');
				$(this).select();
				alert('숫자만 입력해주세요.');
				return;
			} 
		});	
	
	// 이메일 인증 검사하기
		$('#btnEmailAuth').click(function () {
			email = $('input[name=email]').val();
			
			if(!email){
				alert('이메일 주소를 입력 해주세요.');
				return;
			}
			
			if(!isEmailok){
				alert('유효하지 않은 이메일입니다.');
				return;
			}
			
			if(isClick){ // 중복확인을 이미 한번 누른 상태
				alert('이미 인증번호가 전송 중입니다. \n전송완료 메시지가 나타나면 입력한 이메일을 확인 해주세요.');
				return;
			}
			
			isClick = true; // 중복확인 버튼을 눌렀으면 true;
			
			$('.auth').show();
			$('.emailResult').css('color', 'black').text('...'); // 중복 확인 클릭시 로딩 중 표시
			
			$.ajax({
				url: 'Farmstory2/user/emailAuth.do',
				method:'get',
				data: {"email":email},
				dataType:'json',
				success: function (data) {
					// console.log(data);
					if(data.status == 1){
						// 메일발송 성공
						emailCode = data.code;
						
						$('.emailResult').css("color", "black").text('인증코드를 전송했습니다.');
					} else {
						// 메일발송 실패
						$('.emailResult').css("color", "red").text('이미 사용 중인 이메일입니다.');
						isClick = false;
					}
				}
			});
		});
		
	
	
	// 이메일 인증코드 확인
	$('#btnEmailConfirm').click(function () {
		let code = $('input[name=auth]').val();
		
		if(code == emailCode){
			isEmailAuthok = true;
			$('.emailResult').css('color', 'green').text('이메일이 인증되었습니다.');
		} else {
			isEmailAuthok = false;
			$('.emailResult').css('color', 'red').text('인증번호가 일치하지 않습니다.');
		}
	});
	
});