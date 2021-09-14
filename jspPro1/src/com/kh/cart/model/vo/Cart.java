package com.kh.cart.model.vo;

import com.kh.product.model.vo.Product;

public class Cart {

	private int cartNo; //장바구니 번호
	private String userId; //회원 아이디
	private int prodNo; //상품번호
	private int cartAmount; //주문개수
	private String forestName; //숲이름
	private String prodName;// 제품이름
	private int prodPrice; //제품가격
	private String changName; //이미지

	public Cart() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Cart(int cartNo, String userId, int prodNo, int cartAmount, String forestName, String prodName,
			int prodPrice , String changName) {
	
		super();
		this.cartNo = cartNo;
		this.userId = userId;
		this.prodNo = prodNo;
		this.cartAmount = cartAmount;
		this.forestName = forestName;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.changName = changName;
		
	}


	public Cart(int cartNo, String userId, int prodNo, int cartAmount, String forestName) {
		super();
		this.cartNo = cartNo;
		this.userId = userId;
		this.prodNo = prodNo;
		this.cartAmount = cartAmount;
		this.forestName = forestName;

	}


	public Cart(int prodNo, int cartAmount, String forestName, String prodName, int prodPrice , String changName) {
		super();
		this.prodNo = prodNo;
		this.cartAmount = cartAmount;
		this.forestName = forestName;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.changName = changName;
	}



	public Cart(int cartNo) {
		super();
		this.cartNo = cartNo;
	}



	public String getChangName() {
		return changName;
	}

	public void setChangName(String changName) {
		this.changName = changName;
	}

	public String getProdName() {
		return prodName;
	}



	public void setProdName(String prodName) {
		this.prodName = prodName;
	}



	public int getProdPrice() {
		return prodPrice;
	}



	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}



	public int getCartNo() {
		return cartNo;
	}


	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
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


	public int getCartAmount() {
		return cartAmount;
	}


	public void setCartAmount(int cartAmount) {
		this.cartAmount = cartAmount;
	}


	public String getForestName() {
		return forestName;
	}


	public void setForestName(String forestName) {
		this.forestName = forestName;
	}
	
/*	//제품 (null 방지)
	public Product getProduct() {
		
		if(product == null)
			product = new Product();
		return product;
		
	}

	public void setProduct(Product product) {
		this.product = product;
	}*/


	
}
