package com.kh.product.model.vo;

public class Product {
	private int prodNo;
	private String prodName;
	private String prodDetail;
	private String prodCategory;
	private int prodPrice;
	private int prodAmount;
	private String prodStatus;
	
	private String titleImg;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int prodNo, String prodName, String prodDetail, String prodCategory, int prodPrice, int prodAmount,
			String prodStatus) {
		super();
		this.prodNo = prodNo;
		this.prodName = prodName;
		this.prodDetail = prodDetail;
		this.prodCategory = prodCategory;
		this.prodPrice = prodPrice;
		this.prodAmount = prodAmount;
		this.prodStatus = prodStatus;
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
		return super.toString();
	}

	
	
	
}
