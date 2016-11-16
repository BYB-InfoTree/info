package net.daum.byb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBpoolConnectTestMain {

	public static void main(String[] args) {
		
		DBConnectionManager db = DBConnectionManager.getInstance();
		Connection cn = null;
		PreparedStatement ps = null;		
		ResultSet rs = null;
		
		System.out.println("DB test Start.....");
		String sql = "select count(*) from member";
		try{
			cn = db.getConnection();
			ps = (PreparedStatement) cn.prepareStatement(sql);
			rs = ps.executeQuery();

			if(rs.next()){	
				System.out.println( "========>"+"count: "+rs.getInt(1));
			}
		}catch (Exception e){
//			if( rs.next()) {
//				System.out.println("count : "+ rs.getInt(1));
//			}
		
			System.out.println("db error." + e.getMessage());
		}
	}
}
