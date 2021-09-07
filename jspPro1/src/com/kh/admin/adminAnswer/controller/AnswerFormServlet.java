package com.kh.admin.adminAnswer.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.admin.adminAnswer.service.AnswerService;
import com.kh.question.model.vo.QNA;

/**
 * Servlet implementation class AnswerFormServlet
 */
@WebServlet("/answerForm.ad")
public class AnswerFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<QNA> list = new AnswerService().selectAnsList();
		
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		System.out.println("qnaNo : " + qnaNo);
		QNA qna = null;
		
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getQuesNo() == qnaNo) {
				qna = list.get(i);			
				
			}
		}		
	
		System.out.println("qna : " + qna);
		if(qna != null) {
			request.setAttribute("qna", qna);
			request.getRequestDispatcher("views/mypage/answer/QNAAnswerForm.jsp").forward(request, response);
		}
		System.out.println("확인");
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
