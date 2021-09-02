package com.kh.product.model.vo;

public class Attachment {

	private int fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private int ref_pno;
	
	public Attachment() {
		// TODO Auto-generated constructor stub
	}

	public Attachment(int fileNo, String originName, String changeName, String filePath, int ref_pno) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.ref_pno = ref_pno;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getRef_pno() {
		return ref_pno;
	}

	public void setRef_pno(int ref_pno) {
		this.ref_pno = ref_pno;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Attachment -> [ fileNo : " + fileNo + ", originName : " + originName
				+ ", changeName : " + changeName + ", filePath : " + filePath
				+ ", ref_pno : " + ref_pno +" ]";
	}
	
	
}
