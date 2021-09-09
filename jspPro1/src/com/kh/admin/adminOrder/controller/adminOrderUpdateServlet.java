package com.kh.admin.adminOrder.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.adminOrder.model.service.adminOrderService;
import com.kh.admin.adminOrder.model.vo.adminOrderList;

/**
 * Servlet implementation class adminOrderUpdateServlet
 */
@WebServlet("/orderUpdate.ad")
public class adminOrderUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminOrderUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int orderDetailNo = Integer.parseInt(request.getParameter("orderDetailNo"));
		int selectResult = Integer.parseInt(request.getParameter("selectResult"));
		
		//System.out.println("orderDetailNo:"+orderDetailNo);
		//System.out.println("selectResult:"+selectResult);
		
		int result = new adminOrderService().updateOrder(orderDetailNo, selectResult);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "주문내역 수정 성공");
			response.sendRedirect("orderList.ad");
		}else {
			request.getSession().setAttribute("msg", "주문내역 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
