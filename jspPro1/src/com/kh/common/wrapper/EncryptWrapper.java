package com.kh.common.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;


public class EncryptWrapper extends HttpServletRequestWrapper {

	
	public EncryptWrapper(HttpServletRequest request) {
		super(request);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String getParameter(String key) {
		String value = "";
		
		if(key != null && (key.equals("userPwd")||key.equals("newPwd"))) {
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-512");
				
				byte[] bytes = super.getParameter(key).getBytes(Charset.forName("UTF-8"));//전달받은 비밀번호를 바이트 배열로 받아주기
				md.update(bytes);
				value = java.util.Base64.getEncoder().encodeToString(md.digest());//java.util.base64인코더를 이용해서 암호화된 바이트 배열을 인코딩 과정을 통해 문자열로 출력
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return super.getParameter(key);
	}
	
	
	
	
}
