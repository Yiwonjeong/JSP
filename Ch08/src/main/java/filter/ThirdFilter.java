package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class ThirdFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		System.out.println("ThirdFilter...");
		
		// 전송 데이터 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// 다음 필터를 호출
		chain.doFilter(request, response);

	}
}
