package com.kh.orderDetail.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.orderDetail.model.vo.OrderDetail;
import com.kh.wish.model.dao.WishDao;

public class OrderDetailDao {
private Properties prop = new Properties();
	
	public OrderDetailDao() {
		String fileName = WishDao.class.getResource("/sql/ordersDetail/ordersDetail-query.properties").getPath();
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

	public ArrayList<OrderDetail> selectBList(Connection conn, String userId) {
		ArrayList<OrderDetail> od_list = new ArrayList<OrderDetail>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

//		selectBList=SELECT A.ORDER_DETAIL_NO , C.PROD_NAME, A.USER_ID, B.ORDER_DATE, A.ORDERS_AMOUNT, A.ORDERS_PRICE, A.ORDERS_STATUS FROM ORDERS_DETAIL A INNER JOIN ORDERS B ON (B.ORDER_NO = A.ORDER_NO) INNER JOIN PRODUCT C ON (C.PROD_NO = A.PROD_NO) WHERE A.USER_ID = ?
		
		String sql = prop.getProperty("selectBList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				OrderDetail od = new OrderDetail();
				od.setOrderDetailNo(rset.getInt("ORDER_DETAIL_NO"));
				od.setProdName(rset.getString("PROD_NAME"));
				od.setUserId(rset.getString("USER_ID"));
				od.setOrdersDate(rset.getDate("ORDER_DATE"));
				od.setOrdersAmount(rset.getInt("ORDERS_AMOUNT"));
				od.setOrdersPrice(rset.getInt("ORDERS_PRICE"));
				od.setOrdersStatus(rset.getInt("ORDERS_STATUS"));
				od.setChangeName(rset.getString("CHANGE_NAME"));
				od.setProdNo(rset.getInt("PROD_NO"));
				od_list.add(od);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return od_list;
	}

	public int deleteOrder(Connection conn, int orderDetailNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		//deleteOrder=DELETE FROM ORDERS_DETAIL WHERE ORDER_DETAIL_NO = ?
		String sql = prop.getProperty("deleteOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderDetailNo );
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
