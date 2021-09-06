package com.kh.wish.model.vo;

public class Wish {
	private int wishNo;
	private String userID;
	private int prodNo;
	
	public Wish() {
		// TODO Auto-generated constructor stub
	}

	public Wish(int wishNo, String userID, int prodNo) {
		super();
		this.wishNo = wishNo;
		this.userID = userID;
		this.prodNo = prodNo;
	}

	public int getWishNo() {
		return wishNo;
	}

	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	@Override
	public String toString() {
		return "Wish [wishNo=" + wishNo + ", userID=" + userID + ", prodNo=" + prodNo + "]";
	}
	
	
}
