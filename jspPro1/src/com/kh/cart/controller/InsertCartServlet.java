package com.kh.cart.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cart.model.service.CartService;
import com.kh.cart.model.vo.Cart;

/**
 * Servlet implementation class InsertCartServlet
 */
@WebServlet("/insert.cart")
public class InsertCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = (String)request.getSession().getAttribute("loginUser");
		
		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		int count = Integer.parseInt(request.getParameter("count"));
		String forest = request.getParameter("forest");
		
		Cart c = new Cart();
		c.setUserId(userId);
		c.setProdNo(prodNo);
		c.setCartAmount(count);
		c.setForestName(forest);
		
		int result = new CartService().insertCart(c);
		System.out.println("result = " + result );
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "장바구니 담기 성공");
			response.sendRedirect("list.cart");
			
		}else {
			request.setAttribute("msg", "장바구니 상품담기 실패");
			
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
