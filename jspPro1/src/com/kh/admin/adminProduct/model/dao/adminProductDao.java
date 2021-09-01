package com.kh.admin.adminProduct.model.dao;
import static com.kh.common.JDBCTemplate.*;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.admin.adminProduct.model.vo.adminProduct;

public class adminProductDao {
	
	private Properties prop = new Properties();
	
	public adminProductDao() {
		String fileName = adminProductDao.class.getResource("/sql/admin/adminProduct/adminProduct-query.properties").getPath();
		System.out.println("fileName : " + fileName);
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

	public ArrayList<adminProduct> selectList(Connection conn) {
		
		ArrayList<adminProduct> list = new ArrayList<adminProduct>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;		
		
		//selectList="SELECT PROD_NO, PROD_NAME, PROD_CATEGORY, PROD_PRICE
		//			       , PROD_AMOUNT FROM PRODUCT WHERE PROD_STATUS='Y'"
		
		String sql = prop.getProperty("selectProdList");		
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();			
			
			while(rset.next()) {
				adminProduct ap = new adminProduct();
				
				ap.setProdNo(rset.getInt("PROD_NO"));
				ap.setProdName(rset.getString("PROD_NAME"));
				ap.setProdCategory(rset.getString("PROD_CATEGORY"));
				ap.setProdPrice(rset.getInt("PROD_PRICE"));
				ap.setProdAmount(rset.getInt("PROD_AMOUNT"));
								
				list.add(ap);
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
