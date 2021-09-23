package com.kh.cart.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cart.model.service.CartService;

/**
 * Servlet implementation class cartDeleteServlet
 */
@WebServlet("/del.cart")
public class DeleteCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteCartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		System.out.println("cartNo = " + cartNo);

		int result = new CartService().deleteCart(cartNo);

		if (result > 0) {
			request.getSession().setAttribute("msg", "장바구니의 상품이 삭제되었습니다.");
			response.sendRedirect("list.cart");
		} else {
			request.setAttribute("msg", "장바구니 삭제 실패");

			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}

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
