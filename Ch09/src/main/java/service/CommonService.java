package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommonService {
	
	// 규격화 메서드 선언
	public String requestProc(HttpServletRequest req, HttpServletResponse resp);
}
