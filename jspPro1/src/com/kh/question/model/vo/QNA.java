package com.kh.question.model.vo;

import java.sql.Date;

public class QNA {

	private int quesNo;
	private String quesTitle;
	private String quesContent;
	private Date quesDate;
	private String quesCategory; //select 할 때는 카테고리명으로, insert,update 할 때는 카테고리NO로
	private Date ansDate;
	private String ansContent;
	private String userId;
	
	public QNA() {
	}
	

	public QNA(int quesNo, String quesTitle, String quesContent, Date quesDate, String quesCategory, Date ansDate,
			String ansContent, String userId) {
		super();
		this.quesNo = quesNo;
		this.quesTitle = quesTitle;
		this.quesContent = quesContent;
		this.quesDate = quesDate;
		this.quesCategory = quesCategory;
		this.ansDate = ansDate;
		this.ansContent = ansContent;
		this.userId = userId;
	}


	public QNA(String quesTitle, String quesContent, String quesCategory, String userId) {
		super();
		this.quesTitle = quesTitle;
		this.quesContent = quesContent;
		this.quesCategory = quesCategory;
		this.userId = userId;
	}
	
	
	public QNA(int quesNo, String quesTitle, String quesContent, String quesCategory) {
		super();
		this.quesNo = quesNo;
		this.quesTitle = quesTitle;
		this.quesContent = quesContent;
		this.quesCategory = quesCategory;
	}


	public String getQuesCategory() {
		return quesCategory;
	}

	public void setQuesCategory(String quesCategory) {
		this.quesCategory = quesCategory;
	}


	public int getQuesNo() {
		return quesNo;
	}

	public void setQuesNo(int quesNo) {
		this.quesNo = quesNo;
	}

	public String getQuesTitle() {
		return quesTitle;
	}

	public void setQuesTitle(String quesTitle) {
		this.quesTitle = quesTitle;
	}

	public String getQuesContent() {
		return quesContent;
	}

	public void setQuesContent(String quesContent) {
		this.quesContent = quesContent;
	}

	public Date getQuesDate() {
		return quesDate;
	}

	public void setQuesDate(Date quesDate) {
		this.quesDate = quesDate;
	}

	public Date getAnsDate() {
		return ansDate;
	}

	public void setAnsDate(Date ansDate) {
		this.ansDate = ansDate;
	}

	public String getAnsContent() {
		return ansContent;
	}

	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}


	@Override
	public String toString() {
		return "QNA [quesNo=" + quesNo + ", quesTitle=" + quesTitle + ", quesContent=" + quesContent + ", quesDate="
				+ quesDate + ", quesCategory=" + quesCategory + ", ansDate=" + ansDate + ", ansContent=" + ansContent
				+ ", userId=" + userId + "]";
	}

	
}
