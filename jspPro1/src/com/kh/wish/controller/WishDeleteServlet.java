package com.kh.wish.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.wish.model.service.WishService;

/**
 * Servlet implementation class WishDeleteServlet
 */
@WebServlet("/delete.ws")
public class WishDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int wishNo = Integer.parseInt(request.getParameter("wishNo"));
		System.out.println("wishNo = " + wishNo);
		
		
		int result = new WishService().deleteWish(wishNo);
		System.out.println(result+"result");
		if(result > 0) {
			request.getSession().setAttribute("msg", "찜목록의 상품이 삭제되었습니다.");
			response.sendRedirect("list.ws");
		}else {
			request.setAttribute("msg", "찜목록 상품 삭제 실패");

			RequestDispatcher view = request.getRequestDispatcher("views/member/errorPage.jsp");
			view.forward(request, response);
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
