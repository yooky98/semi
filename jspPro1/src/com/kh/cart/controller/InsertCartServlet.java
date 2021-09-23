package com.kh.cart.controller;

import java.io.IOException;
import java.util.ArrayList;

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

			UserVO loginUser = (UserVO) session.getAttribute("loginUser");

			// 로그인 안했을때
			if (loginUser == null) {
				request.getSession().setAttribute("msg", "로그인후 이용 가능합니다.");
				RequestDispatcher view = request.getRequestDispatcher("views/member/login.jsp");
				view.forward(request, response);
			}

			// 로그인 했을때
			String userId = ((UserVO) request.getSession().getAttribute("loginUser")).getUser_id();

			// 내가 담고싶은 상품의 번호
			int ProdNo = (Integer.parseInt((mr.getParameter("prodNo"))));
			System.out.println("ProdNo ==>" + ProdNo);

			c.setUserId(userId);
			c.setProdNo(Integer.parseInt((mr.getParameter("prodNo"))));
			c.setCartAmount(Integer.parseInt((mr.getParameter("count"))));
			c.setForestName(mr.getParameter("forest"));

			// 내 db에 상품번호를 전부 가져오기
			ArrayList<Cart> prodNoList = new CartService().selectPordNo(userId); // 상품번호 가져옴
			int a = 0;
			for (int i = 0; i < prodNoList.size(); i++) {

				if (prodNoList.get(i).getProdNo() == ProdNo) {

					a = 1;

					break;
				}
			}
			if (a == 1) {

				request.getSession().setAttribute("msg", "장바구니에  상품이 존재합니다.");
				RequestDispatcher view = request.getRequestDispatcher("/list.cart");
				view.forward(request, response);

			} else {

				// 상품 insert
				int result = new CartService().insertCart(c);

				if (result > 0) {
					request.getSession().setAttribute("msg", "장바구니에  담았습니다.");

					RequestDispatcher view = request.getRequestDispatcher("/list.pr");
					view.forward(request, response);

				} else {
					request.getSession().setAttribute("msg", "장바구니에 상품을 담지 못했습니다.");
					RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
					view.forward(request, response);

				}
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
