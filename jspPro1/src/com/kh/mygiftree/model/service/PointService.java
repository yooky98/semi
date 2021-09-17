package com.kh.mygiftree.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.mygiftree.model.dao.PointDao;

public class PointService {

	public PointService() {}
	
	public int selectPoint(String userId) {
		
		Connection conn = getConnection();
		
		int point = new PointDao().selectPoint(conn, userId);
		
		close(conn);
		return point;
	}

}
