package com.kh.admin.adminProduct.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.adminProduct.model.service.adminProductService;
import com.kh.admin.adminProduct.model.vo.adminProduct;
import com.kh.product.model.vo.Attachment;

/**
 * Servlet implementation class adminProductUpdateFormServlet
 */
@WebServlet("/updateProdForm.ad")
public class adminProductUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminProductUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//jsp에서 보낸 prodNo를 먼저 받음
		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		
		//전달받은 prodNo에 해당하는 PRODUCT와 ATTACHMENT의 정보를 조회
		adminProduct ap = new adminProductService().selectUpdateProduct(prodNo);
		Attachment at = new adminProductService().selectAttachment(prodNo);
		
		if(ap.getProdDetail() != null) {
			ap.setProdDetail((ap.getProdDetail()).replaceAll("<br>", "\n"));
		}
		
		//System.out.println("서블릿prodNo : " + prodNo);
		//System.out.println("서블릿ap : " + ap);
		//System.out.println("서블릿at : " + at);
		//System.out.println("prodDetail : " + ap.getProdDetail());
		
		//전달받은 정보를 수정할 화면으로 넘겨줌
		if(ap != null && at != null) {
			request.setAttribute("ap", ap);
			request.setAttribute("at", at);
			request.getRequestDispatcher("views/admin/adminProduct/adminProductUpdateForm.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("msg", "수정할 제품 불러오기 실패\nPRODUCT랑 ATTACHMENT FK맞춰야함");
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
