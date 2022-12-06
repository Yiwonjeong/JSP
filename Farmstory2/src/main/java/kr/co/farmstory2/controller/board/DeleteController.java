package kr.co.farmstory2.controller.board;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.service.ArticleService;

@WebServlet("/board/delete.do")
public class DeleteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("DeleteController doGet...");
		
		String cate = req.getParameter("cate");
		String group = req.getParameter("group");
		String pg = req.getParameter("pg");
		int no = Integer.parseInt(req.getParameter("no"));   // 게시물 번호
		
		Map<String, Object> map = service.deleteArticle(no); // 게시물 삭제 서비스
		int result = (int)map.get("result");
		String newName = (String)map.get("newName");
		
		if(result > 0) { // 게시물 삭제 성공
			
			if(newName != null) { // 파일이 있다면
				service.deleteFile(req, "/file", newName);
			}
			
			resp.sendRedirect(req.getContextPath() + "/board/list.do?group=" + group + "&cate=" + cate);
			return;
			
		} else { 		  
		}
		resp.sendRedirect("/Farmstory2/board/list.do?group="+group+"&cate="+cate+"&pg"+pg);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
