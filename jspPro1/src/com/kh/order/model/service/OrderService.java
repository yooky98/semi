package com.kh.order.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.cart.model.dao.CartDao;
import com.kh.order.model.dao.OrderDao;
import com.kh.order.model.vo.Order;

public class OrderService {

	public int insertOrders(Order od) {
		Connection conn = getConnection();
		int result = new OrderDao().insertOrders(conn, od);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	public int updateMemberPoint(String userId , int point) {
	
		Connection conn = getConnection();
		
		int result1 = new OrderDao().updateMemberPoint(conn, userId, point );
		
		if(result1 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1;

	}

	public int selectOrderNo() {
		
		Connection conn = getConnection();
		int ordersNo = new OrderDao().selectOrderNo(conn);

		if (ordersNo > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return ordersNo;
	}



	public int insertOrderDetail(String userId, String ordersNo, String[] prodNo, String[] forestNameList, String[] orderAmountList, String[] orderPriceList) {
		
		Connection conn = getConnection();
		int result = new OrderDao().insertOrderDetail(conn, userId, ordersNo ,prodNo , forestNameList ,orderAmountList , orderPriceList );

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);

		return result;
	}

	public int deleteCartOrderList(String userId, String[] prodNo) {
		Connection conn = getConnection();
		int result1 = new OrderDao().deleteCartOrderList(conn ,userId, prodNo);
		
		if (result1 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);

		return result1;
	}

}
