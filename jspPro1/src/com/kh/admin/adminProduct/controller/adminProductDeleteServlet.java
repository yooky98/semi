package com.kh.admin.adminProduct.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.adminProduct.model.service.adminProductService;

/**
 * Servlet implementation class adminProductDeleteServlet
 */
@WebServlet("/deleteProd.ad")
public class adminProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminProductDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		//System.out.println("삭제할 서블릿에서 넘어온 prodNo : " + prodNo);
		int result = new adminProductService().deleteProduct(prodNo);
		//System.out.println("삭제 result : " + result);
		
		if(result > 0) {
			response.sendRedirect("prodList.ad");
		}else {
			request.getSession().setAttribute("msg", "제품 삭제 실패");
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
