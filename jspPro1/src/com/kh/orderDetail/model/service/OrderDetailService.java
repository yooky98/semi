package com.kh.orderDetail.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.orderDetail.model.dao.OrderDetailDao;
import com.kh.orderDetail.model.vo.OrderDetail;

public class OrderDetailService {
	
	public ArrayList<OrderDetail> selectBList(String userId) {
		Connection conn = getConnection();
		ArrayList<OrderDetail> od_list = new OrderDetailDao().selectBList(conn,userId);
		
		close(conn);
		
		return od_list;
	}

	public int deleteOrder(int orderDetailNo) {
		Connection conn = getConnection();
		
		int result = new OrderDetailDao().deleteOrder(conn, orderDetailNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
