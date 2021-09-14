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

import com.kh.cart.model.service.CartService;
import com.kh.cart.model.vo.Cart;
import com.kh.member.model.vo.UserVO;
import com.kh.product.model.vo.Product;

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


	public ArrayList<Cart> selectCartList(Connection conn, String userId) {
		
		ArrayList<Cart> list = new ArrayList<Cart>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectCartList");
//		SELECT A.CART_NO, A.USER_ID, A.PROD_NO , A.CART_AMOUNT, A.FOREST_NAME, B.PROD_NAME , B.PROD_PRICE , C.CHANGE_NAME
//		FROM CART A 
//		INNER JOIN PRODUCT B ON (A.PROD_NO = B.PROD_NO)
//		INNER JOIN ATTACHMENT C ON (B.PROD_NO = C.REF_PNO)
//		WHERE A.USER_ID = '?';
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
		
			Cart cart = null;
			while (rset.next()) {
				cart = new Cart();
				
				cart.setCartNo(rset.getInt("CART_NO"));
				cart.setUserId(rset.getString("USER_ID"));
				cart.setProdNo(rset.getInt("PROD_NO"));
				cart.setCartAmount(rset.getInt("CART_AMOUNT"));
				cart.setForestName(rset.getString("FOREST_NAME"));
				cart.setProdName(rset.getString("PROD_NAME"));
				cart.setProdPrice(rset.getInt("PROD_PRICE"));
				cart.setChangName(rset.getString("CHANGE_NAME"));
		
				list.add(cart);
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			System.out.println("cart 테이블  selectCartList 오류메세지 : " + e.getMessage());
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;

	}

	public int insertCart(Connection conn, Cart c) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertCart");
//		insertCart=INSERT INTO CART VALUES(CART_SEQ.NEXTVAL,?,?,?,?)

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
		} finally {
			close(pstmt);
		}
		System.out.println("result = " + result);
		return result;

	}

	public int deleteCart(Connection conn, int cartNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		//deleteCart=DELETE FROM CART WHERE CART_NO = ?
		String sql = prop.getProperty("deleteCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cartNo );
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	public int updateProdAmount(Connection conn, int amount, int cartNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProdAmount");
		//updateProdAmount=UPDATE CART SET CART_AMOUNT = ? WHERE CART_NO = ?
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, amount);
			pstmt.setInt(2, cartNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	
		return result;
	}

	public ArrayList<Cart> selectCartOrder(Connection conn,  String[] cartNo) {
		ArrayList<Cart> cartOrder = new ArrayList<Cart>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Cart c= new Cart();
		String sql = prop.getProperty("selectCartOrder");
		//selectCartOrder=SELECT A.CART_NO , A.PROD_NO , A.CART_AMOUNT , A.FOREST_NAME, B.PROD_NAME , B.PROD_PRICE 
		//FROM CART A INNER JOIN PRODUCT B ON (A.PROD_NO = B.PROD_NO) WHERE A.CART_NO = ?
	
		try {
			pstmt = conn.prepareStatement(sql);

			for(int i = 0 ; i < cartNo.length ; i++) {
				pstmt.setInt(1, Integer.parseInt(cartNo[i]));

			rset = pstmt.executeQuery();
			Cart cart = null;
			
			while (rset.next()) {
				cart = new Cart();
				
				cart.setProdNo(rset.getInt("PROD_NO"));
				cart.setCartAmount(rset.getInt("CART_AMOUNT"));
				cart.setForestName(rset.getString("FOREST_NAME"));
				cart.setProdName(rset.getString("PROD_NAME"));
				cart.setProdPrice(rset.getInt("PROD_PRICE"));
				cart.setChangName(rset.getString("CHANGE_NAME"));
		
				cartOrder.add(cart);
				
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("cart 리스트야 제발 = " + cartOrder);
		return cartOrder;
		
	}


//	public ArrayList<UserVO> selectUserOrder(Connection conn, String[] cartNo) {
//		ArrayList<UserVO> userOrder = new ArrayList<UserVO>();
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
		
////	UserVO user = new UserVO();
//		String sql = prop.getProperty("selectUserOrder");
////		selectUserOrder=SELECT A.USER_NAME , A.PHONE , A.ADDRESS , A.POINT 
////		FROM USERS A JOIN CART B ON (A.USER_ID = B.USER_ID) 
////		WHERE B.CART_NO = ?
//		try {
//			pstmt = conn.prepareStatement(sql);
//
//			for(int i = 0 ; i < cartNo.length ; i++) {
//				pstmt.setInt(1, Integer.parseInt(cartNo[i]));
//
//				rset = pstmt.executeQuery();
//				UserVO user = null;
//			
//			while (rset.next()) {
//				user = new UserVO();
//		
//				user.setUser_name(rset.getString("USER_NAME"));
//				user.setPhone(rset.getString("PHONE"));
//				user.setAddress(rset.getString("ADDRESS"));
//				user.setPoint(rset.getInt("POINT"));
//				userOrder.add(user);
//				
//				}
//			}
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			close(rset);
//			close(pstmt);
//		}
//		System.out.println("userOrder 가져오니?= " + userOrder);
//		return userOrder;
//		
//	}
}
