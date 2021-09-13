package com.kh.campaign.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.campaign.model.service.CampService;
import com.kh.member.model.vo.UserVO;

/**
 * Servlet implementation class CampaignDeleteJoinServlet
 */
@WebServlet("/deleteJoin.cam")
public class CampaignDeleteJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CampaignDeleteJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int campNo = Integer.parseInt(request.getParameter("campNo"));
		String userId = ((UserVO)request.getSession().getAttribute("loginUser")).getUser_id();
		
		int result = new CampService().deleteJoin(campNo, userId);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "캠페인 참여신청이 취소되었습니다.");
			response.sendRedirect("mypage.cam");
		}else {
			request.setAttribute("msg", "캠페인 참여신청 취소에 실패했습니다.");
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
