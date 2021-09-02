package com.kh.admin.adminProduct.model.vo;

public class adminProduct {

	private int prodNo;
	private String prodName;
	private String prodDetail;
	private String prodCategory;
	private int prodPrice;
	private int prodAmount;
	private String prodStatus;
	private String titleImg;
	
	public adminProduct() {
		// TODO Auto-generated constructor stub
	}

	public adminProduct(int prodNo, String prodName, String prodDetail, String prodCategory, int prodPrice,
			int prodAmount, String prodStatus, String titleImg) {
		super();
		this.prodNo = prodNo;
		this.prodName = prodName;
		this.prodDetail = prodDetail;
		this.prodCategory = prodCategory;
		this.prodPrice = prodPrice;
		this.prodAmount = prodAmount;
		this.prodStatus = prodStatus;
		this.titleImg = titleImg;
	}
	
	//SELECT(리스트 조회)
	public adminProduct(int prodNo, String prodName, String prodCategory, int prodPrice, int prodAmount) {
		super();
		this.prodNo = prodNo;
		this.prodName = prodName;
		this.prodCategory = prodCategory;
		this.prodPrice = prodPrice;
		this.prodAmount = prodAmount;
	}

	//UPDATE(수정)
	public adminProduct(String prodName, String prodDetail, String prodCategory, int prodPrice, int prodAmount) {
		super();
		this.prodName = prodName;
		this.prodDetail = prodDetail;
		this.prodCategory = prodCategory;
		this.prodPrice = prodPrice;
		this.prodAmount = prodAmount;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getProdDetail() {
		return prodDetail;
	}

	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}

	public String getProdCategory() {
		return prodCategory;
	}

	public void setProdCategory(String prodCategory) {
		this.prodCategory = prodCategory;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	public int getProdAmount() {
		return prodAmount;
	}

	public void setProdAmount(int prodAmount) {
		this.prodAmount = prodAmount;
	}

	public String getProdStatus() {
		return prodStatus;
	}

	public void setProdStatus(String prodStatus) {
		this.prodStatus = prodStatus;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "adminProduct -> [prodNo : " + prodNo + ", prodName : " + prodName
				+ ", \nprodDetail : " + prodDetail + ", \nprodCategory : " + prodCategory
				+ ", prodPrice : " + prodPrice + ", prodAmount : " + prodAmount
				+ ", prodStatus : " + prodStatus + ", titleImg : " + titleImg+ " ]";
	}
	
	
}
