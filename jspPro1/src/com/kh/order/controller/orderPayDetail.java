package com.kh.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cart.model.service.CartService;
import com.kh.cart.model.vo.Cart;
import com.kh.member.model.vo.UserVO;
import com.kh.order.model.service.OrderService;
import com.kh.order.model.vo.Order;

/**
 * Servlet implementation class orderPayDetail
 */
@WebServlet("/orderPay.del")
public class orderPayDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderPayDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = ((UserVO)request.getSession().getAttribute("loginUser")).getUser_id();//유저아이디
		String ordersNo = request.getParameter("ordersNo");//주문번호
		String[] prodNo = request.getParameterValues("prodNo");//상품번호리스트
		String[] ForestNameList = request.getParameterValues("ForestNameList");//숲이름리스트
		String[] orderAmountList = request.getParameterValues("orderAmountList");//각 상품수량
		String[] orderPriceList = request.getParameterValues("orderPriceList"); //각 상품의 가격
		
		
//		
//		for(int i = 0 ; i<prodNo.length ; i++) {
//			System.out.println("prod값" +prodNo[i] );	
//			System.out.println("orderForestName값" +ForestNameList[i]);
//			System.out.println("orderAmountList값" +orderAmountList[i]);
//			
//		}
//		System.out.println("ordersNo 값 " + ordersNo );
		
		//결제완료후 각 상품을 저장 , 장바구니에 담겨있던 상품삭제
		int result = new OrderService().insertOrderDetail(userId, ordersNo, prodNo, ForestNameList , orderAmountList, orderPriceList);
		int result1 = new OrderService().deleteCartOrderList(userId, prodNo);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
