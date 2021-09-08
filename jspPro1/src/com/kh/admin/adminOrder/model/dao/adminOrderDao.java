package com.kh.admin.adminOrder.model.dao;
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

import com.kh.admin.adminOrder.model.vo.adminOrderList;
public class adminOrderDao {
	
	private Properties prop = new Properties();
	
	public adminOrderDao() {
		
		String fileName = adminOrderDao.class.getResource("/sql/admin/adminOrder/adminOrder-query.properties").getPath();
		
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

	public ArrayList<adminOrderList> selectList(Connection conn) {
		
		ArrayList<adminOrderList> list = new ArrayList<adminOrderList>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//selectList=
		//SELECT A.ORDER_DETAIL_NO, A.ORDER_NO, B.PROD_NAME, A.USER_ID, C.ORDER_DATE, A.ORDERS_AMOUNT, A.ORDERS_STATUS
		//FROM ORDERS_DETAIL A JOIN PRODUCT B ON A.PROD_NO=B.PROD_NO 
		//JOIN "ORDER" C ON A.ORDER_NO=C.ORDER_NO
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				adminOrderList aol = new adminOrderList();
				
				aol.setOrderDetailNo(rset.getInt("A.ORDER_DETAIL_NO"));
				aol.setProdName(rset.getString("B.PROD_NAME"));
				aol.setUserId(rset.getString("A.USER_ID"));
				aol.setOrderDate(rset.getDate("C.ORDER_DATE"));
				aol.setOrderAmount(rset.getInt("A.ORDERS_AMOUNT"));
				aol.setOrdersStatus(rset.getInt("A.ORDERS_STATUS"));
				
				aol.setOrderNo(rset.getInt("A.ORDER_NO"));
				
				list.add(aol);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}		
		
		return list;
	}

}
