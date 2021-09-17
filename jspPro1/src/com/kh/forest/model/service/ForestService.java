package com.kh.forest.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.forest.model.dao.ForestDao;
import com.kh.forest.model.vo.Forest;

public class ForestService {
	
	public ForestService() {}

	public ArrayList<Forest> selectFList(String userId) {
		
		Connection conn = getConnection();
		
		ArrayList<Forest> forestList = new ForestDao().selectFList(conn, userId);
		
		close(conn);
		return forestList;
	}

	public int treeCount(String userId) {
		
		Connection conn = getConnection();
		
		int count = new ForestDao().treeCount(conn, userId);
		
		close(conn);
		return count;
	}

	public ArrayList<Forest> selectForestList() {
		
		Connection conn = getConnection();
		
		ArrayList<Forest> forestList = new ForestDao().selectForestList(conn);
		
		close(conn);
		return forestList;
	}

	public int forestCount() {
		
		Connection conn = getConnection();
		
		int count = new ForestDao().forestCount(conn);
		
		close(conn);
		return count;
	}

	public int totalTreeCount() {

		Connection conn = getConnection();
		
		int count = new ForestDao().totalTreeCount(conn);
		
		close(conn);
		return count;
	}

}
