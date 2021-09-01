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

}
