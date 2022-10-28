<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// multipart 폼 데이터 수신  
	// MultipartRequest mr = new MultipartRequest(request, "파일저장경로", "파일최대허용량", "UTF-8", new DefaultFileRenamePolicy());
	String savePath = application.getRealPath("/file"); // 실제 경로 찾기
	int maxSize = 1024 * 1024 *10; //10MB
	MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	
	// mr로 데이터 수신
	String title = mr.getParameter("title");
	String content = mr.getParameter("content");
	String uid = mr.getParameter("uid");
	String fname = mr.getFilesystemName("fname");
	String regip = request.getRemoteAddr();
	
	//System.out.println("fname: " +fname);
	
	//int result = 0;
	
	ArticleBean article = new ArticleBean();
	article.setTitle(title);
	article.setContent(content);
	article.setUid(uid);
	article.setFname(fname);
	article.setRegip(regip);
	
	ArticleDAO dao = ArticleDAO.getInstance();
	
	// 글 등록
	int parent = dao.insertArticle(article);
	
	// 파일 첨부했으면 (파일을 첨부하지 않으면 fname: null)
	if(fname != null){
		
		// 파일명 수정 (파일이 저장된 상태)
		int i = fname.lastIndexOf("."); //확장자 앞 . 의 인덱스 구하기
		String ext = fname.substring(i); // 확장자 더하기 (ex.txt)
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_"); //날짜 서식 
		String now = sdf. format(new Date());
		String newName = now + uid + ext; //20221026160517_circle.txt
		
		File f1 = new File(savePath+"/"+fname); // 저장 경로에 있는 파일 객체 생성
		File f2 = new File(savePath+"/"+newName); // 저장 경로에 있는 파일 새로운 이름 객체 생성
		
		f1.renameTo(f2); // f1을 f2로 파일명 수정
		
		// 파일 테이블 Insert
		dao.insertFile(parent, newName, fname);
		
	}
	
	response.sendRedirect("/Jboard1/list.jsp");
%>