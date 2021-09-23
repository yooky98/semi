package com.kh.order.model.dao;

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

import com.kh.cart.model.dao.CartDao;
import com.kh.order.model.vo.Order;

public class OrderDao {
	private Properties prop = new Properties();

	public OrderDao() {
		String fileName = CartDao.class.getResource("/sql/orders/orders-query.properties").getPath();
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

	public int insertOrders(Connection conn, Order od) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertOrders");
		//insertOrders=INSERT INTO ORDERS VALUES(ORDERS_SEQ.NEXTVAL ,?,?,?,?,?,?,SYSDATE)
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, od.getUserId());
			pstmt.setString(2, od.getOrderName());
			pstmt.setString(3, od.getOrderPhone());
			pstmt.setString(4, od.getOrderAddress());
			pstmt.setString(5, od.getOrdermsg());
			pstmt.setInt(6, od.getTotalprice());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
					
		return result;
	}

	public int updateMemberPoint(Connection conn,String userId, int point) {
		int result1 = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMemberPoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setString(2, userId);
			
			result1 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		return result1;
	}

	public int selectOrderNo(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int ordersNo=0;
		String sql = prop.getProperty("selectOrderNo");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				ordersNo = rset.getInt("ORDER_NO");	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return ordersNo;
	}


	public int insertOrderDetail(Connection conn, String userId, String ordersNo, String[] prodNo, String[] forestNameList, String[] orderAmountList, String[] orderPriceList) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertOrderDetail");
		//insertOrderDetail=INSERT INTO ORDERS_DETAIL
		//VALUES ( ORDERSDT_SEQ.NEXTVAL , ?, ? , ? , ?, ? ,DEFAULT ,?)

		try {
			pstmt = conn.prepareStatement(sql);
			for (int i = 0 ; i <prodNo.length ; i++) {
				pstmt.setInt(1, Integer.parseInt(ordersNo));
				pstmt.setInt(2, Integer.parseInt(prodNo[i]));
				pstmt.setString(3, userId);
				pstmt.setInt(4, Integer.parseInt(orderAmountList[i]));
				pstmt.setInt(5, Integer.parseInt(orderPriceList[i]));
				pstmt.setString(6, forestNameList[i]);
				
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteCartOrderList(Connection conn, String userId, String[] prodNo) {
	
		int result1 = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCartOrderList");
		//DELETE FROM CART WHERE USER_ID = ? AND PROD_NO = ?
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i =0 ; i<prodNo.length ; i++) {
				pstmt.setString(1, userId);
				pstmt.setInt(2, Integer.parseInt(prodNo[i]));
				
				result1 = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result1;
	}



}
