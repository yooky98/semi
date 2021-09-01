package com.kh.member.model.errorCheck;

import java.util.regex.Pattern;

import com.kh.member.model.service.UserService;
import com.kh.member.model.vo.UserVO;

public class ErrorCheck {
	boolean regCheck = false;
	String msg = "";
	UserService us;
	public ErrorCheck() {
		us = new UserService();
	}
	
	public String errorMsg(UserVO vo) {
		if(us.idCheck(vo)!=0){
			msg = "존재하는 아이디입니다.";
			return msg;
		
		}
		if (vo.getUser_id().equals("") || vo.getUser_pw().equals("") || vo.getUser_pwCheck().equals("")
				|| vo.getUser_name().equals("") || vo.getUser_no().equals("") || vo.getUser_no().equals("-")
				|| vo.getGender().equals("") || vo.getAddress().equals("") || vo.getPhone().equals("")
				|| vo.getEmail().equals("") || vo.getAddress().equals("&&")) {
			msg = "입력하지 않은 정보가 있습니다";
			return msg;
		}
		if (!vo.getUser_pw().equals(vo.getUser_pwCheck())) {
			msg = "비밀번호가 일치하지 않습니다";
			return msg;
		}
		String user_noCheck = "(\\d{6}[ ,-]-?[1-4]\\d{6})|(\\d{6}[ ,-]?[1-4])";
		regCheck = Pattern.matches(user_noCheck, vo.getUser_no());
		if (regCheck == false) {
			msg = "주민등록번호가 잘못 입력 되었습니다";
			return msg;
		}
		String phoneCheck = "(\\d{2,3}[ ,-]-?\\d{2,4}[ ,-]-?\\d{4})";
		regCheck = Pattern.matches(phoneCheck, vo.getPhone());
		if (regCheck == false) {
			msg = "전화번호가 잘못 입력되었습니다(010-****-****)";
			return msg;
		}
		String emailCheck = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		regCheck = Pattern.matches(emailCheck,vo.getEmail());
		if (regCheck == false) {
			msg = "이메일형식이 아닙니다";			
			return msg;			
		}					
		return "";
		
	}

}
