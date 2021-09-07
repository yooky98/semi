package com.kh.cart.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.*;

import com.kh.cart.model.vo.Cart;

public class CartDao {
	
	private Properties prop = new Properties();
	
	public CartDao() {
		String fileName = CartDao.class.getResource("/sql/cart/cart-query.properties").getPath();
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

	//로그인후 장바구니에 있는 전체 리스트
	public ArrayList<Cart> selectCartList(Connection conn, String userId) {
		ArrayList<Cart> list = new ArrayList<Cart>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCartList");
//		selectCartList=SELECT * FROM CART WHERE USER_ID = ?	
//		selectCartList=SELECT C.CART_NO , C.USER_ID , C.PROD_NO , C.CART_AMOUNT , C.FOREST_NAME , PRODUCT.PROD_NAME , PRODUCT.PROD_PRICE
//		FROM CART C JOIN PRODUCT ON (CART.PROD_NO = PRODUCT.PROD_NO) WHERE CART.USER_ID = ?
		
//		CART_NO
//		USER_ID
//		PROD_NO
//		CART_AMOUNT
//		FOREST_NAME
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(
						new Cart(rset.getInt("CART_NO"),
								rset.getString("USER_ID"),
								rset.getInt("PROD_NO"),
								rset.getInt("CART_AMOUNT"),
								rset.getString("FOREST_NAME")
							
						));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("cart 테이블  selectCartList 오류메세지 : " + e.getMessage());
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	//제품페이지에서 장바구니에 담기
	public int insertCart(Connection conn, Cart c) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCart");
//		insertCart=INSERT INTO CART VALUES(CART_SEQ.NEXTVAL,?,?,?,?)
//		CART_NO
//		USER_ID
//		PROD_NO
//		CART_AMOUNT
//		FOREST_NAME
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getUserId());
			pstmt.setInt(2, c.getProdNo());
			pstmt.setInt(3, c.getCartAmount());
			pstmt.setString(4, c.getForestName());
			
		result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("result = " + result);
		return result;
		
	}

}
