package com.kh.wish.model.vo;

public class Wish {
	private int wishNo;
	private String userID;
	private int prodNo;
	private int prodPrice;
	private String prodName;
	private String changeName;
	
	public Wish() {
		// TODO Auto-generated constructor stub
	}

	public Wish(int wishNo, String userID, int prodNo) {
		super();
		this.wishNo = wishNo;
		this.userID = userID;
		this.prodNo = prodNo;
	}



	public Wish(int wishNo, int prodNo,  String prodName, int prodPrice ,String changeName ) {
		super();
		this.wishNo = wishNo;
		this.prodNo = prodNo;
		this.prodPrice = prodPrice;
		this.prodName = prodName;
		this.changeName = changeName;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
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
