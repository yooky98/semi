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
import com.kh.product.model.vo.Attachment;

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

	public int insertProduct(Connection conn, adminProduct ap) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		//insertProduct=INSERT INTO PRODUCT VALUES (PRODUCT_S.NEXTVAL, ?, ?, ?, ?, ?, DEFAULT)
		String sql = prop.getProperty("insertProduct");
		//PROD_NO
		//PROD_NAME
		//PROD_DETAIL
		//PROD_CATEGORY
		//PROD_PRICE
		//PROD_AMOUNT
		//PROD_STATUS
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ap.getProdName());
			pstmt.setString(2, ap.getProdDetail());
			pstmt.setString(3, ap.getProdCategory());
			pstmt.setInt(4, ap.getProdPrice());
			pstmt.setInt(5, ap.getProdAmount());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	public int insertAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		//insertAttachment=INSERT INTO ATTACHMENT VALUES (ATTACHMENT_S.NEXTVAL, ?, ?, ?, PRODUCT_S.CURRVAL)

		String sql = prop.getProperty("insertAttachment");
		//FILE_NO
		//ORIGIN_NAME
		//CHANGE_NAME
		//FILE_PATH
		//REF_PNO
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}

	public adminProduct selectProduct(Connection conn, int prodNo) {
		
		adminProduct ap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//selectProduct=SELECT PROD_CATEGORY, PROD_NAME, PROD_PRICE, PROD_AMOUNT, PROD_DETAIL FROM PRODUCT WHERE PROD_STATUS = 'Y' AND PROD_NO=?
		String sql = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prodNo);
			System.out.println("다오prodNo : " + prodNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				/*
				 * ap = new adminProduct( rset.getString("PROD_NAME"),
				 * rset.getString("PROD_DETAIL"), rset.getString("PROD_CATEGORY"),
				 * rset.getInt("PROD_PRICE"), rset.getInt("PROD_AMOUNT")
				 * 
				 * );
				 */
				
				ap = new adminProduct();
				
				ap.setProdCategory(rset.getString("PROD_CATEGORY"));
				ap.setProdName(rset.getString("PROD_NAME"));
				ap.setProdPrice(rset.getInt("PROD_PRICE"));
				ap.setProdAmount(rset.getInt("PROD_AMOUNT"));
				ap.setProdDetail(rset.getString("PROD_DETAIL"));
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ap;
	}

	public Attachment selectAttachment(Connection conn, int prodNo) {
		
		Attachment at = null;		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//selectAttachment=SELECT FILE_NO, ORIGIN_NAME, CHANGE_NAME, FILE_PATH FROM ATTACHMENT WHERE REF_PNO=?
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prodNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
	}

}
