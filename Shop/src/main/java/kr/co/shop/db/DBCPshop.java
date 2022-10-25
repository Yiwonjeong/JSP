package kr.co.shop.db;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBCPshop {
	
	private static DataSource ds = null;
	
	public static Connection getConnection() throws SQLException, NamingException {
		
		if(ds == null) {
			ds = (DataSource) new InitialContext().lookup("java:comp/env/dbcp_java2_shop");
			
		}
		return ds.getConnection();
	}
	
}
