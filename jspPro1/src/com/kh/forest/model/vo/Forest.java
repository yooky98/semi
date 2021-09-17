package com.kh.forest.model.vo;

public class Forest {

	private String forestName;
	private String forestLocation;
	private String forestSite;
	private int treeQuantity;
	
	public Forest() {}

	public Forest(String forestName, String forestLocation, String forestSite, int treeQuantity) {
		super();
		this.forestName = forestName;
		this.forestLocation = forestLocation;
		this.forestSite = forestSite;
		this.treeQuantity = treeQuantity;
	}
	

	public Forest(String forestName, String forestLocation, int treeQuantity) {
		super();
		this.forestName = forestName;
		this.forestLocation = forestLocation;
		this.treeQuantity = treeQuantity;
	}

	public String getForestName() {
		return forestName;
	}

	public void setForestName(String forestName) {
		this.forestName = forestName;
	}

	public String getForestLocation() {
		return forestLocation;
	}

	public void setForestLocation(String forestLocation) {
		this.forestLocation = forestLocation;
	}

	public int getTreeQuantity() {
		return treeQuantity;
	}

	public void setTreeQuantity(int treeQuantity) {
		this.treeQuantity = treeQuantity;
	}
	

	public String getForestSite() {
		return forestSite;
	}

	public void setForestSite(String forestSite) {
		this.forestSite = forestSite;
	}

	@Override
	public String toString() {
		return "Forest [forestName=" + forestName + ", forestLocation=" + forestLocation + ", forestSite=" + forestSite
				+ ", treeQuantity=" + treeQuantity + "]";
	}

}
