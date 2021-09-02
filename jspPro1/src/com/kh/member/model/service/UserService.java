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
	public String loginCheck(String user_id) {    //3 받아온 아이디와 DB와 연결시켜서 dao 로그인 체크로 넘겨준다
		Connection conn = getConnection();
		String result = dao.loginCheck(conn,  user_id);   //9. dao에서 담긴 result가 넘어온다 
		return result;
	}
	
	public UserVO getUser(String user_id) { 
		Connection conn = getConnection();
		
		return dao.getUser(conn,  user_id);
	}
	
	
}
