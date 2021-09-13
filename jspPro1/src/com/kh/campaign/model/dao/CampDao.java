package com.kh.campaign.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.campaign.model.vo.Campaign;


import static com.kh.common.JDBCTemplate.*;

public class CampDao {
	
	private Properties prop = new Properties();
	
	public CampDao() {
		String fileName = CampDao.class.getResource("/sql/campaign/campaign-query.properties").getPath();
		
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

	public ArrayList<Campaign> selectCampList(Connection conn) {

		ArrayList<Campaign> campList = new ArrayList<Campaign>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCampList");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				campList.add(new Campaign(rset.getInt("CAMP_NO"),
										  rset.getString("CAMP_NAME"),
										  rset.getDate("CAMP_DATE")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return campList;
	}
	
	public ArrayList<Campaign> selectEndedList(Connection conn) {
		
		ArrayList<Campaign> endedList = new ArrayList<Campaign>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectEndedList");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				endedList.add(new Campaign(rset.getInt("CAMP_NO"),
									       rset.getString("CAMP_NAME"),
										   rset.getDate("CAMP_DATE")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return endedList;
	}

	public Campaign selectCampaign(Connection conn, int campNo) {
		
		Campaign camp = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCampaign");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, campNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				camp = new Campaign(rset.getInt("CAMP_NO"),
									rset.getString("CAMP_NAME"),
									rset.getString("CAMP_CONTENT"),
									rset.getString("CAMP_LOCATION"),
									rset.getDate("CAMP_DATE"),
									rset.getInt("CAPACITY"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return camp;
	}

	public int checkJoin(Connection conn, int campNo, String userId) {

		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("checkJoin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, campNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	public int insertCampJoin(Connection conn, int campNo, String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCampJoin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, campNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectJoinNum(Connection conn, int campNo) {

		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectJoinNum");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, campNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Campaign> selectJoinList(Connection conn, String userId) {

		ArrayList<Campaign> joinList = new ArrayList<Campaign>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectJoinList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				joinList.add(new Campaign(rset.getInt("CAMP_NO"),
							              rset.getString("CAMP_NAME"),
							              rset.getString("CAMP_LOCATION"),
							              rset.getDate("CAMP_DATE")));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return joinList;
	}

	public ArrayList<Campaign> selectEndedJList(Connection conn, String userId) {
		
		ArrayList<Campaign> endedJList = new ArrayList<Campaign>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectEndedJList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				endedJList.add(new Campaign(rset.getInt("CAMP_NO"),
							                rset.getString("CAMP_NAME"),
							                rset.getString("CAMP_LOCATION"),
							                rset.getDate("CAMP_DATE")));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return endedJList;
	}
	
	
	public int deleteJoin(Connection conn, int campNo, String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteJoin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, campNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}





	
}
