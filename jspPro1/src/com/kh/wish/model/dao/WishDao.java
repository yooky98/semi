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
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<Wish> selectWList(Connection conn, String userId) {
		ArrayList<Wish> w_list = new ArrayList<Wish>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

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

	public ArrayList<Wish> selectWList2(Connection conn, String userId) {
		ArrayList<Wish> w_list = new ArrayList<Wish>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

//		selectWList2=SELECT A.WISH_NO, A.PROD_NO, B.PROD_NAME, B.PROD_PRICE, C.CHANGE_NAME FROM WISH A INNER JOIN PRODUCT B ON (A.PROD_NO = B.PROD_NO) INNER JOIN ATTACHMENT C ON (B.PROD_NO = C.REF_PNO) WHERE A.USER_ID = ?		
		String sql = prop.getProperty("selectWList2");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			Wish w = null;

			while(rset.next()) {
				w = new Wish();
				w.setWishNo(rset.getInt("WISH_NO"));
				w.setProdNo(rset.getInt("PROD_NO"));
				w.setProdName(rset.getString("PROD_NAME"));
				w.setProdPrice(rset.getInt("PROD_PRICE"));
				w.setChangeName(rset.getString("CHANGE_NAME"));

				w_list.add(w);
				System.out.println(w);
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

	public int deleteWish(Connection conn, int wishNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		//deleteWish=DELETE FROM WISH WHERE WISH_NO = ?
		String sql = prop.getProperty("deleteWish");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wishNo );
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
