package com.kh.cart.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.cart.model.service.CartService;
import com.kh.cart.model.vo.Cart;
import com.kh.common.ImgFileRenamePolicy;
import com.kh.member.model.vo.UserVO;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertCartServlet
 */
@WebServlet("/insert.cart")
public class InsertCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertCartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (ServletFileUpload.isMultipartContent(request)) {

			// 파일 경로
			String savePath = request.getServletContext().getRealPath("/resources/images");

			// 파일 크기
			int fileSize = 1024 * 1024 * 15;

			MultipartRequest mr = new MultipartRequest(request, savePath, fileSize, "utf-8", new ImgFileRenamePolicy());
			HttpSession session = request.getSession();
			
			Cart c = new Cart();

			String userId = ((UserVO) request.getSession().getAttribute("loginUser")).getUser_id();
			UserVO loginUser = (UserVO) session.getAttribute("loginUser");
			  
			if(loginUser == null) {
				request.setAttribute("msg", "Giftree회원이 아닙니다.");
				RequestDispatcher view = request.getRequestDispatcher("views/member/login.jsp");
				view.forward(request, response);
			}//뭐여..
			
			c.setUserId(userId);
			c.setProdNo(Integer.parseInt((mr.getParameter("prodNo"))));
			c.setCartAmount(Integer.parseInt((mr.getParameter("count"))));
			c.setForestName(mr.getParameter("forest"));
			

//			System.out.println("user_id = " + userId);
//			System.out.println("prodNo =" + c.getProdNo());
//			System.out.println("prodNo =" + c.getCartAmount());
//			System.out.println("prodNo =" + c.getForestName());

			int result = new CartService().insertCart(c);

			if (result > 0) {
				request.getSession().setAttribute("msg", "장바구니 담기 성공");
				response.sendRedirect("list.pr");

			} else {
				request.setAttribute("msg", "장바구니 상품담기 실패");

				RequestDispatcher view = request.getRequestDispatcher("views/member/errorPage.jsp");
				view.forward(request, response);

			}
		}

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
