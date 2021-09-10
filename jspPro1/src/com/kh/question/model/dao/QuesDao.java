package com.kh.question.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.question.model.vo.QNA;
import com.kh.question.model.vo.QnaCategory;

public class QuesDao {
	
	private Properties prop = new Properties();
	
	public QuesDao() {
		
		String fileName = QuesDao.class.getResource("/sql/question/question-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<QNA> selectQuesList(Connection conn, String userId) {
		
		ArrayList<QNA> qnaList = new ArrayList<QNA>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQuesList");
		
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
		
		String sql = prop.getProperty("insertQuestion");
		 
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
		
		String sql = prop.getProperty("deleteQuestion");
		
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
		
		String sql = prop.getProperty("selectQuestion");
		
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
		
		String sql = prop.getProperty("updateQuestion");
		
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

	public ArrayList<QnaCategory> selectCategory(Connection conn) {

		ArrayList<QnaCategory> list = new ArrayList<QnaCategory>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QnaCategory(rset.getInt("QUES_CATEGORY_NO"), 
										 rset.getString("QUES_CATEGORY_NAME")));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
