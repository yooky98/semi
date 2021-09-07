package com.kh.review.model.vo;

import java.util.Date;

public class Review {

	private int review_num; // 글 번호
	private String user_id; // 작성자 ID
	private String prod_no; // 상품번호
	private String review_title; // 리뷰 제목
	private String review_content; // 리뷰 내용
	private int review_cnt; // 조회수
	private int review_star; // 별점
	private int review_buy_opt; // 구매여부 0 : X 1 : 구매
	private Date review_regdate; // 리뷰 작성일

	
	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getProd_no() {
		return prod_no;
	}

	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getReview_cnt() {
		return review_cnt;
	}

	public void setReview_cnt(int review_cnt) {
		this.review_cnt = review_cnt;
	}

	public int getReview_star() {
		return review_star;
	}

	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}

	public int getReview_buy_opt() {
		return review_buy_opt;
	}

	public void setReview_buy_opt(int review_buy_opt) {
		this.review_buy_opt = review_buy_opt;
	}

	public Date getReview_regdate() {
		return review_regdate;
	}

	public void setReview_regdate(Date review_regdate) {
		this.review_regdate = review_regdate;
	}
	
}
