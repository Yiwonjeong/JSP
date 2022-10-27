package com.circle.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

@WebServlet("/Add2")
public class Add2 extends HttpServlet {
	
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	response.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
//    	여러 개의 파라미터를 배열로 받음: getParameterValues
		String [] num_ = request.getParameterValues("num");
    
    	int x = 0;
    	int y = 0;
    	int result = 0;
    	
//    	반복문 사용 
    	for(int i=0; i<num_.length; i++) {
    		int num = Integer.parseInt(num_[i]);
    		result += num; // int로 바뀐 숫자를 result에 누적 (덧셈)
    	}
    	

    	response.getWriter().printf("result is %d\n", result);
    	
    }

	
}
