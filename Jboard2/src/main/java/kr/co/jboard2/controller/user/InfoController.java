package kr.co.jboard2.controller.user;

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

import com.google.gson.JsonObject;

import kr.co.jboard2.service.UserService;
import kr.co.jboard2.vo.UserVO;

//회원 정보 수정 전 비밀번호 확인 컨트롤러

@WebServlet("/user/info.do")
public class InfoController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private UserService service = UserService.INSTANCE;
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("InfoController doGet");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user/info.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("InfoController doPost");
		
		String uid   = req.getParameter("uid");
		String pass = req.getParameter("pass");
		
		
		UserVO vo = service.selectUser(uid, pass);
		
		JsonObject json = new JsonObject();
		
		
		if(vo != null) {
			json.addProperty("result", 1);
			
//			HttpSession sess = req.getSession();
//			sess.setAttribute("sessUser", vo);
		}else {
			json.addProperty("result", 0);
		}
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());

	}
}
