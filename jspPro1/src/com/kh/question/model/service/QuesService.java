package com.kh.question.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.question.model.dao.QuesDao;
import com.kh.question.model.vo.QNA;

public class QuesService {

	public QuesService() {
		
	}
	
	public ArrayList<QNA> selectQuesList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<QNA> qnaList = new QuesDao().selectQuesList(conn, userId);
		
		close(conn);
		return qnaList;
	}

}
