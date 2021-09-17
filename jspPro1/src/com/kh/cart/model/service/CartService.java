package com.kh.cart.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.kh.common.JDBCTemplate.*;

import com.kh.cart.model.dao.CartDao;
import com.kh.cart.model.vo.Cart;
import com.kh.member.model.vo.UserVO;
import com.kh.order.model.dao.OrderDao;
import com.kh.order.model.vo.Order;
import com.kh.product.model.vo.Product;

public class CartService {

	// 저장된 장바구니 품목
	public ArrayList<Cart> selectCartList(String userId) {
		Connection conn = getConnection();
	
		ArrayList<Cart> list = new CartDao().selectCartList(conn, userId);
		close(conn);

		return list;
	}
	

	// 장바구니 추가
	public int insertCart(Cart c) {

		Connection conn = getConnection();
		int result = new CartDao().insertCart(conn, c);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	public int deleteCart(int cartNo) {
		Connection conn = getConnection();
		
		int result = new CartDao().deleteCart(conn, cartNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateProdAmount(int amount, int cartNo) {
		Connection conn = getConnection();
		
		int result = new CartDao().updateProdAmount(conn, amount,cartNo );
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


	//장바구니에 담은 값 상품 찾기
	public ArrayList<Cart> selectCartOrder(String[] cartNo) {
		Connection conn = getConnection( );
	
		ArrayList<Cart> cartOrder = new CartDao().selectCartOrder(conn, cartNo);
		close(conn);
		
		return cartOrder;
	}



	public ArrayList<Cart> selectPordNo(String userId) {
		Connection conn = getConnection( );
		
		ArrayList<Cart> prodNoList = new CartDao().selectPordNo(conn, userId);
		
		close(conn);
		return prodNoList;
	}





}
