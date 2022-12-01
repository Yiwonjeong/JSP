package kr.co.farmstory2.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.service.UserService;
import kr.co.farmstory2.vo.UserVO;


@WebServlet("/user/login.do")
public class LoginController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private UserService service = UserService.INSTANCE;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		logger.info("LoginController doGet...");
		
		String success = req.getParameter("success");
		req.setAttribute("success", success);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user/login.jsp");
		dispatcher.forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		logger.info("LoginController doPost...");
		
		String uid = req.getParameter("uid");
		String pass = req.getParameter("pass");
		String auto = req.getParameter("auto");
		
		UserVO vo = service.selectUser(uid, pass);
		
		if(vo != null) {
			// 회원이 맞을 경우 
			HttpSession session = req.getSession();
			session.setAttribute("sessUser", vo);
			System.out.println("LoginController - 로그인 성공");
			
			// 아이디 기억하기 체크 시
			if(auto != null) {
				String sessId = session.getId();
				
				// 쿠키 생성
				// cookie(생성자)를 만들어 name:sessID, value:sessId 데이터 넣기
				Cookie cookie = new Cookie("SESSID", sessId);
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24*3); // 3일 저장
				resp.addCookie(cookie); // 쿠키 'cookie'를 담아 응답
				
				
				// sessId 데이터베이스 저장
				service.updateUserForSession(uid, sessId);
			}
			resp.sendRedirect("/Farmstory2/index.do");
		}else {
			//회원이 아닐 경우
			System.out.println("LoginController - 로그인 실패");
			resp.setContentType("text/html;charset=UTF-8"); 
            PrintWriter out = resp.getWriter(); 
            out.println("<script>"); 
            out.println("alert('The ID or password you entered is incorrect.');"); 
            out.println("history.back();"); 
            out.println("</script>"); 
            out.close();
			resp.sendRedirect("/Farmstory2/user/login.do?success=100");
		}
	}
}
