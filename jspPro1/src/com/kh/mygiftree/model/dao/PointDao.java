package com.kh.mygiftree.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PointDao {

	public int selectPoint(Connection conn, String userId) {

		int point = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT POINT FROM USERS WHERE USER_ID=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				point = rset.getInt("POINT");
			}else {
				point = -1;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return point;
	}

}
