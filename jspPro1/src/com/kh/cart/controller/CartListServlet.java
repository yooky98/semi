package com.kh.cart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cart.model.service.CartService;
import com.kh.cart.model.vo.Cart;
import com.kh.member.model.vo.UserVO;
import com.kh.product.model.vo.Product;

/**
 * Servlet implementation class CartListServlet
 */
@WebServlet("/list.cart")
public class CartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = ((UserVO)request.getSession().getAttribute("loginUser")).getUser_id();
		System.out.println("user_id = " + userId);
		
		ArrayList<Cart> list = new CartService().selectCartList(userId);			
		System.out.println("list 확인용 : " + list);
		
	
		if(list != null) {
			request.setAttribute("list", list);
			RequestDispatcher view = request.getRequestDispatcher("views/cart/cartListView.jsp");
			view.forward(request, response);
		}else {
			request.getSession().setAttribute("msg", "아이디에 해당하는 장바구니 제품이 없습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
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
