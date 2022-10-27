package com.circle.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/notice-reg")
public class NoticeReg extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩 방식 지정
		response.setCharacterEncoding("UTF-8");
		
		// 받는 Content Type 지정 (html 문서, UTF-8로 읽어라!)
		response.setContentType("text/html; charset=UTF-8");
		
		// 한글 깨짐 해결: 입력받는 값을 utf-8로 읽어라
		// request.setCharacterEncoding("UTF-8");
		
		
		
		PrintWriter out = response.getWriter();
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		out.println(title);
		out.println(content);
	}
}