package com.kh.myGiftree.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.myGiftree.model.dao.ForestDao;
import com.kh.myGiftree.model.vo.Forest;

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
	
	
	

}
