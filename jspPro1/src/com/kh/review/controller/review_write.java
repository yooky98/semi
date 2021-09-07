package com.kh.review.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.review.model.vo.Review;



/**
 * Servlet implementation class review_write
 */
@WebServlet("/review_write")
public class review_write extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public review_write() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		System.out.println("review_write 서블릿 요청");
		
		//파라미터 추출
		
		String user_id = request.getParameter("user_id");
		String review_title = request.getParameter("review_title");
		String prod_no = request.getParameter("prod_no");
		String review_content = request.getParameter("review_content");
		int review_buy_opt;
			if(request.getParameter("review_buy_opt") != null){
					
			review_buy_opt =  Integer.parseInt(request.getParameter("review_buy_opt"));
				
			} else{
			
			review_buy_opt = 0;
				
			}
		
		int review_star = Integer.parseInt(request.getParameter("review_star"));
		
		
		// 값 출력 test
		System.out.println(user_id);
		System.out.println(review_title);
		System.out.println(prod_no);
		System.out.println(review_content);
		System.out.println(review_buy_opt);
		System.out.println(review_star);
		
		
		// 빈 객체에 데이터 set
		Review review = new Review();
		
		review.setUser_id(user_id);
		review.setReview_title(review_title);
		review.setProd_no(prod_no);
		review.setReview_content(review_content);
		review.setReview_buy_opt(review_buy_opt);
		review.setReview_star(review_star);
		
		
		//DB에 저장
		review_DAO.review_write(review);
		
		//페이지 이동
		String site = "review.credu";
		response.sendRedirect(site);
		
		
		
		// DB 처리
		/*
		 * 
		 * INSERT INTO REVIEW_TABLE(review_num, user_id, prod_num, review_title, review_content, review_cnt, review_star, review_buy_opt, review_regdate)
		   VALUES (review_num.nextval, 'zzzz2222', '이동기', '이동기 구매', '이동기 완전 좋아요!', 0, 4, 1, sysdate);
		 * 
		 */
		
		/*
		Connection conn = DBConnector.getConnection();
		
		String sql = "INSERT INTO REVIEW_TABLE(review_num, user_id, prod_num, review_title, review_content, review_cnt, review_star, review_buy_opt, review_regdate)"
				   + " VALUES(review_num.nextval, ?, ?, ?, ?, 0, ?, ?, sysdate)";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, user_id);
		psmt.setString(2, prod_num);
		psmt.setString(3, review_title);
		psmt.setString(4, review_content);
		psmt.setInt(5, review_star);
		psmt.setInt(6, review_buy_opt);
		
		//SQL 실행
		psmt.execute();
								
		//DB 연결 종료
		conn.close();
		*/
			
			
				
		
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
