package com.kh.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet("*.credu")  //서블릿 호출명
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	
		System.out.println("ControllerServlet");
		
		//파라미터 한글처리.
		request.setCharacterEncoding("utf-8");
		
		
		String url = request.getRequestURI();
		
		System.out.println(url);
		// SHOP/폴더명/요청서블릿.credu
		
		String serv[] = url.split("/	"); 
		
		url = serv[serv.length - 1];
		
		System.out.println(url);
		
		// ;sessionid 값이 있을수 있으므로 한번더 반복작업.
		
		String serv2[] = url.split(";");
		
		url = serv2[0];
		
		
		String site = null;
		
		if(url.equals("review_write.credu")){
			// review_write.credu 요청
			site = "review_write";
			
		}
		else if(url.equals("review.credu")){
			// review.credu 요청
			site = "review";
			
		}
		else if(url.equals("review_read.credu")){
			// review_read.credu 요청
			site = "review_read";
			
			
		}
		else if(url.equals("review_delete.credu")){
			// review_delete.credu 요청
			site = "review_delete";
			
		}
		
		
				
		// 이동(forward)
		RequestDispatcher dis = request.getRequestDispatcher(site);
		dis.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
