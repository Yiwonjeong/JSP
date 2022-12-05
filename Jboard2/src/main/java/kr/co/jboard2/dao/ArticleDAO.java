package kr.co.jboard2.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.db.DBHelper;
import kr.co.jboard2.db.Sql;
import kr.co.jboard2.vo.ArticleVO;

//DAO (Data Access Object)
public class ArticleDAO extends DBHelper{
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	// 글 등록
	public int insertArticle(ArticleVO article) {
		int parent = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
			stmt = conn.createStatement();
			
			psmt.setString(1, article.getTitle());
			psmt.setString(2, article.getContent());
			psmt.setInt(3, article.getFname() == null ? 0 : 1);
			psmt.setString(4, article.getUid());
			psmt.setString(5, article.getRegip());
			
			psmt.executeUpdate();
			rs = stmt.executeQuery(Sql.SELECT_MAX_NO);
			
			conn.commit();
			
			if(rs.next()) {
				parent = rs.getInt(1);
			}
			
			close();
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		return parent;
	}
	
	// 파일 테이블 insert
	public void insertFile(int parent, String newName, String fname) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_FILE);
			psmt.setInt(1, parent);
			psmt.setString(2, newName);
			psmt.setString(3, fname);
			
			psmt.executeUpdate();
			
			close();
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
	}
	
	// 전체 게시물 개수
	public int selectCountTotal(String search) {
			
			int total = 0;
			
			try {
				logger.info("selectCountTotal");
				conn = getConnection();
				
				if(search == null) {
					stmt = conn.createStatement();			
					rs = stmt.executeQuery(Sql.SELECT_COUNT_TOTAL);
				}else {
					psmt = conn.prepareStatement(Sql.SELECT_COUNT_TOTAL_FOR_SEARCH);
					psmt.setString(1, "%"+search+"%");
					psmt.setString(2, "%"+search+"%");
					rs = psmt.executeQuery();
				}
				
				if(rs.next()) {
					total = rs.getInt(1);
				}
				
				close();
			}catch (Exception e) {
				logger.error(e.getMessage());
			}
			
			logger.debug("total : "+ total);
			
			return total;
		}
	
	// 글 가져오기
	public List<ArticleVO> selectArticles(int limitStart) {
		List<ArticleVO> articles = new ArrayList<>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
			psmt.setInt(1, limitStart);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleVO article = new ArticleVO();
				article.setNo(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setCate(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setUid(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11));
				//article.setNick(rs.getString(12));
				article.setFno(rs.getInt(12));
				article.setPno(rs.getInt(13));
				article.setNewName(rs.getString(14));
				article.setOriName(rs.getString(15));
				article.setDownload(rs.getInt(16));
				
				articles.add(article);		
			}
			
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return articles;
	}
	
	// 검색한 글 가져오기 
public List<ArticleVO> selectArticlesByKeyword(String keyword, int start) {
		
		List<ArticleVO> articles = new ArrayList<>();
		
		try {
			logger.info("selectArticlesByKeyword...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLES_BY_KEYWORD);
			psmt.setString(1, "%"+keyword+"%");
			psmt.setString(2, "%"+keyword+"%");
			psmt.setInt(3, start);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleVO article = new ArticleVO();
				article.setNo(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setCate(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setUid(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11));
				article.setNick(rs.getString(12));
				
				articles.add(article);	
			}
			close();
			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return articles;
	}
	
}
