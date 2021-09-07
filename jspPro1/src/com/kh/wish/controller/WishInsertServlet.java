package com.kh.wish.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.wish.model.service.WishService;
import com.kh.wish.model.vo.Wish;

/**
 * Servlet implementation class WishInsertServlet
 */
@WebServlet("/insert.ws")
public class WishInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		String userId = request.getParameter("userId");
		// 혹은 여기에서 세션접근해서 가져와도 무관함
		Wish w = new Wish();
		w.setProdNo(pNo);
		w.setUserID(userId);
		
		int result = new WishService().insertWish(w);
		
		PrintWriter out = response.getWriter();
		
		if(result>0) {
			out.print("success");
		} else {
			out.print("fail");
		}
		
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
