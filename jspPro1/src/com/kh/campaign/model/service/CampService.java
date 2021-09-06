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

}
