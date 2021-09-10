package com.kh.admin.adminOrder.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kh.admin.adminOrder.model.service.adminOrderService;
import com.kh.admin.adminOrder.model.vo.adminOrderList;

/**
 * Servlet implementation class adminOrderSearchServlet
 */
@WebServlet("/orderSearch.ad")
public class adminOrderSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminOrderSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<adminOrderList> list = new adminOrderService().selectList();
		
		int searchOption = Integer.parseInt(request.getParameter("searchOption"));
		String searchTitle = request.getParameter("searchTitle");
		
		JSONArray searchList = new JSONArray();
		JSONObject searchObj = null;
		
		for(adminOrderList aol : list) {
			switch(searchOption) {
			case 10 :
				if(String.valueOf(aol.getOrderDetailNo()).contains(String.valueOf(searchOption))) {
					searchObj = new JSONObject();
					
					searchObj.put("orderDetailNo", aol.getOrderDetailNo());
					searchObj.put("orderNo", aol.getOrderNo());
					searchObj.put("prodName", aol.getProdName());
					searchObj.put("userId", aol.getUserId());
					searchObj.put("orderDate", aol.getOrderDate());
					searchObj.put("orderAmount", aol.getOrderAmount());
					searchObj.put("ordersStatus", aol.getOrdersStatus());
					
					searchList.add(searchObj);
				}
				break;
			case 20 :
				if(aol.getUserId().contains(searchTitle)) {
					searchObj.put("orderDetailNo", aol.getOrderDetailNo());
					searchObj.put("orderNo", aol.getOrderNo());
					searchObj.put("prodName", aol.getProdName());
					searchObj.put("userId", aol.getUserId());
					searchObj.put("orderDate", aol.getOrderDate());
					searchObj.put("orderAmount", aol.getOrderAmount());
					searchObj.put("ordersStatus", aol.getOrdersStatus());
					
					searchList.add(searchObj);
				}
				break;
			default : 
				break;
			}
			
			
		}
		
		
		JSONObject searchMap = null;
		
		if(String.valueOf(searchOption) != null && searchTitle != null && searchList != null) {
			searchMap = new JSONObject();
			
			searchMap.put("searchList", searchList);
			searchMap.put("searchTitle", searchTitle);
			searchMap.put("searchOption", searchOption);
		}
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(searchMap);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
