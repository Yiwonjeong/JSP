<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<% 
	// 전송 데이터 수신
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 회원 DB에 회원이 맞는지 확인해야 함 (일단 생략)
	
	if (pw.equals("1234")){
		// 회원 맞음
		
		//클라이언트 세션 정보 (id값을 세션에 기록)
		session.setAttribute("sessid", id);
		
		// 로그인 성공 페이지
		response.sendRedirect("./loginSuccess.jsp");
		
	}else {
		// 회원 아님
		
		// 로그인 실패 다시 원래 페이지
		response.sendRedirect("../6_session.jsp");
	}
%>