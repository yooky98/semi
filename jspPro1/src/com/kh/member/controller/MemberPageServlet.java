package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberPageServlet
 */
@WebServlet("/mypage.me")
public class MemberPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		String userId = loginUser.getUserId();
		
		Member member = new MemberService().selectMember(userId);
		
		System.out.println("member : " + member);
		
		RequestDispatcher view = null;
		if(member != null) {
			request.setAttribute("loginUser", member);
			view = request.getRequestDispatcher("views/member/myPage.jsp");
		}else {
			
			request.setAttribute("msg", "로그인에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp");
			
			
		
			
		}
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
