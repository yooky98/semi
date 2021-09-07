package com.kh.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.review.model.vo.Review;



/**
 * Servlet implementation class review
 */
@WebServlet("/review")
public class review extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public review() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());

		System.out.println("review.credu");

		int pagenum = 1; // 페이지 번호
		if (request.getParameter("Page_num") != null) {
			pagenum = Integer.parseInt(request.getParameter("Page_num"));
		}

		// size 보여줄 페이지당 게시글 개수. 15개당 1page
		int size = 15;

		int tot = 0;
		int cnt = 0;

		try {

			// 총 게시글 개수.
			cnt = review_DAO.review_getPageCount();
			//페이지 번호
			tot = cnt / size;
			if (cnt % size != 0) {
				tot++;
			}

			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		// 1page 1 ~ 15 15개
		// 2page 16 ~ 30 15개
		// 3page 31 ~ 45 15개
		
		int end = pagenum * size;
		int start = end - size + 1;
		
		System.out.println(start);
		System.out.println(end);

		// 리뷰게시판 불러오기.
		ArrayList<Review> list = review_DAO.review_get(start, end);

		// request 객체에 list를 담아준다.
		request.setAttribute("list", list);
		
		// request 객체에 총 페이지수를 담아준다.
		request.setAttribute("tot", tot);
				

		// review.jsp로 이동
		String site = "../views/mypage/review/review.jsp";

		RequestDispatcher dis = request.getRequestDispatcher(site);
		dis.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
