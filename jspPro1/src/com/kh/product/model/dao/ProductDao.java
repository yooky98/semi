package com.kh.product.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.cart.model.vo.Cart;
import com.kh.order.model.vo.Order;
import com.kh.product.model.vo.Product;

public class ProductDao {

	private Properties prop = new Properties();
	
	public ProductDao() {
		String fileName = ProductDao.class.getResource("/sql/product/product-query.properties").getPath();
		/* System.out.println("fileName   " + fileName); */
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
				
				p.setProdNo(rset.getInt("PROD_NO"));
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

	public HashMap<String,Integer> selectChList(Connection conn) {
		ArrayList<Product> p_list = new ArrayList<Product>();
		HashMap<String,Integer> list = new HashMap<String, Integer>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
//		selectChList=SELECT PROD_CATEGORY FROM PRODUCT WHERE PROD_STATUS = 'Y'
		
		String sql = prop.getProperty("selectChList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
						
			while(rset.next()) {
				Product p = new Product();

				p.setProdCategory(rset.getString("PROD_CATEGORY"));

				p_list.add(p);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		if(p_list != null) {
			for(int i = 0; i < p_list.size() ;i++) {
				if(list.containsKey(p_list.get(i).getProdCategory())) {
					list.put(p_list.get(i).getProdCategory(), list.get(p_list.get(i).getProdCategory())+1);
					
				}else {
					list.put(p_list.get(i).getProdCategory(), 1);
				}
			}
		}
		System.out.println(list);
		return list;
	}

	public HashMap<String, Integer> selectPdChList(Connection conn) {
		ArrayList<Product> p_list = new ArrayList<Product>();
		HashMap<String,Integer> list = new HashMap<String, Integer>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
//		selectPdChList=SELECT PROD_NAME, SUM(ORDERS_AMOUNT) FROM ORDERS_DETAIL JOIN PRODUCT USING (PROD_NO) GROUP BY PROD_NAME
		
		String sql = prop.getProperty("selectPdChList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				
				Product p = new Product();

				p.setProdName(rset.getString("PROD_NAME"));
				p.setProdAmount(rset.getInt("SUM(ORDERS_AMOUNT)"));

				p_list.add(p);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		if(p_list != null) {
			for(int i = 0; i < p_list.size() ;i++) {
				if(list.containsKey(p_list.get(i).getProdName())) {
					list.put(p_list.get(i).getProdName(), list.get(p_list.get(i).getProdName())+p_list.get(i).getProdAmount());
					
				}else {
					list.put(p_list.get(i).getProdName(), p_list.get(i).getProdAmount());
				}
			}
		}
		System.out.println(list);
		return list;
	}

	public HashMap<String, Integer> selectFrList(Connection conn) {
		ArrayList<Cart> c_list = new ArrayList<Cart>();
		HashMap<String,Integer> list = new HashMap<String, Integer>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
//		selectFrList=SELECT FOREST_NAME, ORDERS_AMOUNT FROM ORDERS_DETAIL
		
		String sql = prop.getProperty("selectFrList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				
				Cart c = new Cart();

				c.setForestName(rset.getString("FOREST_NAME"));
				c.setCartAmount(rset.getInt("ORDERS_AMOUNT"));
				c_list.add(c);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		if(c_list != null) {
			for(int i = 0; i < c_list.size() ;i++) {
				if(list.containsKey(c_list.get(i).getForestName())) {
					list.put(c_list.get(i).getForestName(), list.get(c_list.get(i).getForestName())+c_list.get(i).getCartAmount());
					
				}else {
					list.put(c_list.get(i).getForestName(), c_list.get(i).getCartAmount());
				}
			}
		}
		System.out.println(list);
		return list;
	}

	public ArrayList<Order> selectPriceList(Connection conn) {
		ArrayList<Order> o_list = new ArrayList<Order>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
//		selectPriceList=SELECT TO_CHAR(ORDER_DATE,'YYYY-MM-DD'), SUM(ORDER_TOTAL_PRICE) FROM ORDERS GROUP BY TO_CHAR(ORDER_DATE,'YYYY-MM-DD')
		
		String sql = prop.getProperty("selectPriceList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				
				Order o = new Order();

				o.setOrderDate(rset.getString("TO_CHAR(ORDER_DATE,'YYYY-MM-DD')"));
				o.setTotalprice(rset.getInt("SUM(ORDER_TOTAL_PRICE)"));

				o_list.add(o);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		System.out.println(o_list);
		return o_list;
	}
}
