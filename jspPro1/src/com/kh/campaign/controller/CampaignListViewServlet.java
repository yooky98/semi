package com.kh.campaign.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.campaign.model.service.CampService;
import com.kh.campaign.model.vo.Campaign;

/**
 * Servlet implementation class CampaignListViewServlet
 */
@WebServlet("/list.cam")
public class CampaignListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CampaignListViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Campaign> campList = new CampService().selectCampList();
		ArrayList<Campaign> endedList = new CampService().selectEndedList();
		
		
		if(campList != null || endedList != null) {
			request.setAttribute("campList", campList);
			request.setAttribute("endedList", endedList);
			request.getRequestDispatcher("views/campaign/campaignListView.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "캠페인 조회에 실패하였습니다.");
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
