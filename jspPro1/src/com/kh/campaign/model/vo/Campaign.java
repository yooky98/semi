package com.kh.campaign.model.vo;

import java.sql.Date;

public class Campaign {

	private int campNO;
	private String campName;
	private String campContent;
	private String campLocation;
	private Date campDate;
	private int campCapa;
	
	public Campaign() {}

	public Campaign(int campNO, String campName, String campContent, String campLocation, Date campDate, int campCapa) {
		super();
		this.campNO = campNO;
		this.campName = campName;
		this.campContent = campContent;
		this.campLocation = campLocation;
		this.campDate = campDate;
		this.campCapa = campCapa;
	}

	public Campaign(int campNO, String campName, String campLocation, Date campDate) {
		super();
		this.campNO = campNO;
		this.campName = campName;
		this.campLocation = campLocation;
		this.campDate = campDate;
	}

	public Campaign(int campNO, String campName) {
		super();
		this.campNO = campNO;
		this.campName = campName;
	}

	public int getCampNO() {
		return campNO;
	}

	public void setCampNO(int campNO) {
		this.campNO = campNO;
	}

	public String getCampName() {
		return campName;
	}

	public void setCampName(String campName) {
		this.campName = campName;
	}

	public String getCampContent() {
		return campContent;
	}

	public void setCampContent(String campContent) {
		this.campContent = campContent;
	}

	public String getCampLocation() {
		return campLocation;
	}

	public void setCampLocation(String campLocation) {
		this.campLocation = campLocation;
	}

	public Date getCampDate() {
		return campDate;
	}

	public void setCampDate(Date campDate) {
		this.campDate = campDate;
	}

	public int getCampCapa() {
		return campCapa;
	}

	public void setCampCapa(int campCapa) {
		this.campCapa = campCapa;
	}

	@Override
	public String toString() {
		return "Campaign [campNO=" + campNO + ", campName=" + campName + ", campContent=" + campContent
				+ ", campLocation=" + campLocation + ", campDate=" + campDate + ", campCapa=" + campCapa + "]";
	}
	
	
}
