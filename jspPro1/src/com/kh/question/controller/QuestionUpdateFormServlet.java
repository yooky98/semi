package com.kh.question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.question.model.service.QuesService;
import com.kh.question.model.vo.QNA;
import com.kh.question.model.vo.QnaCategory;

/**
 * Servlet implementation class QuestionUpdateFormServlet
 */
@WebServlet("/updateForm.que")
public class QuestionUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qno = Integer.parseInt(request.getParameter("qno"));
		
		QNA qna = new QuesService().selectQuestion(qno);
		ArrayList<QnaCategory> cateoryList = new QuesService().selectCategory();
		
		if(qna != null) {
			request.setAttribute("qna", qna);
			request.setAttribute("cateoryList", cateoryList);
			request.getRequestDispatcher("views/mypage/question/questionUpdateForm.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("msg", "문의사항 조회에 실패했습니다.");
			response.sendRedirect("list.que");
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
