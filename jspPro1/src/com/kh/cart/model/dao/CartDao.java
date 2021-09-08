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

	// 로그인후 장바구니에 있는 전체 리스트
	public ArrayList<Cart> selectCartList(Connection conn, String userId) {
		ArrayList<Cart> list = new ArrayList<Cart>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectCartList");
//		selectCartList=SELECT * FROM CART WHERE USER_ID = ?	
//		SELECT A.CART_NO, A.USER_ID, A.PROD_NO , A.CART_AMOUNT, A.FOREST_NAME, B.PROD_NAME , B.PROD_PRICE FROM CART A INNER JOIN PRODUCT B ON (A.PROD_NO = B.PROD_NO) WHERE A.USER_ID = ?;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			while (rset.next()) {
			
			//Cart cart = new Cart();
				int CartNo = rset.getInt("CART_NO");
				String userId1 = rset.getString("USER_ID");
				int prodNo = rset.getInt("PROD_NO");
				int cartAmount = rset.getInt("CART_AMOUNT");
				String forestName = rset.getString("FOREST_NAME");
			
			Product prodList = 	new Product();
				prodList.setProdName(rset.getString("PROD_NAME"));
				prodList.setProdPrice(rset.getInt("PROD_PRICE"));
			
				list.add(new Cart(CartNo,userId1,prodNo,cartAmount,forestName, prodList));
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
		} finally {
			close(pstmt);
		}
		System.out.println("result = " + result);
		return result;

	}
/*
	public ArrayList<Product> selectProductList(Connection conn, String userId) {
		ArrayList<Product> list = new ArrayList<Product>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty(key)
		
		return null;
	}

	public int existCart(Connection conn, String userId, int prodNo) {
		int existCart = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("");
		return 0;
	} */
}
