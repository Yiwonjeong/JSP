package kr.co.farmstory2.controller.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;

import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.vo.ArticleVO;


@WebServlet("/board/write.do")
public class WriteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cate = req.getParameter("cate");
		String group = req.getParameter("group");
		
		req.setAttribute("cate", cate);
		req.setAttribute("group", group);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/write.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("insertArticle...");
		String savePath = service.getSavePath(req);
		MultipartRequest mr = service.uploadFile(req, savePath);
		
		String uid = mr.getParameter("uid");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		String fname = mr.getFilesystemName("fname");
		String regip = req.getRemoteAddr();
		String group = mr.getParameter("group");
		String cate = mr.getParameter("cate");
		
		ArticleVO vo = new ArticleVO();
		vo.setCate(cate);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setUid(uid);
		vo.setFname(fname);
		vo.setRegip(regip);
		
		logger.info("fname: "+fname);
		
		int parent = service.insertArticle(vo);
		
		/*** 파일 첨부 ***/
		if(fname != null) {
			// 파일명 수정
			String newName = service.renameFile(fname, uid, savePath);
			
			logger.info("WriteController...insertFile...");
			service.insertFile(parent, newName, fname);	//파일 테이블 Insert
		}
		
	
		
		resp.sendRedirect("/Farmstory2/board/list.do?group="+group+"&cate="+cate);
	}
}
