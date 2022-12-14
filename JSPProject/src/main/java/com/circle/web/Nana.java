package com.circle.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/hi")
public class Nana extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩 방식 지정
		response.setCharacterEncoding("UTF-8");
		
		// 받는 Content Type 지정 (html 문서, UTF-8로 읽어라!)
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		// cnt를 확인하기 위해 임시 변수를 사용
		String temp_cnt = request.getParameter("cnt");
		int cnt = 10;
		
		/* http:// ... /hello?cnt=3 인 경우: temp != null
		 * http:// ... /hello?cnt= 경우: temp.equlas("")
		 */
		if(temp_cnt != null && !temp_cnt.equals("")) {
			cnt = Integer.parseInt(temp_cnt);
		}
		
		for(int i=0; i<cnt; i++) {
			out.println((i+1)+": 안녕 Hello Servlet! <br/>");
		}
		
	}
}