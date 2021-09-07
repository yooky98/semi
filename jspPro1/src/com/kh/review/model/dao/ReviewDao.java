package com.kh.review.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.close;

import com.kh.review.model.vo.Review;

public class ReviewDao {

	private Properties prop = new Properties();
	
	public ReviewDao() {
		String fileName = ReviewDao.class.getResource("/sql/review/review-query.properties").getPath();
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

	public ArrayList<Review> selectReList(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> r_list = new ArrayList<Review>();
		// selectReList=SELECT USER_ID, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_STAR FROM REVIEW WHERE PROD_NO = ?
		String sql = prop.getProperty("selectReList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r = new Review();
				r.setUser_id(rset.getString("USER_ID"));
				r.setReview_title(rset.getString("REVIEW_TITLE"));
				r.setReview_content(rset.getString("REVIEW_CONTENT"));
				r.setReview_star(rset.getInt("REVIEW_STAR"));
			
				r_list.add(r);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return r_list;
	}
}
