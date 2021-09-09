package com.kh.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.UserVO;
import com.kh.question.model.service.QuesService;
import com.kh.question.model.vo.QNA;

/**
 * Servlet implementation class QuestionEnrollServlet
 */
@WebServlet("/enroll.que")
public class QuestionEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = ((UserVO)request.getSession().getAttribute("loginUser")).getUser_id();
		
		String qnaTitle = request.getParameter("qnaTitle");
		String qnaContent = request.getParameter("qnaContent").replaceAll("\n", "<br>");
		String qnaCategory = request.getParameter("qnaCategory");
		
		QNA qna = new QNA(qnaTitle, qnaContent, qnaCategory, userId);
		
		int result = new QuesService().insertQuestion(qna);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "문의가 등록되었습니다.");
		}else {
			request.getSession().setAttribute("msg", "문의 등록에 실패하였습니다.");
		}
		
		response.sendRedirect("list.que");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
