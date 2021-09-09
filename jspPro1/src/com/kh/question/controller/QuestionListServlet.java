package com.kh.question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.UserVO;
import com.kh.question.model.service.QuesService;
import com.kh.question.model.vo.QNA;

/**
 * Servlet implementation class QnaListServlet
 */
@WebServlet("/list.que")
public class QuestionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = ((UserVO)request.getSession().getAttribute("loginUser")).getUser_id();
		
		ArrayList<QNA> qnaList = new QuesService().selectQuesList(userId);
		
		
		if(qnaList != null) {
			request.setAttribute("qnaList", qnaList);
		}else {
			request.setAttribute("message", "문의사항이 없습니다.");
		}
		
		if(qnaList.isEmpty()) {
			request.setAttribute("message", "문의사항이 없습니다.");
		}
		
		
		request.getRequestDispatcher("views/mypage/question/questionListView.jsp").forward(request, response);
		
//		request.getRequestDispatcher("views/mypage/question/questionListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
