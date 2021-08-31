package com.kh.faq.model.service;
import static com.kh.common.JDBCTemplate.*;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.faq.model.dao.FAQDao;
import com.kh.faq.model.vo.FAQ;

public class FAQService {

	public ArrayList<FAQ> selectList() {
		
		Connection conn = getConnection();
		
		ArrayList<FAQ> list = new FAQDao().selectList(conn);
		
		close(conn);
		return list;
	}

}
