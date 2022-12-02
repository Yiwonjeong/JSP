package kr.co.farmstory2.db;

public class Sql {
	// user
	/*** register ***/
	// 약관 동의
	public static final String SELECT_TERMS = "SELECT * FROM `board_terms`";
	// 아이디 중복 확인
	public static final String SELECT_COUNT_UID = "SELECT COUNT(`uid`) FROM `board_user` WHERE `uid`=?";
	// 닉네임 중복 확인
	public static final String SELECT_COUNT_NICK = "SELECT COUNT(`nick`) FROM `board_user` WHERE `nick`=?";
	// 이메일
	public static final String CHECK_EMAIL = "SELECT * FROM `board_user` WHERE `email` = ?";
	// 회원가입
	public static final String INSERT_USER = "INSERT INTO `board_user` SET "
								            + " `uid`=?, "
								            + " `pass`=SHA2(?, 256), "
								            + " `name`=?, "
								            + " `nick`=?, "
								            + " `email`=?, "
								            + " `hp`=?, "
								            + " `zip`=?, "
								            + " `addr1`=?, "
								            + " `addr2`=?, "
								            + " `regip`=?, "
								            + " `rdate`=NOW() ";
		
	/*** login ***/
	// 아이디 패스워드 확인
	public static final String SELECT_USER = "SELECT * FROM `board_user` WHERE `uid`= ? and `pass`= SHA2(?, 256)";
	// 자동 로그인 
	public static final String SELECT_USER_BY_SESSID = "SELECT * FROM `board_user` WHERE `sessId`=? AND `sessLimitDate` > NOW()";
	// 자동 로그인 세션 만료 연장
	public static final String UPDATE_USER_FOR_SESS_LIMIT_DATE = "UPDATE `board_user` SET `sessLimitDate` = DATE_ADD(NOW(), INTERVAL 3 DAY) WHERE `sessId`=?";
	// 자동 로그인 sessID DB 저장
	public static final String UPDATE_USER_FOR_SESSION = "UPDATE `board_user` SET `sessId`=?, `sessLimitDate` = DATE_ADD(NOW(), INTERVAL 3 DAY) WHERE `uid`=?";
	
	/*** 아이디 찾기 ***/
	public static final String SELECT_USER_FOR_FIND_ID = "SELECT * FROM `board_user` WHERE `name`= ? and `email` = ?";
	
	/*** 비밀번호 찾기 ***/
	public static final String SELECT_USER_FOR_FIND_PW = "SELECT * FROM `board_user` WHERE `uid`= ? and `email` = ?";
	
	/*** 비밀번호 변경 ***/
	public static final String UPDATE_USER_PW = "UPDATE `board_user` SET `pass`=SHA2(?, 256) WHERE `uid`=?";
	
	/*** logout ***/
	public static final String UPDATE_USER_FOR_SESSION_OUT = "UPDATE `board_user` SET `sessId`=NULL, `sessLimitDate`=NULL WHERE `uid`=?";
		
		
	// board
	/*** write ***/
	// 게시글 작성
	public static final String INSERT_ARTICLE = "insert into `board_article` set"
												+ "`cate`=?,"
												+ "`title`=?,"
												+ "`content`=?,"
												+ "`file`=?,"
												+ "`uid`=?,"
												+ "`regip`=?,"
												+ "`rdate`=NOW()";
	public static final String SELECT_MAX_NO = "SELECT MAX(`no`) FROM `board_article`";
	// 파일 등록
	public static final String INSERT_FILE = "insert into `board_file` set"
										   + "`parent`=?,"
										   + "`newName`=?,"
										   + "`oriName`=?";
	
	
	
	/*** view ***/
	// 게시글 조회
	public static final String SELECT_ARTICLE = "SELECT a.*, b.fno, b.parent AS pno, b.newName, b.oriName, b.download "
											  + "FROM `board_article` AS a "
											  + "left JOIN `board_file` AS b "
											  + "ON a.`no` = b.`parent` "	
											  + "WHERE `no`=? AND `cate`=?";
	
	// 게시글 조회수 +1
	public static final String UPDATE_ARTICLE_HIT = "UPDATE `board_article` SET `hit` = `hit` + 1 WHERE `no`=?";
	
	// 파일 다운로드
	public static final String SELECT_FILE = "select * from `board_file` where `parent`=?";
	
	// 파일 다운로드 수 +1
	public static final String UPDATE_FILE_DOWNLOAD = "update `board_file` set `download` = `download` + 1 where `fno`=?";
	
	
	/*** delete ***/
	// 게시글 삭제
	public static final String DELETE_ARTICLE = "delete from `board_article` where `no`=? or `parent`=?";
	
	// 파일 삭제
	public static final String DELETE_FILE = "delete from `board_file` where `parent`=?";
	
	/*** update ***/
	// 게시글 수정
	public static final String UPDATE_ARTICLE = "update `board_article` set "
												+"`title`=?, "
												+"`content`=?, "
												+"`rdate`=NOW() "
												+"where `no`=?";
	public static final String SELECT_MODIFY_ARTICLE = "select * from `board_article` where `no`=?";
	/*** index ***/
	// 게시글 조회
	public static final String SELECT_ARTICLES = "SELECT a.*, b.nick FROM `board_article` AS a "
											   + "JOIN `board_user` AS b "
											   + "ON a.uid= b.uid "
											   + "WHERE `parent`= 0 and `cate`=? "
											   + "ORDER BY `no` DESC "
											   + "LIMIT ?, 10";
	
	public static final String SELECT_ARTICLES_BY_KEYWORD = "SELECT a.*, b.nick FROM `board_article` AS a "
			+ "JOIN `board_user` AS b ON a.uid = b.uid "
			+ "WHERE `parent`=0 AND (`title` LIKE ? OR `nick` LIKE ?)"
			+ "ORDER BY `no` desc "
			+ "LIMIT ?, 10";
	
	// 우측 하단 tabs
	public static final String SELECT_LATEST = "SELECT `no`,`title`,`rdate` FROM `board_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 3";
	
	// latest
	public static final String SELECT_LATESTS = "(SELECT `no`,`title`,`rdate` FROM `board_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 5) "
			+ "UNION "
			+ "(SELECT `no`,`title`,`rdate` FROM `board_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 5) "
			+ "UNION "
			+ "(SELECT `no`,`title`,`rdate` FROM `board_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 5)";
	
	
	/*** list ***/
	// 전체 게시글 개수
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(`no`) FROM `board_article` WHERE `parent` = 0 AND `cate`=?";
	public static final String SELECT_COUNT_TOTAL_FOR_SEARCH = "SELECT COUNT(`no`) FROM `board_article` AS a "
															 + "JOIN `board_user` AS b ON a.uid = b.uid "
															 + "WHERE `parent` = 0 AND `cate`=? AND (`title` LIKE ? OR `nick` LIKE ?)";
	
	
	/*** comment ***/
	// 댓글 작성
	public static final String INSERT_COMMENT = "insert into `board_article` set "
												+ "`parent`=?,"
										    	+ "`content`=?,"
										    	+ "`uid`=?,"
												+ "`regip`=?,"
												+ "`rdate`=NOW()";
	public static final String SELECT_COMMENT_LATEST = "SELECT a.*,b.nick from `board_article` AS a "
													+ "JOIN `board_user` AS b "
													+ "USING(`uid`) "
													+ "WHERE `parent`<>0 ORDER BY `no` DESC LIMIT 1;";
	public static final String UPDATE_ARTICLE_COMMENT_PLUS = "update `board_article` set `comment`=`comment`+1 where `no`=?";
	
	// 댓글 조회
	public static final String SELECT_COMMENTS = "SELECT a.*, b.`nick` FROM `board_article` AS a "
												+ "JOIN `board_user` AS b "
												+ "ON a.uid = b.uid "
												+ "WHERE `parent`=? ORDER BY `no` ASC";
	
	// 댓글 삭제
	public static final String DELETE_COMMENT = "delete from `board_article` where `no`=? and `parent`=?";
	public static final String UPDATE_ARTICLE_COMMENT_MINUS = "update `board_article` set `comment`=`comment`-1 where `no`=?";
	
	// 댓글 수정
	public static final String UPDATE_COMMENT = "update `board_article` set "
												+ "`content`=?, "
												+ "`rdate`=NOW() "
												+ "where `no`=?";

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
