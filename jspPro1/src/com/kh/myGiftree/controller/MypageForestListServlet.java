package com.kh.myGiftree.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.UserVO;
import com.kh.myGiftree.model.service.ForestService;
import com.kh.myGiftree.model.vo.Forest;

/**
 * Servlet implementation class MypageForestListServlet
 */
@WebServlet("/forestList.my")
public class MypageForestListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageForestListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = ((UserVO)request.getSession().getAttribute("loginUser")).getUser_id();
		
		ArrayList<Forest> forestList = new ForestService().selectFList(userId);
		int count = new ForestService().treeCount(userId);
		
		if(forestList != null) {
			request.setAttribute("forestList", forestList);
			request.setAttribute("count", count);
			request.getRequestDispatcher("views/mypage/myPageMain.jsp").forward(request, response);
		}else {
			
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
