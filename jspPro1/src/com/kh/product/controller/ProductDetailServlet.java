package com.kh.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.product.model.service.ProductService;
import com.kh.product.model.vo.Product;

/**
 * Servlet implementation class ProductDetailServlet
 */
@WebServlet("/detail.pr")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pNo = Integer.parseInt(request.getParameter("pNo"));

		Product p = new ProductService().selectProduct(pNo);
		ArrayList<Product> list = new ProductService().selectPrList();
		
		
		if(p!=null && list!=null) {
			request.setAttribute("list", list);
			request.setAttribute("p", p);
			RequestDispatcher view = request.getRequestDispatcher("views/product/productDetailView.jsp");
			view.forward(request, response);
		} else if(p==null){
			request.setAttribute("msg", "제품 상세보기에 실패함");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		} else {
			request.setAttribute("msg", "제품 리스트 가져오기에 실패함");
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
