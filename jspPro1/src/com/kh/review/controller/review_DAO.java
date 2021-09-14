package com.kh.review.controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.kh.review.model.vo.Review;
import com.kh.common.JDBCTemplate;





public class review_DAO {

	// 빈객체를 매개변수로 받는다.
	// 리뷰작성
	public static void review_write(Review review) {

		try {

			// DB연결
			Connection conn = JDBCTemplate.getConnection();		
			System.out.println("연결성공");
			// SQL 문
			String sql = "INSERT INTO REVIEW(REVIEW_NUM, USER_ID, PROD_NO, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_CNT, REVIEW_STAR, REVIEW_BUY_OPT, REVIEW_REGDATE)"
					+ " VALUES(REVIEW_NUM.NEXTVAL, ?, ?, ?, ?, 0, ?, ?, SYSDATE)";

			PreparedStatement psmt = conn.prepareStatement(sql);

			psmt.setString(1, review.getUser_id());
			psmt.setString(2, review.getProd_no());
			psmt.setString(3, review.getReview_title());
			psmt.setString(4, review.getReview_content());
			psmt.setInt(5, review.getReview_star());
			psmt.setInt(6, review.getReview_buy_opt());

			// SQL 실행
			psmt.execute();
			
			// DB 연결 종료
			conn.close();
			System.out.println("DB종료");
		} catch (Exception e) {
			e.printStackTrace();
		}

	} // review_write()

	// 모든 리뷰글들을 불러온다.
	public static ArrayList<Review> review_get(int start, int end) {

		// Arraylist 생성
		// 빈객체를 담을 arraylist
		ArrayList<Review> list = new ArrayList<Review>();

		try {

		
			// DB연결
			Connection conn = JDBCTemplate.getConnection();		

			// SQL
			// 리뷰게시판에 모든 데이터를 불러온다.
			String sql =  "SELECT * FROM "
						 + "(SELECT ROWNUM AS RNUM, A1.* FROM "
					     + "(SELECT REVIEW_NUM, USER_ID, PROD_NO, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_CNT, REVIEW_STAR, REVIEW_BUY_OPT, REVIEW_REGDATE FROM REVIEW ORDER BY REVIEW_NUM ) A1) A2 "
						 + "WHERE A2.RNUM >= ? AND A2.RNUM <=?";

			//Statement stmt = conn.createStatement();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			// SQL 실행
			ResultSet rs = pstmt.executeQuery();

			// rs.next() 값이 있으면 투루를 반환.
			while (rs.next()) {

				int review_num = rs.getInt("REVIEW_NUM"); // 글 번호
				String user_id = rs.getString("USER_ID"); // 작성자 ID
				String prod_no = rs.getString("PROD_NO"); // 상품번호
				String review_title = rs.getString("REVIEW_TITLE"); // 리뷰 제목
				String review_content = rs.getString("REVIEW_CONTENT"); // 리뷰 내용
				int review_cnt = rs.getInt("REVIEW_CNT"); // 조회수
				int review_star = rs.getInt("REVIEW_STAR"); // 별점
				int review_buy_opt = rs.getInt("REVIEW_BUY_OPT"); // 구매여부 0 : X
																	// 1 : 구매
				Date review_regdate = rs.getDate("REVIEW_REGDATE"); // 리뷰 작성일

				// 빈객체 생성
				Review review = new Review();

				review.setReview_num(review_num);
				review.setUser_id(user_id);
				review.setProd_no(prod_no);
				review.setReview_title(review_title);
				review.setReview_content(review_content);
				review.setReview_cnt(review_cnt);
				review.setReview_buy_opt(review_buy_opt);
				review.setReview_star(review_star);
				review.setReview_regdate(review_regdate);

				list.add(review);
			}

			// DB 연결 종료
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	// 페이지 수를 구하는 메서드
	// 총 레코드수(게시글 수)를 구함.
	public static int review_getPageCount() throws Exception {

		Connection conn = JDBCTemplate.getConnection();		

		// 쿼리문
		String sql = "SELECT COUNT(*) FROM " + "REVIEW";

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();

		// 전체 글의 개수를 가져온다.
		int cnt = rs.getInt(1);

		
		conn.close();

		// 총 페이지 개수 리턴
		return cnt;

	}

	// 리뷰글을 읽어오는 메서드
	public static Review review_read(int num) throws Exception {

		// 빈객체 생성
		Review review = new Review();

		// DB 연결
		Connection conn = JDBCTemplate.getConnection();		

		// SQL
		String sql = "SELECT * FROM REVIEW WHERE REVIEW_NUM=" + num;

		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {

			int review_num = rs.getInt("REVIEW_NUM"); // 글 번호
			String user_id = rs.getString("USER_ID"); // 작성자 ID
			String prod_no = rs.getString("PROD_NO"); // 상품명
			String review_title = rs.getString("REVIEW_TITLE"); // 리뷰 제목
			String review_content = rs.getString("REVIEW_CONTENT"); // 리뷰 내용
			int review_cnt = rs.getInt("REVIEW_CNT"); // 조회수
			int review_star = rs.getInt("REVIEW_STAR"); // 별점
			int review_buy_opt = rs.getInt("REVIEW_BUY_OPT"); // 구매여부 0 : X 1 :
																// 구매
			Date review_regdate = rs.getDate("REVIEW_REGDATE"); // 리뷰 작성일

			review.setReview_num(review_num);
			review.setUser_id(user_id);
			review.setProd_no(prod_no);
			review.setReview_title(review_title);
			review.setReview_content(review_content);
			review.setReview_cnt(review_cnt);
			review.setReview_buy_opt(review_buy_opt);
			review.setReview_star(review_star);
			review.setReview_regdate(review_regdate);

		}

		conn.close();

		return review;

	}
	
	
	public static void review_delete(int num) throws Exception{
		
		Connection conn = JDBCTemplate.getConnection();		

		// SQL
		String sql = "DELETE FROM REVIEW WHERE REVIEW_NUM=" + num;

		Statement stmt = conn.createStatement();
		stmt.executeQuery(sql);
		
		conn.close();
	
		
	}

	

}
