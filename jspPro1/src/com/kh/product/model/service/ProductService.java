package com.kh.product.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.product.model.dao.ProductDao;
import com.kh.product.model.vo.Product;

public class ProductService {

	public ArrayList<Product> selectPrList() {
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectPrList(conn);
		
		close(conn);
		return list;
	}

	public Product selectProduct(int pNo) {
		Connection conn = getConnection();
		Product p = new ProductDao().selectProduct(conn, pNo);
		
		close(conn);
		
		return p;
	}

	public HashMap<String,Integer> selectChList() {
		Connection conn = getConnection();
		
		HashMap<String,Integer> list = new ProductDao().selectChList(conn);
		
		close(conn);
		
		return list;
	}

}
