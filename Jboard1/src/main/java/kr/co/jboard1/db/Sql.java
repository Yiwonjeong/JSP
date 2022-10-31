package kr.co.jboard1.db;
//쿼리요소를 한 곳에 모음
public class Sql {

	// user
	public static final String INSERT_USER = "insert into `board_user` set "
											+ "`uid`=?,"
											+ "`pass`=SHA2(?,256),"
											+ "`name`=?,"
											+ "`nick`=?,"
											+ "`email`=?,"
											+ "`hp`=?,"
											+ "`zip`=?,"
											+ "`addr1`=?,"
											+ "`addr2`=?,"
											+ "`regip`=?,"
											+ "`rdate`=NOW()";
										
	public static final String SELECT_TERMS = "select * from `board_terms`";
	public static final String SELECT_USER = "select * from `board_user` where `uid`=? and `pass`=SHA2(?, 256)";
	public static final String SELECT_COUNT_UID = "select count(`uid`) from `board_user` where `uid`=?";
	public static final String SELECT_COUNT_NICK = "select count(`nick`) from `board_user` where `nick`=?";
	
	
	// board
	public static final String INSERT_ARTICLE = "insert into `board_article` set "
											  + "`title`=?,"
											  + "`content`=?,"
											  + "`file`=?,"
											  + "`uid`=?,"
											  + "`regip`=?,"
											  + "`rdate`=NOW()";
	
	public static final String INSERT_FILE = "insert into `board_file` set "
			 								+ "`parent`=?,"
			 								+ "`newName`=?,"
			 								+ "`oriName`=?";
	
	public static final String INSERT_COMMENT = "insert into `board_article` set "
												 + "`parent`=?, "
												 + "`content`=?, "
												 + "`uid`=?, "
												 + "`regip`=?, "
												 + "`rdate`=NOW()";
	
	public static final String SELECT_MAX_NO = "SELECT MAX(`no`) FROM `board_article`";
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(`no`) FROM `board_article`";
	
	public static final String SELECT_ARTICLES = "select a.*, b.nick from `board_article` as a "
											   + "join `board_user` as b "
											   + "on a.uid = b.uid "
											   + "order by `no` desc "
											   + "limit ?, 10";
	
	public static final String SELECT_ARTICLE = "select a.*, b.fno, b.parent as pno, b.newName, b.oriName, b.download "
											  + "from `board_article` as a "
											  + "left join `board_file` as b "
											  + "on a.`no` = b.`parent` "
											  + "where `no`=?";
	public static final String SELECT_FILE = "select * from `board_file` where `parent`=?";
	
	public static final String UPDATE_ARTICLE_HIT ="update `board_article` set `hit` = `hit` + 1 where `no`=?";
	
	public static final String UPDATE_FILE_DOWNLOAD ="update `board_file` set `download` = `download` + 1 where `fno`=?";
	
	
	
//	+ 쓸 때는 앞에 쿼리문과 붙지 않게 띄어쓰기 주의 
	
}