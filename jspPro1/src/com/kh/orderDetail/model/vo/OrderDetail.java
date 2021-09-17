package com.kh.orderDetail.model.vo;

import java.util.Date;

public class OrderDetail {
	
	private int orderDetailNo;
	private int orderNo;
	private int prodNo;
	private String userId;
	private int ordersAmount;
	private int ordersStatus;
	private String forestName;
	private String prodName;
	private Date ordersDate;
	private int ordersPrice;
	private String changeName;
	
	public OrderDetail() {
		// TODO Auto-generated constructor stub
	}



	public OrderDetail(int orderDetailNo, String prodName, String userId, Date ordersDate, int ordersAmount,  int ordersPrice, int ordersStatus 
		, String changeName	) {
		super();
		this.orderDetailNo = orderDetailNo;
		this.userId = userId;
		this.ordersAmount = ordersAmount;
		this.ordersStatus = ordersStatus;
		this.prodName = prodName;
		this.ordersDate = ordersDate;
		this.ordersPrice = ordersPrice;
		this.changeName = changeName;

	}



	public String getChangeName() {
		return changeName;
	}



	public void setChangeName(String changeName) {
		this.changeName = changeName;
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

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getOrdersAmount() {
		return ordersAmount;
	}

	public void setOrdersAmount(int ordersAmount) {
		this.ordersAmount = ordersAmount;
	}

	public int getOrdersStatus() {
		return ordersStatus;
	}

	public void setOrdersStatus(int ordersStatus) {
		this.ordersStatus = ordersStatus;
	}

	public String getForestName() {
		return forestName;
	}

	public void setForestName(String forestName) {
		this.forestName = forestName;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public Date getOrdersDate() {
		return ordersDate;
	}

	public void setOrdersDate(Date ordersDate) {
		this.ordersDate = ordersDate;
	}

	public int getOrdersPrice() {
		return ordersPrice;
	}

	public void setOrdersPrice(int ordersPrice) {
		this.ordersPrice = ordersPrice;
	}



}

/*ORDER_DETAIL_NO
ORDER_NO
PROD_NO
USER_ID
ORDERS_AMOUNT
ORDERS_PRICE
ORDERS_STATUS
FOREST_NAME*/