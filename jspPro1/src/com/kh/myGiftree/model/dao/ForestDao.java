package com.kh.myGiftree.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kh.myGiftree.model.vo.Forest;
import static com.kh.common.JDBCTemplate.*;

public class ForestDao {
	
	public ForestDao() {
	}

	public ArrayList<Forest> selectFList(Connection conn, String userId) {

		ArrayList<Forest> forestList = new ArrayList<Forest>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT B.FOREST_NAME, A.FOREST_LOCATION, A.FOREST_SITE, SUM(B.ORDERS_AMOUNT) AMOUNT\n" + 
				"FROM FOREST A JOIN ORDERS_DETAIL B ON A.FOREST_NAME = B.FOREST_NAME\n" + 
				"WHERE USER_ID=? GROUP BY B.FOREST_NAME, A.FOREST_LOCATION, A.FOREST_SITE";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				forestList.add(new Forest(rset.getString("FOREST_NAME"), 
										  rset.getString("FOREST_LOCATION"),
										  rset.getString("FOREST_SITE"),
										  rset.getInt("AMOUNT")));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return forestList;
	}

	public int treeCount(Connection conn, String userId) {

		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql ="SELECT SUM(ORDERS_AMOUNT) FROM ORDERS_DETAIL WHERE USER_ID=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	public ArrayList<Forest> selectForestList(Connection conn) {
		
		ArrayList<Forest> forestList = new ArrayList<Forest>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT B.FOREST_NAME, A.FOREST_LOCATION, A.FOREST_SITE, SUM(B.ORDERS_AMOUNT) AMOUNT\n" + 
				"FROM FOREST A JOIN ORDERS_DETAIL B ON A.FOREST_NAME = B.FOREST_NAME\n" + 
				"GROUP BY B.FOREST_NAME, A.FOREST_LOCATION, A.FOREST_SITE";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				forestList.add(new Forest(rset.getString("FOREST_NAME"), 
										  rset.getString("FOREST_LOCATION"),
										  rset.getString("FOREST_SITE"),
										  rset.getInt("AMOUNT")));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return forestList;
	}

	public int forestCount(Connection conn) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql ="SELECT COUNT(DISTINCT FOREST_NAME) FROM ORDERS_DETAIL";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	public int totalTreeCount(Connection conn) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql ="SELECT SUM(ORDERS_AMOUNT) FROM ORDERS_DETAIL";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

}
