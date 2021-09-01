package com.kh.cart.model.vo;

public class Cart {

	private int cartNo; //장바구니 번호
	private String userId; //회원 아이디
	private int prodNo; //상품번호
	private int cartAmount; //주문개수
	private String forestName; //숲이름
	
	
	public Cart() { }
	

	public Cart(int cartNo, String userId, int prodNo, int cartAmount, String forestName) {
		super();
		this.cartNo = cartNo;
		this.userId = userId;
		this.prodNo = prodNo;
		this.cartAmount = cartAmount;
		this.forestName = forestName;
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


	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", userId=" + userId + ", prodNo=" + prodNo + ", cartAmount=" + cartAmount
				+ ", forestName=" + forestName + "]";
	} 
	
	
}
