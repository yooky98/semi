package com.kh.order.model.vo;

public class Order {

	private int orderNo;
	private String userId;
	private String orderName;
	private String orderPhone;
	private String orderAddress;
	private String ordermsg;
	private int totalprice;
	private String orderDate;
	
	public Order() {
		// TODO Auto-generated constructor stub
	}


	public Order(int orderNo, String userId, String orderName, String orderPhone, String orderAddress, String ordermsg,
			int totalprice) {
		super();
		this.orderNo = orderNo;
		this.userId = userId;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderAddress = orderAddress;
		this.ordermsg = ordermsg;
		this.totalprice = totalprice;
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


	public String getOrdermsg() {
		return ordermsg;
	}


	public void setOrdermsg(String ordermsg) {
		this.ordermsg = ordermsg;
	}


	public int getTotalprice() {
		return totalprice;
	}


	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	

	public String getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}


	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", userId=" + userId + ", orderName=" + orderName + ", orderPhone="
				+ orderPhone + ", orderAddress=" + orderAddress + ", ordermsg=" + ordermsg + ", totalprice="
				+ totalprice + "]";
	}
	
	
	
}
