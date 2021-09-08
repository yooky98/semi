package com.kh.campaign.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kh.campaign.model.vo.Campaign;
import static com.kh.common.JDBCTemplate.*;

public class CampDao {
	
	public CampDao() {}

	public ArrayList<Campaign> selectCampList(Connection conn) {

		ArrayList<Campaign> campList = new ArrayList<Campaign>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql ="SELECT CAMP_NO, CAMP_NAME FROM CAMPAIGN";

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				campList.add(new Campaign(rset.getInt("CAMP_NO"),
										  rset.getString("CAMP_NAME")));
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

	public Campaign selectCampaign(Connection conn, int campNo) {
		
		Campaign camp = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql ="SELECT * FROM CAMPAIGN WHERE CAMP_NO=?";
		
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
		
		String sql ="SELECT COUNT(*) FROM CAMPAIGN_JOIN WHERE USER_ID=? AND CAMP_NO=?";
		
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
		
		String sql ="INSERT INTO CAMPAIGN_JOIN VALUES(?,?)";
		
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
		
		String sql ="SELECT COUNT(*) FROM CAMPAIGN_JOIN WHERE CAMP_NO=?";
		
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
		
		String sql = "SELECT B.CAMP_NO, B.CAMP_NAME, B.CAMP_LOCATION, B.CAMP_DATE FROM CAMPAIGN_JOIN A JOIN CAMPAIGN B ON A.CAMP_NO = B.CAMP_NO WHERE USER_ID =?";
		
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

	public int deleteJoin(Connection conn, int campNo, String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql ="DELETE FROM CAMPAIGN_JOIN WHERE USER_ID=? AND CAMP_NO=?";
		
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
