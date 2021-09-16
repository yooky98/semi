package com.kh.admin.adminOrder.model.vo;

import java.util.Date;

public class adminOrder {

	private int orderNo;
	private String userId;
	private String orderName;
	private String orderPhone;
	private String orderAddress;
	private String orderMessage;
	private int orderTotalPrice;
	
	private Date orderDate;
	
	public adminOrder() {
		// TODO Auto-generated constructor stub
	}

	public adminOrder(int orderNo, String userId, String orderName, String orderPhone, String orderAddress,
			String orderMessage, int orderTotalPrice, Date orderDate) {
		super();
		this.orderNo = orderNo;
		this.userId = userId;		
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderAddress = orderAddress;
		this.orderMessage = orderMessage;
		this.orderTotalPrice = orderTotalPrice;		
		this.orderDate = orderDate;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public String getOrderMessage() {
		return orderMessage;
	}

	public void setOrderMessage(String orderMessage) {
		this.orderMessage = orderMessage;
	}

	public int getOrderTotalPrice() {
		return orderTotalPrice;
	}

	public void setOrderTotalPrice(int orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "adminOrder -> [orderNo : " + orderNo + ", userId : " + userId
				+ ", orderName : " + orderName
				+ ", orderPhone : " + orderPhone + ", orderAddress : " + orderAddress
				+ ", orderMessage : " + orderMessage + ", orderTotalPrice : " + orderTotalPrice
				+ ", orderDate : " + orderDate + " ]";
	}
	
	
}
