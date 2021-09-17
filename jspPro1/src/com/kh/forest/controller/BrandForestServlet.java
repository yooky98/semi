package com.kh.forest.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.forest.model.service.ForestService;
import com.kh.forest.model.vo.Forest;

/**
 * Servlet implementation class BrandForestServlet
 */
@WebServlet("/forest.br")
public class BrandForestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrandForestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Forest> forestList = new ForestService().selectForestList();
		int forestCount = new ForestService().forestCount();
		int treeCount = new ForestService().totalTreeCount();
		
		if(forestList != null) {
			request.setAttribute("forestList", forestList);
			request.setAttribute("forestCount", forestCount);
			request.setAttribute("treeCount", treeCount);
			request.getRequestDispatcher("views/brand/brandView.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "숲리스트 조회에 실패했습니다.");
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
