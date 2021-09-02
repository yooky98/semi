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

	public int insertQuestion(QNA qna) {
		Connection conn = getConnection();
		
		int result = new QuesDao().insertQuestion(conn, qna);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int deleteQuestion(int qno) {
		Connection conn = getConnection();
		
		int result = new QuesDao().deleteQuestion(conn, qno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public QNA selectQuestion(int qno) {
		Connection conn = getConnection();
		
		QNA qna = new QuesDao().selectQuestion(conn, qno);
		
		close(conn);
		return qna;
	}

}
