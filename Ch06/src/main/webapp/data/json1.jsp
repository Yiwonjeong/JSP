<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// JSON을 JAVA로 생성 (원시적 방법) JSON 문자열 -> / escape 처리
	String jsonData = "{\"uid\":\"a101\", \"name\":\"홍길동\", \"hp\":\"010-1234-1001\", \"age\":23}";
	// JSON 출력
	out.print(jsonData);

%>