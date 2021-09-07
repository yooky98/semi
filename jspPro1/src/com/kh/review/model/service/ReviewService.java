package com.kh.review.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.Review;

public class ReviewService {

	public ArrayList<Review> selectReList(int pNo) {
		Connection conn = getConnection();
		
		ArrayList<Review> r_list = new ReviewDao().selectReList(conn, pNo);
		
		close(conn);
		
		return r_list;
	}

}
