package kr.co.farmstory2.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.farmstory2.dao.ArticleDAO;
import kr.co.farmstory2.dao.UserDAO;
import kr.co.farmstory2.vo.ArticleVO;
import kr.co.farmstory2.vo.FileVO;
import kr.co.farmstory2.vo.PagenumVO;

public enum ArticleService {
	INSTANCE;
	private ArticleDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private ArticleService () {
		dao = new ArticleDAO();
	}
	
	// board
	/*** write ***/
	// 게시글 작성
	public int insertArticle(ArticleVO article) {
		return dao.insertArticle(article);
	}
	// 파일 등록
	public void insertFile(int parent, String newName, String fname) {
		dao.insertFile(parent, newName, fname);
	}
	/*** view ***/
	// 게시글 조회
	public ArticleVO selectArticle(String no, String cate) {
		return dao.selectArticle(no, cate);
	}
	// 게시글 조회수 +1
	public void updateArticleHit(String no) {
		dao.updateArticleHit(no);
	}
	// 파일 다운로드
	// 파일 다운로드 수 +1
	
	
	/*** delete ***/
	// 게시글 삭제
	public void deleteArticle(String no) {
		dao.deleteArticle(no);
	}
	// 파일 삭제
	
	
	/*** update ***/
	// 게시글 수정
	public void updateArticle(String title, String content, String no) {
		dao.updateArticle(title, content, no);
	}
	
	
	/*** index ***/
	// 게시글 조회
	public List<ArticleVO> selectArticles(String cate, int start) {
		return dao.selectArticles(cate, start);
	}
	public List<ArticleVO> selectArticlesByKeyword(String keyword, int start) {
		return dao.selectArticlesByKeyword(keyword, start);
	}
	// 우측 하단 tabs
	public List<ArticleVO> selectLatest(String cate) {
		return dao.selectLatest(cate);
	}
	// latest
	public List<ArticleVO> selectLatests(String cate1, String cate2, String cate3) {
		return dao.selectLatests(cate1, cate2, cate3);
	}
	/*** list ***/
	// 전체 게시글 개수
	public int selectCountTotal(String search, String cate) {
		return dao.selectCountTotal(search, cate);
	}
	
	
	/*** comment ***/
	// 댓글 작성
	public ArticleVO insertComment(ArticleVO vo) {
		return dao.insertComment(vo);
	}
	// 댓글 조회
	public List<ArticleVO> selectComments(String no) {
		return dao.selectComments(no);
	}
	// 댓글 삭제
	public int deleteComment(String no, String parent) {
		return dao.deleteComment(no, parent);
	}
	// 댓글 수정
	public int updateComment(String no, String content) {
		return dao.updateComment(no, content);
	}
	
	
	/*** page ***/
	// 마지막 페이지 번호 계산
	public int getLastPageNum(int total) {
		int lastPageNum = 0; // 마지막 페이지
		
		if(total % 10 == 0) {
			lastPageNum = (total/10);
		}else {
			lastPageNum = (total/10)+1;
		}
		return lastPageNum;
		
	}
	// 현재 페이지 기본값
	public int getCurrentPage(String pg) {
		int currentPage = 1; // 현재 페이지 기본값 
		
		if(pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		return currentPage;
	}
	// 현재 페이지 게시글 시작값 계산
	public int getLimitStart(int currentPage) {
		int limitStart = 0;
		limitStart = (currentPage-1)*10;
		return limitStart;
	}
	// 그룹 페이지 계산 
	public int[] getPageGroupNum(int currentPage, int lastPageNum) {
		int pageGroupCurrent = (int)Math.ceil(currentPage/10.0);
		int pageGroupStart = (pageGroupCurrent - 1) * 10 + 1;
		int pageGroupEnd = pageGroupCurrent * 10;
		
		if(pageGroupEnd > lastPageNum) {
			pageGroupEnd = lastPageNum;
		}
		
		int[] result = {pageGroupStart, pageGroupEnd};
		return result;
	}
	// 게시판 시작 번호 계산
	public int getPageStartNum(int total, int limitStart) {
		logger.debug("getPageStartNum...");
		int pageStartNum = 0;
		
		pageStartNum = total - limitStart;
		
		return pageStartNum;
	}
	// 게시글 번호 정렬
	public int getStartNum(int currentPage) {
		return (currentPage - 1)*10;
	}
	
	public String getSavePath(HttpServletRequest req) {
		ServletContext application = req.getServletContext();
		return application.getRealPath("/file");
	}
	
	/*** 파일 업로드***/
	public MultipartRequest uploadFile(HttpServletRequest req, String savePath) throws IOException {
		int maxSize = 1024 *1024 * 10;
		return new MultipartRequest(req, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	}
	
	public String renameFile(String fname, String uid, String savePath) {
		
		int i = fname.lastIndexOf(".");
		String ext = fname.substring(i);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newName = now+uid+ext;
		
		File f1 = new File(savePath+"/"+fname);
		File f2 = new File(savePath+"/"+newName);
		
		f1.renameTo(f2);
		
		return newName;
		
	}
}
