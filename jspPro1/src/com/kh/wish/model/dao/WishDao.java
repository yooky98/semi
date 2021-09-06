package com.kh.wish.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.product.model.vo.Product;
import com.kh.wish.model.vo.Wish;

public class WishDao {
	
	private Properties prop = new Properties();
	
	public WishDao() {
		String fileName = WishDao.class.getResource("/sql/wish/wish-query.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertWish(Connection conn, Wish w) {
		// insertWish=INSERT INTO WISH VALUES(WISH_S.NEXTVAL, ?, ?)
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertWish");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,w.getUserID());
			pstmt.setInt(2, w.getProdNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}

	public ArrayList<Wish> selectWList(Connection conn, String userId) {
		ArrayList<Wish> w_list = new ArrayList<Wish>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println("접속자 아이디: "+userId);
		
//		selectWList=SELECT PROD_NO FROM WISH WHERE USER_ID = ?
		
		String sql = prop.getProperty("selectWList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Wish w = new Wish();
				w.setProdNo(rset.getInt("PROD_NO"));
				w_list.add(w);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return w_list;
	}

}
