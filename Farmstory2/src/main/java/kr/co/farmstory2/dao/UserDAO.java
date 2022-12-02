package kr.co.farmstory2.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.db.DBHelper;
import kr.co.farmstory2.db.Sql;
import kr.co.farmstory2.vo.TermsVO;
import kr.co.farmstory2.vo.UserVO;

public class UserDAO extends DBHelper{
		
		Logger logger = LoggerFactory.getLogger(this.getClass());
		
		// CRUD
		
		/*** register ***/
		// 약관 동의
		public TermsVO selectTerms() {
			TermsVO vo = null;
			try {
				logger.info("selectTerms");
				con = getConnection();
				stmt = con.createStatement();
				rs = stmt.executeQuery(Sql.SELECT_TERMS);
				if(rs.next()) {
					vo = new TermsVO();
					vo.setTerms(rs.getString(1));
					vo.setPrivacy(rs.getString(2));
				}
				close();
			} catch (Exception e) {
				logger.error(e.getMessage());
			}
			return vo;
		}
		// 아이디 중복 확인
		public int selectCountUid(String uid) {
			
			int result = 0;
			
			try{
				con = getConnection();
				psmt = con.prepareStatement(Sql.SELECT_COUNT_UID);
				psmt.setString(1, uid);
				
				rs = psmt.executeQuery() ;
				
				
				if(rs.next()){ 
					result = rs.getInt(1);
				}
				
				close();
			}catch(Exception e){
				e.printStackTrace();		
			}	
			
			return result;
		}
		// 닉네임 중복 확인
		public int selectCountNick(String nick) {
			int result = 0;
			
			try{
				con = getConnection();
				psmt = con.prepareStatement(Sql.SELECT_COUNT_NICK);
				psmt.setString(1, nick);
				
				rs = psmt.executeQuery() ;
				
				
				if(rs.next()){ 
					result = rs.getInt(1);
				}
				
				close();
				
			}catch(Exception e){
				e.printStackTrace();		
			}	
			
			return result;
		}
		// 이메일
		public int checkEmail(String email) {
			int result = 0;
			
			try {
				logger.info("checkEmail...");
				con = getConnection();
				psmt = con.prepareStatement(Sql.CHECK_EMAIL);
				psmt.setString(1, email);
				
				rs = psmt.executeQuery();
				
				if(rs.next()) result = 1;
				
				close();
			} catch (Exception e) {
				logger.error(e.getMessage());
			}
			logger.debug("result : " + result);
			return result;
		}
		// 회원가입
		
		
		public void insertUser(UserVO vo) {
			try {
				logger.info("insertUser...");
				
				con = getConnection();
				psmt = con.prepareStatement(Sql.INSERT_USER);
				psmt.setString(1, vo.getUid());
				psmt.setString(2, vo.getPass());
				psmt.setString(3, vo.getName());
				psmt.setString(4, vo.getNick());
				psmt.setString(5, vo.getEmail());
				psmt.setString(6, vo.getHp());
				psmt.setString(7, vo.getZip());
				psmt.setString(8, vo.getAddr1());
				psmt.setString(9, vo.getAddr2());
				psmt.setString(10, vo.getRegip());
				psmt.executeUpdate();
				close();
				
			}catch (Exception e) {
				logger.error(e.getMessage());
			}
		}
		
		/*** login ***/
		// 아이디 패스워드 확인
		public UserVO selectUser(String uid, String pass) {
			
			UserVO ub = null;

			try{
				logger.info("selectUser...");
				
				con = getConnection();
				psmt = con.prepareStatement(Sql.SELECT_USER);
				psmt.setString(1, uid);
				psmt.setString(2, pass);
				
				rs = psmt.executeQuery();
				
				if(rs.next()){
					ub = new UserVO();
					
					ub.setUid(rs.getString(1));
					ub.setPass(rs.getString(2));
					ub.setName(rs.getString(3));
					ub.setNick(rs.getString(4));
					ub.setEmail(rs.getString(5));
					ub.setHp(rs.getString(6));
					ub.setGrade(rs.getInt(7));
					ub.setZip(rs.getString(8));
					ub.setAddr1(rs.getString(9));
					ub.setAddr2(rs.getString(10));
					ub.setRegip(rs.getString(11));
					ub.setRdate(rs.getString(12));
				}
				
				close();
				
			}catch(Exception e){
				logger.error(e.getMessage());
			}
			return ub;
		}
		// 자동 로그인 
		public UserVO selectUserBySessId(String sessId) {
			
			UserVO vo = new UserVO();
			
			try {
				logger.info("selectUserBySessId...");
				con = getConnection();
				psmt = con.prepareStatement(Sql.SELECT_USER_BY_SESSID);
				psmt.setString(1, sessId);
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					vo = new UserVO();
					vo.setUid(rs.getString(1));
					vo.setPass(rs.getString(2));
					vo.setName(rs.getString(3));
					vo.setNick(rs.getString(4));
					vo.setEmail(rs.getString(5));
					vo.setHp(rs.getString(6));
					vo.setGrade(rs.getInt(7));
					vo.setZip(rs.getString(8));
					vo.setAddr1(rs.getString(9));
					vo.setAddr2(rs.getString(10));
					vo.setRegip(rs.getString(11));
					vo.setRdate(rs.getString(12));
				}
				close();
			} catch (Exception e) {
				logger.error(e.getMessage());
			}
			return vo;
		}
		// 자동 로그인 세션 만료 연장
		public void updateUserForSessLimitDate(String sessId) {
			try {
				logger.info("updateUserForSessLimitDate...");
				con = getConnection();
				psmt = con.prepareStatement(Sql.UPDATE_USER_FOR_SESS_LIMIT_DATE);
				psmt.setString(1, sessId);
				psmt.executeUpdate();
				close();
			}catch (Exception e) {
				logger.error(e.getMessage());
			}
		}
		// 자동 로그인 sessID DB 저장
		public void updateUserForSession(String uid, String sessId) {
			try {
				logger.info("updateUserForSession...");
				con =  getConnection();
				psmt = con.prepareStatement(Sql.UPDATE_USER_FOR_SESSION);
				psmt.setString(1, sessId);
				psmt.setString(2, uid);
				psmt.executeUpdate();
				close();
			} catch (Exception e) {
				logger.error(e.getMessage());
			}
		}
		
		/*** 아이디 찾기 ***/
		// 이름, 이메일 -> 아이디 찾기
		public UserVO selectUserForFindId(String name, String email) {
			
			UserVO vo = null;
			try {
				logger.info("selectUserForFindId...");
				
				con = getConnection();
				psmt = con.prepareStatement(Sql.SELECT_USER_FOR_FIND_ID);
				psmt.setString(1, name);
				psmt.setString(2, email);
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					vo = new UserVO();
					vo.setUid(rs.getString(1));
					vo.setName(rs.getString(3));
					vo.setEmail(rs.getString(5));
					vo.setRdate(rs.getString(12));
				}
				
				close();
			} catch (Exception e) {
				logger.error(e.getMessage());
			}
			logger.debug("vo : " + vo);
			return vo;
		}
		
		/*** 비밀번호 찾기 ***/
		public UserVO selectUserForFindPw(String uid, String email) {
			
			UserVO vo = null;
			
			try {
				logger.info("selectUserForFindPw...");
				con = getConnection();
				psmt = con.prepareStatement(Sql.SELECT_USER_FOR_FIND_PW);
				psmt.setString(1, uid);
				psmt.setString(2, email);
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					vo = new UserVO();
					vo.setUid(rs.getString(1));
				}
				
				close();
			} catch (Exception e) {
				logger.error(e.getMessage());
			}
			return vo;
		}
		
		/*** 비밀번호 변경 ***/
		// 비밀번호 변경
		public int updateUserPw(String uid, String pass) {
			
			UserVO vo = null;
			int result = 0;
			try {
				logger.info("updateUserPw...");
				con = getConnection();
				psmt = con.prepareStatement(Sql.UPDATE_USER_PW);
				psmt.setString(1, pass);
				psmt.setString(2, uid);
				result = psmt.executeUpdate();
			
				close();
				
			} catch (Exception e) {
				logger.error(e.getMessage());
			}
			logger.debug("result : " + result);
			return result;
		}
		
		/*** logout ***/
		public void updateUserForSessionOut(String uid) {
			try {
				logger.info("updateUserForSessionOut...");
				con = getConnection();
				psmt = con.prepareStatement(Sql.UPDATE_USER_FOR_SESSION_OUT);
				psmt.setString(1, uid);
				psmt.executeUpdate();
				close();
			}catch (Exception e) {
				logger.error(e.getMessage());
			}
		}
		
		
		
		public void deleteUserDAO() {}
}
