package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FirstFilter implements Filter{
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		System.out.println("FirstFilter...");
		
		// 다음 필터를 호출, 다음 필터가 없으면 최종 자원을 요청 (화면이 안 나올 때 솔루션)
		chain.doFilter(request, response);
	}
}
