package com.kh.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kh.cart.model.service.CartService;
import com.kh.member.model.vo.UserVO;
import com.kh.order.model.service.OrderService;
import com.kh.order.model.vo.Order;

/**
 * Servlet implementation class payServlet
 */
@WebServlet("/pay")
public class PayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	//	int car = Integer.parseInt(request.getParameter("car"));
		String orderName = request.getParameter("orderName");
		String orderPhone = request.getParameter("orderPhone");
		String address = request.getParameter("postcode") + "&" + request.getParameter("addr") + "&" + request.getParameter("postcode_detailAddress");		
		String orderMsg = request.getParameter("orderMsg");
		String orderTotalPrice = request.getParameter("orderTotalPrice");
		String userId = ((UserVO)request.getSession().getAttribute("loginUser")).getUser_id();
		
	
		
		int point = Integer.parseInt(request.getParameter("point")) + 100; //사용후 남은 포인트 + 추가포인트(100포인트)
		String merchant_uid = request.getParameter("merchant_uid");//주문 고유번호
		
		
		Order od = new Order();
		
		od.setOrderName(orderName);
		od.setOrderPhone(orderPhone);
		od.setOrderAddress(address);
		od.setOrdermsg(orderMsg);
		od.setTotalprice(Integer.parseInt(orderTotalPrice));
		od.setUserId(userId);
		
		int result = new OrderService().insertOrders(od);
		int result1 = new OrderService().updateMemberPoint(userId, point);
		int ordersNo = new OrderService().selectOrderNo(); //마지막 주문번호 가져오기
		
		response.getWriter().print(ordersNo);
		System.out.println("ordersNo = " + ordersNo);
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
