package com.kh.question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.question.model.service.QuesService;
import com.kh.question.model.vo.QnaCategory;

/**
 * Servlet implementation class QuestionEnrollFormServlet
 */
@WebServlet("/enrollForm.que")
public class QuestionEnrollFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionEnrollFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<QnaCategory> cateoryList = new QuesService().selectCategory();
		
		if(cateoryList != null) {
			request.setAttribute("cateoryList", cateoryList);
			request.getRequestDispatcher("views/mypage/question/questionEnrollForm.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "카테고리 불러오기에 실패했습니다.");
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
