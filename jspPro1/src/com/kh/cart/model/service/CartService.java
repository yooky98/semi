package com.kh.cart.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.kh.common.JDBCTemplate.*;

import com.kh.cart.model.dao.CartDao;
import com.kh.cart.model.vo.Cart;

public class CartService {


	public ArrayList<Cart> selectCartList(String userId) {
	Connection conn = getConnection();
		
		ArrayList<Cart> list = new CartDao().selectCartList(conn ,userId);
		close(conn);
		
		return list;
	}

	public int insertCart(Cart c) {
		
		Connection conn = getConnection();
		int result = new CartDao().insertCart(conn, c);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}



}
