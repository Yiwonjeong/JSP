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
												+ "`uid`=?,"
												+ "`pass`=SHA2(?, 256),"
												+ "`name`=?,"
												+ "`nick`=?,"
												+ "`email`=?,"
												+ "`hp`=?,"
												+ "`zip`=?,"
												+ "`addr1`=?,"
												+ "`addr2`=?,"
												+ "`regip`=?,"
												+ "`rdate`= NOW()";
		
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
		public static final String INSERT_ARTICLE = "INSERT INTO `board_article` SET "
													+ "`cate`=?, "
													+ "`title`=?, "
													+ "`content`=?, "
													+ "`file`=?, "
													+ "`uid`=?, "
													+ "`regip`=?, "
													+ "`rdate`=NOW()";

		public static final String INSERT_FILE = "INSERT INTO `board_file` SET "
				+ "`parent`=?,"
				+ "`newName`=?,"
				+ "`oriName`=?";
		
		public static final String INSERT_COMMENT = "INSERT INTO `board_article` SET "
													+ "`parent`=?,"
													+ "`content`=?,"
													+ "`uid`=?,"
													+ "`regip`=?,"
													+ "`rdate`=NOW()";

		public static final String SELECT_MAX_NO = "SELECT MAX(`no`) FROM `board_article`";
		public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(`no`) FROM `board_article`  WHERE `parent`=0 AND `cate`=?";
		public static final String SELECT_ARTICLES = "SELECT a.*, nick FROM `board_article` as a "
												  + "JOIN `board_user` as u on a.uid = u.uid "
												  + "WHERE `parent`= 0 AND `cate`=? "
												  + "order by a.no DESC "
												  + "LIMIT ?, 10";
		
		public static final String SELECT_ARTICLE = "SELECT a.*, b.fno, b.parent AS pno, b.newName, b.oriName, b.download "
													+ "FROM `board_article` AS a "
													+ "LEFT JOIN `board_file` AS b "
													+ "ON a.`no` = b.`parent` "
													+ "WHERE `no`=?";
		
		public static final String SELECT_FILE = "SELECT * FROM `board_file` WHERE `parent`=?";
		public static final String SELECT_FILE_IMG = "SELECT * FROM `board_file` WHERE `parent`=? and `oriName`='삽입 이미지'";
		
		public static final String SELECT_COMMENTS = "SELECT a.*, b.`nick` FROM `board_article` a "
													+ " JOIN `board_user` b "
													+ " ON a.uid = b.uid "
													+ " WHERE `parent`=? ORDER BY `no` ";
		
		public static final String SELECT_COMMENT_LATEST = " SELECT a.*, b.nick FROM `board_article` a "
														 + " JOIN `board_user` b USING(`uid`) "
														 + " WHERE `parent` != 0 ORDER BY `no` DESC LIMIT 1";
		public static final String SELECT_LATESTS = "(select `no`,`title`,`rdate` from `board_article` where `cate`=? order by `no` desc limit 5) "
												  + "union "
												  + "(select `no`,`title`,`rdate` from `board_article` where `cate`=? order by `no` desc limit 5) "
												  + "union "
												  + "(select `no`,`title`,`rdate` from `board_article` where `cate`=? order by `no` desc limit 5)";
		public static final String SELECT_LATEST = "select `no`,`title`,`rdate` from `board_article` where `cate`=? order by `no` desc limit 3";
		public static final String UPDATE_ARTICLE = "UPDATE `board_article` SET "
													 + " `title`=?,"
													 + " `content`=?,"
													 + " `rdate`=NOW() "
													 + " WHERE `no`=?";
		
		public static final String UPDATE_ARTICLE_HIT = "UPDATE `board_article` SET `hit` = `hit`+ 1 WHERE `no` = ?"; 
		
		public static final String UPDATE_FILE_DOWNLOAD = "UPDATE `board_file` SET `download` = `download`+ 1 WHERE `fno` = ?"; 
		public static final String UPDATE_COMMENT = "UPDATE `board_article` SET "
												  + " `content`=?, " 
												  + " `rdate`=? " 
												  + " WHERE `no`=? "; 
		public static final String UPDATE_COMMENT_PlUS = "UPDATE `board_article` SET "
														+ " `comment`= `comment`+1 "
														+ " WHERE no=? ";
		
		public static final String UPDATE_COMMENT_MINUS = "UPDATE `board_article` SET "
														+ " `comment` = `comment` - 1 " 
														+ " WHERE  `no` IN "
														+ " (SELECT t.parent FROM  "
														+ " (SELECT parent FROM `board_article` WHERE `no`=? ) AS t)";
		
		public static final String DELETE_FILE = "DELETE FROM `board_file` WHERE `parent`=? ";
		public static final String DELETE_COMMENT = "DELETE FROM `board_article` WHERE `no`=? ";

		public static final String DELETE_ARTICLE = "DELETE FROM `board_article` WHERE `no`=? OR `parent`=? ";
		public static final String DELETE_ARTICLE_FILE = "DELETE a.*, f.* FROM " 
													   + " `board_article` AS a "
													   + " LEFT JOIN " 
													   + "`board_file` AS f "
													   + " ON a.no = f.parent "
													   + " WHERE a.`no`= ?  OR a.`parent`= ?";
}
