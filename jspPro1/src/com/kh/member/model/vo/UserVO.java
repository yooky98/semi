package com.kh.member.model.vo;

public class UserVO {
	
	private String user_id;
	private String user_pw;
	private String user_pwCheck;
	private String user_name;
	private String user_no;
	private String gender;
	private String address;
	private String phone;
	private String email;
	private String enroll;
	private int point;
	
	public UserVO(String user_id, String user_pw, String user_name, String user_no, String gender, 
			String address, String phone, String email, String enroll, int point ) {
		
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_no = user_no;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.enroll = enroll;
		this.point = point;
	}

	public UserVO(String user_id, String user_pw,String user_pwCheck, String user_name, String user_no, String gender, 
			String address, String phone, String email ) {
		
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_pwCheck = user_pwCheck;
		this.user_name = user_name;
		this.user_no = user_no;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
		this.email = email;
		
	}
	
	
	public String getUser_pwCheck() {
		return user_pwCheck;
	}

	public void setUser_pwCheck(String user_pwCheck) {
		this.user_pwCheck = user_pwCheck;
	}

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_no() {
		return user_no;
	}
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEnroll() {
		return enroll;
	}
	public void setEnroll(String enroll) {
		this.enroll = enroll;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	

}
