package com.kh.admin.adminAnswer.service;
import static com.kh.common.JDBCTemplate.*;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.adminAnswer.dao.AnswerDao;
import com.kh.faq.model.vo.FAQ;
import com.kh.question.model.vo.QNA;

public class AnswerService {

	public ArrayList<QNA> selectAnsList() {
		
		Connection conn = getConnection();
		
		ArrayList<QNA> list = new AnswerDao().selectAnsList(conn);
		
		close(conn);
		
		return list;
	}

}
