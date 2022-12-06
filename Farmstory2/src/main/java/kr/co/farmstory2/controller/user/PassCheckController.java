package kr.co.farmstory2.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.service.UserService;
import kr.co.farmstory2.vo.UserVO;

@WebServlet("/user/passCheck.do")
public class PassCheckController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private UserService service = UserService.INSTANCE;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("PassCheckController doGet...");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user/login.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("PassCheckController doPost...");
		
		String uid = req.getParameter("uid");
		String pass = req.getParameter("pass");
		
		UserVO vo = service.selectUser(uid, pass);
		
		if(vo != null) {
			// 회원이 맞을 경우 
			HttpSession session = req.getSession();
			session.setAttribute("sessUser", vo);
			System.out.println("LoginController - 로그인 성공");
		}else {
			resp.setContentType("text/html;charset=UTF-8"); 
            PrintWriter out = resp.getWriter(); 
            out.println("<script>"); 
            out.println("alert('The ID or password you entered is incorrect.');"); 
            out.println("history.back();"); 
            out.println("</script>"); 
            out.close();
			resp.sendRedirect("/Farmstory2/user/passCheck.do");
		}
	}
}
