package com.kh.forest.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.forest.model.service.ForestService;

/**
 * Servlet implementation class MainForestServlet
 */
@WebServlet("/forest.ma")
public class MainForestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainForestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int forestCount = new ForestService().forestCount();
		int treeCount = new ForestService().totalTreeCount();
		
		int[] countArr = new int[2];
		
		countArr[0] = forestCount;
		countArr[1] = treeCount;
		
		response.setContentType("applicatoin/json; charset=utf-8");
		
		new Gson().toJson(countArr, response.getWriter());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
