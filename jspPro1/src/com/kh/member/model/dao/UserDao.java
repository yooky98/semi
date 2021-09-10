package com.kh.member.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.member.model.vo.UserVO;

public class UserDao {

	private Properties prop = new Properties();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public UserDao() {
		String fileName = UserDao.class.getResource("/sql/member/user-query.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
	
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}

	}
	public int join(Connection conn, UserVO vo) {
		int result = 0 ;
		String sql = prop.getProperty("join");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getUser_id());
			pstmt.setString(2, vo.getUser_pw());
			pstmt.setString(3, vo.getUser_name());
			pstmt.setString(4, vo.getUser_no());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getAddress());
			pstmt.setString(7, vo.getPhone());
			pstmt.setString(8, vo.getEmail());
			
			result = pstmt.executeUpdate(); //실패 = 0  성공 = 1

			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int idCheck(Connection conn, UserVO vo) {
		int result = 0;
		String sql = prop.getProperty("idCheck");
		try {
			pstmt  = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUser_id());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);			
		}
		return result;	
	}
	
	
	public String loginCheck(Connection conn, String user_id) {
		String result = "";                   
		String sql = prop.getProperty("loginCheck"); 
		try {
			pstmt = conn.prepareStatement(sql);  
			
			pstmt.setString(1, user_id);    
		
						
			rs = pstmt.executeQuery();
			
			if(rs.next()) {  
				result = rs.getString(1);  
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;  
	}

	public UserVO getUser(Connection conn, String user_id) {
		UserVO vo = new UserVO();  
		String sql = prop.getProperty("getUser"); 
		try {
			pstmt = conn.prepareStatement(sql);  
			
			pstmt.setString(1, user_id);     
			
						
			rs = pstmt.executeQuery();
		
			
			if(rs.next()) {    
			
				vo.setUser_id(rs.getString(1));
				vo.setUser_pw(rs.getString(2));
				vo.setUser_name(rs.getString(3));
				vo.setUser_no(rs.getString(4));
				vo.setGender(rs.getString(5));
				vo.setAddress(rs.getString(6));
				vo.setPhone(rs.getString(7));
				vo.setEmail(rs.getString(8));
				vo.setEnroll(rs.getString(9));
				vo.setPoint(rs.getInt(10));
				
				return vo;
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return vo;   
	}
	public int userUpdate(Connection conn, UserVO vo) {
		int result = 0 ;
		String sql = prop.getProperty("userUpdate");
				
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, vo.getAddress());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getUser_id());
			result = pstmt.executeUpdate(); //실패 = 0  성공 = 1

			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int userDelte(Connection conn, String user_id) {
		int result = 0;                          
		String sql = prop.getProperty("userDelete"); 
		try {
			pstmt = conn.prepareStatement(sql);  
			
			pstmt.setString(1, user_id);   
		
						
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;   
}
	public String findId(Connection conn, String user_name, String user_no) {
		String result = "";                         
		String sql = prop.getProperty("findId");
		
		try {
			pstmt = conn.prepareStatement(sql);  
			
			pstmt.setString(1, user_name);
			pstmt.setString(2, user_no);
						
			rs = pstmt.executeQuery();
			
			if(rs.next()) {    
				result = rs.getString(1);  
			
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;   //8. result가
	}
	public String findPw(Connection conn, String user_name, String user_id, String user_no) {
		String result = "";                         
		String sql = prop.getProperty("findPw");
		try {
			pstmt = conn.prepareStatement(sql);  
			pstmt.setString(1, user_name);
			pstmt.setString(2, user_id);
			pstmt.setString(3, user_no);
			
			rs = pstmt.executeQuery();

			if(rs.next()) {    
				result = rs.getString(1);  
			
			}
				
	
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;   
	}
	public String pwCheck(Connection conn, String user_id) {
		String result = "";                          // result 초기화
		String sql = prop.getProperty("loginCheck"); //4쿼리문 작성
		try {
			pstmt = conn.prepareStatement(sql);  
			
			pstmt.setString(1, user_id);     // 5입력한 id가 쿼리문에 들어가서 작동한다 
		
						
			rs = pstmt.executeQuery();
			
			if(rs.next()) {    //6. DB에 ID가 존재할 경우 실행된다
				result = rs.getString(1);  //7 DB에 입력한 아이디가 존재하면 비밀번호를 result에 담긴다
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;   //8. result
	}
	public int findPwUpdate(Connection conn, String user_pw, String user_id) {
		int result = 0 ;
		String sql = prop.getProperty("findPwUpdate");
				
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, user_pw);
			pstmt.setString(2, user_id);
			
			result = pstmt.executeUpdate(); //실패 = 0  성공 = 1

			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public String confrim(Connection conn, String confirm) {
		// TODO Auto-generated method stub
		return null;
	}
}
