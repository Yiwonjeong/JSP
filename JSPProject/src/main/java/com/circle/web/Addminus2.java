package com.circle.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

@WebServlet("/Addminus2")
public class Addminus2 extends HttpServlet {
	
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	ServletContext application = request.getServletContext();
    	
    	response.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
		String v_ = request.getParameter("v");
		String op = request.getParameter("operator");
    
    	int v = 0;
    		
    	if(!v_.equals("")) v = Integer.parseInt(v_);
    	
    	// 계산
    	if(op.equals("=")) {
    		int x = (Integer) application.getAttribute("value"); // application 값 빼내기
    		int y = v;
    		String opertator = (String) application.getAttribute("op");
    		
    		int result = 0;
    	
	    	if(opertator.equals("+")) {
	    		result = x+y;
	    	}else{
	    		result = x-y;
	    	}
	    	
	    	response.getWriter().printf("result is %d\n", result);
	    	
	    // 값 저장
    	}else {
    		
    		application.setAttribute("value", v);
    		application.setAttribute("op", op);
    	}
    	
    }

}
