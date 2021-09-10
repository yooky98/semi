package com.kh.question.model.vo;

public class QnaCategory {

	private int categoryNo;
	private String categoryName;
	
	public QnaCategory() {}

	public QnaCategory(int categoryNo, String categoryName) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
	}

	
	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "QnaCategory [categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
	}
	
}
