package com.kh.admin.adminOrder.model.vo;

import java.util.Date;

public class adminOrder {

	private int orderNo;
	private String userId;
	private int prodNo;
	private String orderName;
	private String orderPhone;
	private String orderAddress;
	private String orderMessage;
	private int orderTotalPrice;
	private String orderPay;
	private Date orderDate;
	
	public adminOrder() {
		// TODO Auto-generated constructor stub
	}

	public adminOrder(int orderNo, String userId, int prodNo, String orderName, String orderPhone, String orderAddress,
			String orderMessage, int orderTotalPrice, String orderPay, Date orderDate) {
		super();
		this.orderNo = orderNo;
		this.userId = userId;
		this.prodNo = prodNo;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderAddress = orderAddress;
		this.orderMessage = orderMessage;
		this.orderTotalPrice = orderTotalPrice;
		this.orderPay = orderPay;
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

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
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

	public String getOrderPay() {
		return orderPay;
	}

	public void setOrderPay(String orderPay) {
		this.orderPay = orderPay;
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
				+ ", prodNo : " + prodNo + ", orderName : " + orderName
				+ ", orderPhone : " + orderPhone + ", orderAddress : " + orderAddress
				+ ", orderMessage : " + orderMessage + ", orderTotalPrice : " + orderTotalPrice
				+ ", orderPay : " + orderPay + ", orderDate : " + orderDate + " ]";
	}
	
	
}
