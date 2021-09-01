package com.kh.product.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.*;

import com.kh.product.model.vo.Product;

public class ProductDao {

private Properties prop = new Properties();
	
	public ProductDao() {
		String fileName = ProductDao.class.getResource("/sql/product/product-query.properties").getPath();
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
//		PROD_NO
//		PROD_NAME
//		PROD_DETAIL
//		PROD_CATEGORY
//		PROD_PRICE
//		PROD_AMOUNT
//		PROD_STATUS
	
	}

	public ArrayList<Product> selectPrList(Connection conn) {
		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
//		selectPrList=SELECT *
//				FROM PRODUCT JOIN(SELECT * FROM ATTACHMENT
//				WHERE FILE_NO IN(
//					SELECT FILE_NO FROM ATTACHMENT)) ON (REF_PNO = PROD_NO)
//				WHERE PRODUCT.PROD_STATUS='Y' ORDER BY PROD_NO DESC
		
		String sql = prop.getProperty("selectPrList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
						
			while(rset.next()) {
				Product p = new Product();

				p.setProdNo(rset.getInt("PROD_NO"));
				p.setProdName(rset.getString("PROD_NAME"));
				p.setProdDetail(rset.getString("PROD_DETAIL"));
				p.setProdCategory(rset.getString("PROD_CATEGORY"));
				p.setProdPrice(rset.getInt("PROD_PRICE"));
				p.setTitleImg(rset.getString("CHANGE_NAME"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
//		System.out.println(list.get(0).getTitleImg());
//		System.out.println(list.get(1).getTitleImg());
		return list;
	}

	public Product selectProduct(Connection conn, int pNo) {
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
				
//		selectProduct= SELECT PROD_NAME, PROD_DETAIL, PROD_PRICE, PROD_AMOUNT FROM PRODUCT WHERE PROD_STATUS = 'Y' AND PROD_NO = ?  
		
		String sql = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product();
				
				p.setProdName(rset.getString("PROD_NAME"));
				p.setProdDetail(rset.getString("PROD_DETAIL"));
				p.setProdPrice(rset.getInt("PROD_PRICE"));
				p.setProdAmount(rset.getInt("PROD_AMOUNT"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}
}
