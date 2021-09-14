package com.kh.review.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.review.model.vo.Review;



/**
 * Servlet implementation class review_read
 */
@WebServlet("/review_read")
public class review_read extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public review_read() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		System.out.println("review_read.credu 요청");
	
		
		//파라미터 한글처리
		request.setCharacterEncoding("UTF-8");
		
		//파라미터값 추출
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		
		
		// 해당 리뷰글 정보 불러오기.
		try {
			
			Review review = review_DAO.review_read(review_num);
		
			// System.out.println(bean.getReview_num());
			
			// 어떤 형태로 데이터를 받는지 정의해줘야함.
			response.setContentType("text/plain; charset=UTF-8");
			
			// 응답 결과를 출력할 스트림 생성
			PrintWriter pw = response.getWriter();
			pw.print(review.getReview_content());
			
					
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
