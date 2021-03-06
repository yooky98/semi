package com.kh.wish.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cart.model.dao.CartDao;
import com.kh.wish.model.dao.WishDao;
import com.kh.wish.model.vo.Wish;

public class WishService {

	public int insertWish(Wish w) {
		Connection conn = getConnection();
		
		int result = new WishDao().insertWish(conn,w);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public ArrayList<Wish> selectWList(String userId) {
		Connection conn = getConnection();
		ArrayList<Wish> w_list = new WishDao().selectWList(conn,userId);
		
		close(conn);
		
		return w_list;
	}

	public ArrayList<Wish> selectWList2(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Wish> w_list = new WishDao().selectWList2(conn,userId);
		
		close(conn);
		
		return w_list;
	}

	public int deleteWish(int wishNo) {
		Connection conn = getConnection();
		
		int result = new WishDao().deleteWish(conn, wishNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
