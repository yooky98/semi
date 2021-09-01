package com.kh.question.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.question.model.vo.QNA;

public class QuesDao {
	
	public QuesDao() {
	}

	public ArrayList<QNA> selectQuesList(Connection conn, String userId) {
		
		ArrayList<QNA> qnaList = new ArrayList<QNA>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT * FROM QNA JOIN QNA_CATEGORY USING(QUES_CATEGORY_NO) WHERE USER_ID=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				QNA qna = new QNA(rset.getInt("QUES_NO"),
								  rset.getString("QUES_TITLE"),
								  rset.getString("QUES_CONTENT"),
								  rset.getDate("QUES_DATE"),
								  rset.getString("QUES_CATEGORY_NAME"),
								  rset.getDate("ANSWER_DATE"),
								  rset.getString("ANSWER"),
								  rset.getString("USER_ID"));
				qnaList.add(qna);
				System.out.println("qna" + qna);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return qnaList;
	}

}
