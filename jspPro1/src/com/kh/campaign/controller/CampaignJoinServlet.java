package com.kh.campaign.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.campaign.model.service.CampService;
import com.kh.member.model.vo.UserVO;

/**
 * Servlet implementation class CampaignJoinServlet
 */
@WebServlet("/join.cam")
public class CampaignJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CampaignJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int campNo = Integer.parseInt(request.getParameter("campNo"));
		String userId = ((UserVO)request.getSession().getAttribute("loginUser")).getUser_id();
		
		int checkResult = new CampService().checkJoin(campNo, userId);
		
		PrintWriter out = response.getWriter();
		
		if(checkResult > 0) {
			out.print("fail");
		}else {
			int insertResult = new CampService().insertCampJoin(campNo, userId);
			
			if(insertResult > 0) {
				out.print("success");
			}else {
				request.setAttribute("msg", "캠페인 참여에 실패했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
		
		out.flush();
		out.close();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
