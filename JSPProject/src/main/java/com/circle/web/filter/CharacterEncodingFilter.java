package com.circle.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")

public class CharacterEncodingFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// 한글 깨짐 해결: 입력받는 값을 utf-8로 읽어라
		request.setCharacterEncoding("UTF-8");
		
		// NoticeReg로 흐름을 넘기고 받음
		chain.doFilter(request, response);

	}

}
