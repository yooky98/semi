package com.kh.campaign.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.campaign.model.service.CampService;
import com.kh.campaign.model.vo.Campaign;

/**
 * Servlet implementation class CampaignDetailViewServlet
 */
@WebServlet("/detail.cam")
public class CampaignDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CampaignDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int campNo = Integer.parseInt(request.getParameter("campNo"));
		
		Campaign camp = new CampService().selectCampaign(campNo);
		
		if(camp != null) {
			request.setAttribute("camp", camp);
			request.getRequestDispatcher("views/campaign/campaignDetailView.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "캠페인 조회를 실패했습니다.");
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
