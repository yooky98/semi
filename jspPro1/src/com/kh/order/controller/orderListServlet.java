package com.kh.order.controller;

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

/**
 * Servlet implementation class orderListServlet
 */
@WebServlet("/list.order")
public class orderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] cartNo = request.getParameterValues("selectCheck[]");//장바구니 체크박스 번호  가져오기

		ArrayList<Cart> cartOrder = new CartService().selectCartOrder(cartNo); //db로 보내기
		//ArrayList<UserVO> userOrder = new CartService().selectUserOrder(cartNo);
		
		if(cartOrder != null) {
			request.setAttribute("clist", cartOrder);
		//	request.setAttribute("orderUser", userOrder);
			RequestDispatcher view = request.getRequestDispatcher("views/order/orderView.jsp");
			view.forward(request, response);
		}else {
			request.setAttribute("msg", "장바구니 상품을 불러오지 못했습니다.");
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
