package com.kh.faq.model.vo;

public class FAQ {

	private int FAQNo;
	private String FAQType;
	private String FAQQues;
	private String FAQAns;
	
	public FAQ() {
		// TODO Auto-generated constructor stub
	}

	public FAQ(int fAQNo, String fAQType, String fAQQues, String fAQAns) {
		super();
		FAQNo = fAQNo;
		FAQType = fAQType;
		FAQQues = fAQQues;
		FAQAns = fAQAns;
	}

	public int getFAQNo() {
		return FAQNo;
	}

	public void setFAQNo(int fAQNo) {
		FAQNo = fAQNo;
	}

	public String getFAQType() {
		return FAQType;
	}

	public void setFAQType(String fAQType) {
		FAQType = fAQType;
	}

	public String getFAQQues() {
		return FAQQues;
	}

	public void setFAQQues(String fAQQues) {
		FAQQues = fAQQues;
	}

	public String getFAQAns() {
		return FAQAns;
	}

	public void setFAQAns(String fAQAns) {
		FAQAns = fAQAns;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	
}
