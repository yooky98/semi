package com.kh.admin.adminOrder.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.adminOrder.model.service.adminOrderService;
import com.kh.admin.adminOrder.model.vo.adminOrder;
import com.kh.admin.adminOrder.model.vo.adminOrderList;

/**
 * Servlet implementation class adminOrderListViewServlet
 */
@WebServlet("/orderList.ad")
public class adminOrderListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminOrderListViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<adminOrderList> list = new adminOrderService().selectList();
		ArrayList<adminOrder> orderList = new adminOrderService().selectOrderList();
		
		request.setAttribute("orderList", orderList);
		request.setAttribute("list", list);
		//System.out.println("받은orderList : " + orderList);
		//System.out.println("받은list : " + list);
		
		request.getRequestDispatcher("views/admin/adminOrder/adminOrderList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
