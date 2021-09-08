package com.kh.admin.adminOrder.model.vo;

import java.util.Date;

public class adminOrderList {

	private int orderDetailNo;
	private int orderNo;
	private String prodName;
	private String userId;
	private Date orderDate;
	private int orderAmount;	
	private int ordersStatus;
	
	public adminOrderList() {
		// TODO Auto-generated constructor stub
	}

	public adminOrderList(int orderDetailNo, int orderNo, String prodName, String userId, Date orderDate,
			int orderAmount, int ordersStatus) {
		super();
		this.orderDetailNo = orderDetailNo;
		this.orderNo = orderNo;
		this.prodName = prodName;
		this.userId = userId;
		this.orderDate = orderDate;
		this.orderAmount = orderAmount;
		this.ordersStatus = ordersStatus;
	}

	public int getOrderDetailNo() {
		return orderDetailNo;
	}

	public void setOrderDetailNo(int orderDetailNo) {
		this.orderDetailNo = orderDetailNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "adminOrderList -> [orderDetailNo : " + orderDetailNo + ", orderNo : " + orderNo
				+ ", prodName : " + prodName + ", userId : " + userId
				+ ", orderDate : " + orderDate + ", orderAmount : " + orderAmount
				+ ", ordersStatus : " + ordersStatus + " ]";
	}
	
	
	
}
