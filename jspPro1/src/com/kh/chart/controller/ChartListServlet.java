package com.kh.chart.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.product.model.service.ProductService;

/**
 * Servlet implementation class ChartListServlet
 */
@WebServlet("/list.chart")
public class ChartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChartListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		카테고리별 차트
		HashMap<String,Integer> ca_list = new ProductService().selectChList();
		
//		판매 제품별 차트
		HashMap<String,Integer> pd_list = new ProductService().selectPdChList();
		
//		숲 별 차트
		HashMap<String,Integer> fr_list = new ProductService().selectFrList();
		
		request.setAttribute("ca_list", ca_list);
		request.setAttribute("pd_list", pd_list);
		request.setAttribute("fr_list", fr_list);
		
		request.getRequestDispatcher("views/chart/chartListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
