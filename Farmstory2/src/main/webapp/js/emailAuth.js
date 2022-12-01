/**
 * 
 */
 // 데이터 검증에 사용하는 정규표현식
let reAuth = /^[0-9]+$/;
let reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

let emailCode = -9999999999;    // 이메일 인증번호
let preventDoubleClick = false; // 인증번호 받기 버튼 중복 입력 체크
let isEmailok = false;          // 이메일 유효성 체크 변수
let isEmailAuthok = false;      // 이메일 인증번호 체크 변수
 
let name;
let uid;
 
$(function(){
	
	// 이메일 검사하기
		$('input[name=email]').focusout(function () {
			
			let email = $(this).val();
			
			console.log('here1 : ' + email);
			
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
	
	// 이메일 인증번호 받기 클릭 
		$('#btnEmailAuth').click(function () {
			email = $('input[name=email]').val();
			name = $('input[name=name]').val();
			uid = $('input[name=uid').val();
			
			console.log('here1 email: '+email);
			
			if(!email){
				alert('이메일 주소를 입력하십시오.');
				return;
			}
			
			if(!isEmailok){
				alert('유효하지 않은 이메일입니다.');
				return;
			}
			console.log('here2');
			
			if(preventDoubleClick){ // 중복확인을 이미 한번 누른 상태
				alert('이미 인증번호가 전송 중입니다.');
				return;
			}
			
			preventDoubleClick = true; // 중복확인 버튼을 눌렀으면 true;
			console.log('here3');
			$('.auth').show();
			$('.emailResult').css('color', 'black').text('...'); // 중복 확인 클릭시 로딩 중 표시
			
			console.log('here4');
			$('.emailResult').css("color", "black").text('인증코드를 전송 중입니다...');
			
			if(!uid){
			Check_Name_Email();
			} else if(!name){
			Check_Uid_Email();
			}
			
		
		});
		
	// 이름, 이메일 -> 아이디 찾기
	function Check_Name_Email(){
		email = $('input[name=email]').val();
		name = $('input[name=name]').val();
		
		let jsonData = {
		"name":name,
		"email":email
		}
		
		$.ajax({
			url: '/Farmstory2/user/emailAuth.do',
			method:'get',
			data: {"email":email},
			dataType:'json',
			success: function (data) {
				console.log('here5 : ' + data.status);
				if(data.status == 1){
					emailCode = data.code;
					console.log("***메일 발송 성공***");
					console.log('code: '+emailCode);
					$('#btnEmailAuth').hide();
					$('.emailResult').css("color", "black").text('이메일 확인 후 인증 코드를 입력하십시오.');
					$('.auth').show();
				} else {
					$('.emailResult').css("color", "red").text('인증코드 전송에 실패하였습니다.');
					isClick = false;
					console.log("***메일 발송 실패***");
				}
			}
		});
	};
	
	// 아이디, 이메일 -> 패스워드 찾기
	function Check_Uid_Email(){
		email = $('input[name=email]').val();
		uid = $('input[name=uid]').val();
		
		let jsonData = {
		"uid":uid,
		"email":email
		}
		
		$.ajax({
			url: '/Farmstory2/user/emailAuth.do',
			method:'get',
			data: {"email":email},
			dataType:'json',
			success: function (data) {
				console.log('here5 : ' + data.status);
				if(data.status == 1){
					emailCode = data.code;
					console.log("***메일 발송 성공***");
					console.log('code: '+emailCode);
					$('#btnEmailAuth').hide();
					$('.emailResult').css("color", "black").text('이메일 확인 후 인증 코드를 입력하십시오.');
					$('.auth').show();
				} else {
					$('.emailResult').css("color", "red").text('인증코드 전송에 실패하였습니다.');
					isClick = false;
					console.log("***메일 발송 실패***");
				}
			}
		});
	};
	
	// 이메일 인증코드 확인
	$('#btnEmailConfirm').click(function () {
		let code = $('input[name=auth]').val();
		
		if(code == emailCode){
			isEmailAuthok = true;
			$('input[name=email]').attr('readonly', true);
			$('.emailResult').css('color', 'green').text('이메일이 인증되었습니다.');
			$('.auth').hide();
		} else {
			isEmailAuthok = false;
			$('.emailResult').css('color', 'red').text('인증번호가 일치하지 않습니다.');
		}
	});
	
	
	
});