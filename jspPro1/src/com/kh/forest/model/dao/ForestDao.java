package com.kh.forest.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.forest.model.vo.Forest;

public class ForestDao {
	
	Properties prop = new Properties();
	
	public ForestDao() {
		
		String fileName = ForestDao.class.getResource("/sql/forest/forest-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public ArrayList<Forest> selectFList(Connection conn, String userId) {

		ArrayList<Forest> forestList = new ArrayList<Forest>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFList");
		
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
		
		String sql = prop.getProperty("treeCount");
		
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
		
		String sql = prop.getProperty("selectForestList");
		
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
		
		String sql =  prop.getProperty("forestCount");
		
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
		
		String sql = prop.getProperty("totalTreeCount");		
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
