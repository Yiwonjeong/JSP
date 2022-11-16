<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="kr.co.farmstory1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//multipart 폼 데이터 수신 (라이브러리 - Maven - cos)
	String savePath = application.getRealPath("/file");
	int maxSize = 1024 * 1024 * 10;
	MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	
	String group = mr.getParameter("group");
	String cate = mr.getParameter("cate");
	String uid = mr.getParameter("uid");
	String title = mr.getParameter("title");
	String content = mr.getParameter("content");
	String fname = mr.getFilesystemName("fname");
	String regip = request.getRemoteAddr(); 
	
	ArticleBean ab = new ArticleBean();
	ab.setCate(cate);
	ab.setTitle(title);
	ab.setContent(content);
	ab.setUid(uid);
	ab.setFname(fname);
	ab.setRegip(regip); 
	
	ArticleDAO dao = ArticleDAO.getInstance();
	
	// 글 등록
	int parent = dao.insertArticle(ab);
	
	
	//파일 첨부 시
	if(fname != null){
		
		// 파일명 수정
		int i = fname.lastIndexOf("."); // 수업내용.txt에서 확장자 앞의 .의 인덱스 번호
		String ext = fname.substring(i); // .txt를 문자열로 저장
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_"); 
		String now = sdf.format(new Date()); // new Date()로 오늘 날짜의 객체를 생성후 포맷 형식에 맞춰서 문자열로 저장
		String newName = now + uid + ext; // 20221026100417_circle.txt
	
		File f1 = new File(savePath, fname); // file 디렉터리안에 존재하는 객체
		File f2 = new File(savePath, newName); // 가상의 파일 객체
		
		f1.renameTo(f2); // f1의 파일 이름을 f2의 가상객체의 파일이름으로 변경
		
		// 파일 테이블 Insert
		dao.insertFile(parent, newName, fname);
			
	}
	
	response.sendRedirect("/Farmstory1/board/list.jsp?group="+group+"&cate="+cate);
%>