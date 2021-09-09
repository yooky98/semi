package com.kh.question.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kh.question.model.vo.QNA;

public class QuesDao {
	
	public QuesDao() {
	}

	public ArrayList<QNA> selectQuesList(Connection conn, String userId) {
		
		ArrayList<QNA> qnaList = new ArrayList<QNA>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT * FROM QNA JOIN QNA_CATEGORY USING(QUES_CATEGORY_NO) WHERE USER_ID=? ORDER BY QUES_NO DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				QNA qna = new QNA(rset.getInt("QUES_NO"),
							      rset.getString("USER_ID"),
								  rset.getString("QUES_CATEGORY_NAME"),
								  rset.getString("QUES_TITLE"),
								  rset.getString("QUES_CONTENT"),
								  rset.getDate("QUES_DATE"),
								  rset.getDate("ANS_DATE"),
								  rset.getString("ANS_CONTENT")
								  );
				qnaList.add(qna);
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

	public int insertQuestion(Connection conn, QNA qna) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql ="INSERT INTO QNA VALUES(SEQ_QUESNO.NEXTVAL, ?, ?, ?, ?, SYSDATE, NULL, NULL)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, qna.getUserId());
			pstmt.setInt(2, Integer.parseInt(qna.getQuesCategory()));
			pstmt.setString(3, qna.getQuesTitle());
			pstmt.setString(4, qna.getQuesContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
			
		return result;
	}

	public int deleteQuestion(Connection conn, int qno) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE QNA WHERE QUES_NO=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
			
		return result;

	}

	public QNA selectQuestion(Connection conn, int qno) {

		QNA qna = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT QUES_NO, QUES_TITLE, QUES_CONTENT, QUES_CATEGORY_NAME FROM QNA JOIN QNA_CATEGORY USING(QUES_CATEGORY_NO) WHERE QUES_NO=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				qna = new QNA(rset.getInt("QUES_NO"),
							  rset.getString("QUES_TITLE"),
						      rset.getString("QUES_CONTENT").replaceAll("<br>", "\n"),
						      rset.getString("QUES_CATEGORY_NAME")
						     );
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return qna;
	}

	public int updateQuestion(Connection conn, QNA qna) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql ="UPDATE QNA SET QUES_CATEGORY_NO=?, QUES_TITLE=?, QUES_CONTENT=?  WHERE QUES_NO=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(qna.getQuesCategory()));
			pstmt.setString(2, qna.getQuesTitle());
			pstmt.setString(3, qna.getQuesContent());
			pstmt.setInt(4, qna.getQuesNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
			
		return result;
	}

}
