package com.kh.admin.adminOrder.model.vo;

public class adminOrderDetail {

	private int orderDetailNo;
	private int orderNo;
	private int prodNo;
	private String userId;
	private int orderAmount;
	private int ordersPrice;
	private int ordersStatus;
	private String forestName;
	
	public adminOrderDetail() {
		// TODO Auto-generated constructor stub
	}

	public adminOrderDetail(int orderDetailNo, int orderNo, int prodNo, String userId, int orderAmount, int ordersPrice,
			int ordersStatus, String forestName) {
		super();
		this.orderDetailNo = orderDetailNo;
		this.orderNo = orderNo;
		this.prodNo = prodNo;
		this.userId = userId;
		this.orderAmount = orderAmount;
		this.ordersPrice = ordersPrice;
		this.ordersStatus = ordersStatus;
		this.forestName = forestName;
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

	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

	public int getOrdersPrice() {
		return ordersPrice;
	}

	public void setOrdersPrice(int ordersPrice) {
		this.ordersPrice = ordersPrice;
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
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "adminOrderDetail -> [orderDetailNo : " + orderDetailNo + ", orderNo : " + orderNo
				+ ", prodNo : " + prodNo + ", userId : " + userId
				+ ", orderAmount : " + orderAmount + ", ordersPrice : " + ordersPrice
				+ ", ordersStatus : " + ordersStatus + ", forestName : " + forestName+ " ]";
	}
	
	
}
