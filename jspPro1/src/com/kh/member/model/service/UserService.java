package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.member.model.dao.UserDao;
import com.kh.member.model.vo.UserVO;

public class UserService {

	UserDao dao;
	public  UserService() {
		dao = new UserDao();
		
	}
	public int join(UserVO vo) {
		Connection conn = getConnection();
		int result = dao.join(conn, vo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int idCheck(UserVO vo) {
		Connection conn = getConnection();
		int result = dao.idCheck(conn, vo);
		close(conn);
		return result;
		
	}
	public String loginCheck(String user_id) {    
		Connection conn = getConnection();
		String result = dao.loginCheck(conn,  user_id);   
		close(conn);
		return result;
	}
	
	public UserVO getUser(String user_id) { 
		Connection conn = getConnection();
		UserVO vo = dao.getUser(conn, user_id); 
		close(conn);
		
		return vo;
	
	}
	public int userUpdate(UserVO vo) {
		Connection conn = getConnection();
		int result = dao.userUpdate(conn, vo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	public int userDelete(String user_id) {    //3 받아온 아이디와 DB와 연결시켜서 dao 로그인 체크로 넘겨준다
		Connection conn = getConnection();
		int result = dao.userDelte(conn, user_id);   //9. dao에서 담긴 result가 넘어온다 
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	public String findId(String user_name, String user_no) {
		
		
		Connection conn = getConnection();
		String result = dao.findId(conn,  user_name, user_no); 
		close(conn); 
		return result;
	}
	
	public String findPw(String user_name, String user_id, String user_no) {
		Connection conn = getConnection();
		String result = dao.findPw(conn, user_name, user_id, user_no);  	
		close(conn);
		return result;
	}
	public String PwCheck(String user_id) {
		Connection conn = getConnection();
		String result = dao.pwCheck(conn,  user_id);  
		close(conn);
		return result;
	}
	public int findPwUpdate(String user_pw, String user_id) {
		Connection conn = getConnection();
		int result = dao.findPwUpdate(conn, user_pw, user_id);   
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	
}
