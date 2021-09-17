package com.kh.admin.adminOrder.model.service;
import static com.kh.common.JDBCTemplate.*;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.adminOrder.model.dao.adminOrderDao;
import com.kh.admin.adminOrder.model.vo.adminOrder;
import com.kh.admin.adminOrder.model.vo.adminOrderList;

public class adminOrderService {

	public ArrayList<adminOrderList> selectList() {
		
		Connection conn = getConnection();
		
		ArrayList<adminOrderList> list = new adminOrderDao().selectList(conn);
		
		close(conn);
		
		return list;
	}

	public ArrayList<adminOrder> selectOrderList() {

		Connection conn = getConnection();
		
		ArrayList<adminOrder> list = new adminOrderDao().selectOrderList(conn);
		
		close(conn);
		
		return list;
	}
	
	public int updateOrder(int orderDetailNo, int selectResult) {
		
		Connection conn = getConnection();
		
		int result = new adminOrderDao().updateOrder(conn, orderDetailNo, selectResult);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

}
