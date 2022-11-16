package kr.co.farmstory1.dao;

import java.lang.System.Logger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


import kr.co.farmstory1.bean.TermsBean;
import kr.co.farmstory1.bean.UserBean;
import kr.co.farmstory1.db.DBCP;
import kr.co.farmstory1.db.DBHelper;
import kr.co.farmstory1.db.Sql;

public class UserDAO extends DBHelper {

	
	//공식적 
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	private UserDAO() {}
	
	//	비공식적
	//	INSTANCE;
	
	// CRUD
	public void insertUserDAO(UserBean ub) {
		try{
			con = getConnection();
			psmt = con.prepareStatement(Sql.INSERT_USER);
			psmt.setString(1, ub.getUid());
			psmt.setString(2, ub.getPass());
			psmt.setString(3, ub.getName());
			psmt.setString(4, ub.getNick());
			psmt.setString(5, ub.getEmail());
			psmt.setString(6, ub.getHp());
			psmt.setString(7, ub.getZip());
			psmt.setString(8, ub.getAddr1());
			psmt.setString(9, ub.getAddr2());
			psmt.setString(10, ub.getRegip());
			
			psmt.executeUpdate();
			
			close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public UserBean selectUser(String uid, String pass) {
		
		UserBean ub = null;

		try{
			// logger.info("selectUser..."); error의 원인 출처(selectUser임)을 알기 위해
			
			con = getConnection();
			psmt = con.prepareStatement(Sql.SELECT_USER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			
			rs = psmt.executeQuery();
			
			if(rs.next()){
				ub = new UserBean();
				
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
			e.printStackTrace();
			//logger.error(e.getMessage());
		}
		// logger.debug("ub: "+ub);
		return ub;
	}
	
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
	
	public int selectCountNickDAO(String nick) {
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
	
	public void selectUsersDAO() {}
	
	public void updateUserDAO() {}
	
	public void deleteUserDAO() {}
	
	
//	@Override
//	public String toString() {
//		return "uid: "+uid+", name: "+name;
//	}

}
