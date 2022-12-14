package kr.co.farmstory2.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	// 파일 다운로드 클릭
	public FileVO selectFile(int no) {
		return dao.selectFile(no);
	}
	// 파일 다운로드
	public void downloadFile(HttpServletRequest req, HttpServletResponse resp, String directory, String newName, String oriName) {
		logger.info("FileDownload...");
		
		// response 객체로 파일 스트림 작업
		String savePath = req.getServletContext().getRealPath(directory);
		
		try {
			// 파일 다운로드를 위한 response 헤더 수정
			resp.reset();
			resp.setContentType("application/octet-stream");
			resp.setHeader("content-Disposition", "attacment; filename=\"" + URLEncoder.encode(oriName, "utf-8") + "\"");
			
			// response 객체로 파일 스트림 작업
			File file = new File(savePath, newName);
			
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());
			
			while(true){
				
				int data = bis.read();
				
				if(data == -1){
					break;
				}
				bos.write(data);
			}
			
			bos.flush();
			bos.close();
			bis.close();
			
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
	}
	// 파일 다운로드 +1
	public void plusDownload(int no) {
		dao.plusDownload(no);
	}
	
	/*** delete ***/
	// 게시글 삭제
//	public void deleteArticle(String no) {
//		dao.deleteArticle(no);
//	}
	/*** 조건에 해당하는 게시판 및 관련 파일, 댓글을 삭제하는 서비스 ***/
	public Map<String, Object> deleteArticle(int no) {
		return dao.deleteArticle(no);
	}
	
	// 파일 삭제
	public void deleteFile(HttpServletRequest req, String directory, String newName) {
		logger.info("deleteFile...");
		String sDirectory = req.getServletContext().getRealPath(directory);
		File file = new File(sDirectory, newName);
		if(file.exists()) file.delete();
	}
	
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
	

	
	/*** 파일 첨부 ***/
	public String getSavePath(HttpServletRequest req) {
		ServletContext application = req.getServletContext();
		return application.getRealPath("/file");
	}
	
	/*** 파일 업로드***/
	public MultipartRequest uploadFile(HttpServletRequest req, String savePath) throws IOException {
		int maxSize = 1024 * 1024 * 10; //10MB
		return new MultipartRequest(req, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	}
	
	/*** 파일명 수정 ***/
	public String renameFile(String fname, String uid, String savePath) {
		
		int i = fname.lastIndexOf(".");		//.txt 의 인덱스 번호 가져오기 
		String ext = fname.substring(i);	//.txt를 문자열로 저장
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newName = now+uid+ext;
		
		File f1 = new File(savePath+"/"+fname);		// file 디렉터리안에 존재하는 객체
		File f2 = new File(savePath+"/"+newName);	// 가상의 파일 객체
		
		f1.renameTo(f2);
		
		return newName;
		
	}
}
