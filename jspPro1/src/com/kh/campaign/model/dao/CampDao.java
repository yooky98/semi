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
		
		System.out.println(campList);
		return campList;
	}

	/*
	String sql ="SELECT * FROM CAMPAIGN";

	try {
		pstmt = conn.prepareStatement(sql);
		rset = pstmt.executeQuery();
		
		while(rset.next()) {
			campList.add(new Campaign(rset.getInt("CAMP_NO"),
									  rset.getString("CAMP_NAME"),
									  rset.getString("CAMP_CONTENT"),
									  rset.getString("CAMP_LOCATION"),
									  rset.getDate("CAMP_DATE"),
									  rset.getInt("CAPACITY")));
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}*/
	
}
