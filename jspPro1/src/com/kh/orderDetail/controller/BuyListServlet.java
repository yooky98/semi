package com.kh.orderDetail.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.UserVO;
import com.kh.orderDetail.model.service.OrderDetailService;
import com.kh.orderDetail.model.vo.OrderDetail;

/**
 * Servlet implementation class BuyListServlet
 */
@WebServlet("/list.buy")
public class BuyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = ((UserVO)request.getSession().getAttribute("loginUser")).getUser_id();
		
		ArrayList<OrderDetail> od_list = new OrderDetailService().selectBList(userId);			
		System.out.println("od_list 체크  : " + od_list);
	
		if(od_list != null) {
			request.setAttribute("od_list", od_list);
			RequestDispatcher view = request.getRequestDispatcher("views/mypage/buyList/buyList.jsp");
			view.forward(request, response);

		}else {
			request.setAttribute("msg", "아이디에 해당하는 주문 조회 내역이 없습니다.");
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
