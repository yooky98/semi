package com.kh.orderDetail.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.orderDetail.model.service.OrderDetailService;

/**
 * Servlet implementation class OrderDeleteServlet
 */
@WebServlet("/delete.buy")
public class OrderDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderDetailNo = Integer.parseInt(request.getParameter("orderDetailNo"));
		System.out.println("orderDetailNo = " + orderDetailNo);
		
		
		int result = new OrderDetailService().deleteOrder(orderDetailNo);
		System.out.println(result+"result");
		if(result > 0) {
			request.getSession().setAttribute("msg", "주문 목록의 상품이 삭제되었습니다.");
			response.sendRedirect("list.buy");
		}else {
			request.setAttribute("msg", "주문 목록 상품 삭제 실패");

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
