package kr.co.jboard2.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.jboard2.dao.ArticleDAO;
import kr.co.jboard2.vo.ArticleVO;

public enum ArticleService {

	INSTANCE;
	private ArticleDAO dao;
	private ArticleService() {
		dao = new ArticleDAO();
	}
	
	
	//	ListController
	// 현재 페이지 번호
	public int getCurrentPage(String pg) {
		
		int currentPage = 1;
		if(pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		return currentPage;
	}
	
	// 전체 게시물 개수
	public int selectCountTotal() {
		return dao.selectCountTotal();
	}
	
	// 마지막 페이지 번호
	public int getLastPageNum(int total) {
		int lastPageNum = 0;
		if(total%10==0) {
			lastPageNum = total/10;
		}else {
			lastPageNum = total/10+1;
		}
		return lastPageNum;
	}
	
	// 페이지 그룹 start, end 번호
	public int[] getPageGroupNum(int currentPage, int lastPageNum) {
		int currentPageGroup = (int) Math.ceil(currentPage/10.0);
		int pageGroupStart = (currentPageGroup - 1) * 10 + 1;
		int pageGroupEnd = currentPageGroup * 10;
		
		if(pageGroupEnd > lastPageNum) {
			pageGroupEnd  = lastPageNum;
		}
		int[] result = {pageGroupStart, pageGroupEnd};
		return result;
	}
	
	// 페이지 시작번호
	public int getPageStartNum(int total, int currentPage) {
		int start = (currentPage - 1)*10;
		return total - start;
	}

	// 시작 인덱스
	public int getStartNum(int currentPage) {
		return (currentPage - 1)*10;
	}
	
	// 글 가져오기
	public List<ArticleVO> selectArticles(int limitStart) {
		return dao.selectArticles(limitStart);
	}
	
	
	// WriteController
	// 파일 업로드
	public MultipartRequest uploadFile(HttpServletRequest req, String path) throws IOException {
		int maxSize = 1024 * 1024 * 10;
		return new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	}
	
	// 글 등록
	public int insertArticle(ArticleVO article) {
		return dao.insertArticle(article);
	}
	
	// 파일명 수정
	public String renameFile(String fname, String uid, String path) {
		int i = fname.lastIndexOf(".");
		String ext = fname.substring(i);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newName = now+uid+ext; //20221127_circle.txt
		
		File f1 = new File(path+"/"+fname);
		File f2 = new File(path+"/"+newName);
		
		f1.renameTo(f2);
		
		return newName;
	}

	// 파일 테이블 insert
	public void insertFile(int parent, String newName, String fname) {
		dao.insertFile(parent, newName, fname);
	}
	
	
	
	
}
