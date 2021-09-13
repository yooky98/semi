package com.kh.campaign.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.campaign.model.dao.CampDao;
import com.kh.campaign.model.vo.Campaign;

public class CampService {

	public CampService() {}
	
	
	public ArrayList<Campaign> selectCampList() {
		
		Connection conn = getConnection();
		
		ArrayList<Campaign> campList = new CampDao().selectCampList(conn);
		
		close(conn);
		return campList;
	}

	public ArrayList<Campaign> selectEndedList() {
		Connection conn = getConnection();
		
		ArrayList<Campaign> endedList = new CampDao().selectEndedList(conn);
		
		close(conn);
		return endedList;	
	}
	

	public Campaign selectCampaign(int campNo) {
		
		Connection conn = getConnection();
		
		Campaign camp = new CampDao().selectCampaign(conn, campNo);
		
		close(conn);
		return camp;
	}


	public int checkJoin(int campNo, String userId) {
		
		Connection conn = getConnection();
		
		int result = new CampDao().checkJoin(conn, campNo, userId);
		
		close(conn);
		return result;
	}


	public int insertCampJoin(int campNo, String userId) {

		Connection conn = getConnection();
		
		int result = new CampDao().insertCampJoin(conn, campNo, userId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}


	public int selectJoinNum(int campNo) {
		
		Connection conn = getConnection();
		
		int result = new CampDao().selectJoinNum(conn, campNo);
		
		close(conn);
		return result;
	}


	public ArrayList<Campaign> selectJoinList(String userId) {

		Connection conn = getConnection();
		
		ArrayList<Campaign> joinList = new CampDao().selectJoinList(conn, userId);
		
		close(conn);
		return joinList;
	}
	


	public ArrayList<Campaign> selectEndedJList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Campaign> endedJList = new CampDao().selectEndedJList(conn, userId);
		
		close(conn);
		return endedJList;
	}


	public int deleteJoin(int campNo, String userId) {

		Connection conn = getConnection();
		
		int result = new CampDao().deleteJoin(conn, campNo, userId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}





}
