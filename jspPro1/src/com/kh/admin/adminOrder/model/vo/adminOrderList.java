package com.kh.admin.adminOrder.model.vo;

import java.util.Date;

public class adminOrderList {

	private int orderDetailNo;	
	private String prodName;
	private String userId;
	private Date orderDate;
	private int orderAmount;
	private int ordersStatus;
	
	//추가로 주문 상세정보 modal에서 사용할 정보
	private int orderNo;
	private int prodNo;
	private int ordersPrice;
	private String forestName;
	
	public adminOrderList() {
		// TODO Auto-generated constructor stub
	}
	
	public adminOrderList(int orderDetailNo, String prodName, String userId, Date orderDate, int orderAmount,
			int ordersStatus, int orderNo, int prodNo, int ordersPrice, String forestName) {
		super();
		this.orderDetailNo = orderDetailNo;
		this.prodName = prodName;
		this.userId = userId;
		this.orderDate = orderDate;
		this.orderAmount = orderAmount;
		this.ordersStatus = ordersStatus;
		this.orderNo = orderNo;
		this.prodNo = prodNo;
		this.ordersPrice = ordersPrice;
		this.forestName = forestName;
	}

	public int getOrderDetailNo() {
		return orderDetailNo;
	}

	public void setOrderDetailNo(int orderDetailNo) {
		this.orderDetailNo = orderDetailNo;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

	public int getOrdersStatus() {
		return ordersStatus;
	}

	public void setOrdersStatus(int ordersStatus) {
		this.ordersStatus = ordersStatus;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public int getOrdersPrice() {
		return ordersPrice;
	}

	public void setOrdersPrice(int ordersPrice) {
		this.ordersPrice = ordersPrice;
	}

	public String getForestName() {
		return forestName;
	}

	public void setForestName(String forestName) {
		this.forestName = forestName;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "adminOrderList -> [orderDetailNo : " + orderDetailNo + ", prodName : " + prodName
				 + ", userId : " + userId + ", orderDate : " + orderDate
				 + ", orderAmount : " + orderAmount + ", ordersStatus : " + ordersStatus
				 + ", orderNo : " + orderNo + ", prodNo : " + prodNo 
				 + ", ordersPrice : " + ordersPrice + ", forestName : " + forestName + " ]";
	}
	
	
	
}
