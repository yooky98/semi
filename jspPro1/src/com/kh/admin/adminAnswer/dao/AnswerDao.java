package com.kh.admin.adminAnswer.dao;
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

public class AnswerDao {
	
	private Properties prop = new Properties();
	
	public AnswerDao() {
		String fileName = AnswerDao.class.getResource("/sql/admin/adminAnswer/answer-query.properties").getPath();
		//System.out.println("fileName : " + fileName);
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

	public ArrayList<QNA> selectAnsList(Connection conn) {
		
		ArrayList<QNA> list = new ArrayList<QNA>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//selectAnsList=SELECT QUES_NO, QUES_CATEGORY_NAME, QUES_TITLE, QUES_CONTENT, USER_ID, QUES_DATE, ANS_CONTENT
		//FROM QNA JOIN QNA_CATEGORY USING(QUES_CATEGORY_NO);
		
		String sql = prop.getProperty("selectAnsList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				QNA qna = new QNA();
				
				qna.setQuesNo(rset.getInt("QUES_NO"));
				qna.setQuesCategory(rset.getString("QUES_CATEGORY_NAME"));
				qna.setQuesTitle(rset.getString("QUES_TITLE"));
				qna.setQuesContent(rset.getString("QUES_CONTENT"));
				qna.setUserId(rset.getString("USER_ID"));
				qna.setQuesDate(rset.getDate("QUES_DATE"));
				
				//System.out.println(rset.getString("ANS_CONTENT"));
				
				qna.setAnsContent(rset.getString("ANS_CONTENT")); 
				
				/* 이렇게 써도 결과는 같으나 jsp에서 null을 확인하는게 맞는 듯
				 * if(rset.getString("ANS_CONTENT") == null) { qna.setAnsContent("N"); }else {
				 * qna.setAnsContent("Y"); }
				 */
								
				list.add(qna);
			}
			//System.out.println("list : " + list);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}		
		
		return list;
	}

	public int updateAns(Connection conn, QNA qna) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		//updateAns=UPDATE QNA SET ANS_CONTENT=?, ANS_DATE=SYSDATE WHERE QUES_NO=?
		
		String sql = prop.getProperty("updateAns");
		
		//System.out.println("다오sql : " + sql);
		//System.out.println("다오qna1 : " + qna.getAnsContent());
		//System.out.println("다오qna1 : " + qna.getQuesNo());
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, qna.getAnsContent());
			pstmt.setInt(2, qna.getQuesNo());
			
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
