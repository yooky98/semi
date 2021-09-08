package com.kh.admin.adminAnswer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.adminAnswer.service.AnswerService;
import com.kh.question.model.vo.QNA;

/**
 * Servlet implementation class AnswerUpdateServlet
 */
@WebServlet("/updateAns.ad")
public class AnswerUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		String ansContent = request.getParameter("answer");
		
		QNA qna = new QNA();
		qna.setQuesNo(qnaNo);
		qna.setAnsContent(ansContent.replaceAll("\n", "<br>"));
		
		int result = new AnswerService().updateAns(qna);
		if(result > 0) {
			//request.getSession().setAttribute("msg", "1:1문의 답변 수정 완료");
			response.sendRedirect("answerList.ad");
		}else {
			request.setAttribute("msg", "1:1문의 답변 수정 실패");
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
