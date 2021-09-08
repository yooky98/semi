package com.kh.admin.adminAnswer.service;
import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.adminAnswer.dao.AnswerDao;
import com.kh.question.model.vo.QNA;

public class AnswerService {

	public ArrayList<QNA> selectAnsList() {
		
		Connection conn = getConnection();
		
		ArrayList<QNA> list = new AnswerDao().selectAnsList(conn);
		
		close(conn);
		
		return list;
	}

	public int updateAns(QNA qna) {
		
		Connection conn = getConnection();
		
		int result = new AnswerDao().updateAns(conn, qna);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

}
