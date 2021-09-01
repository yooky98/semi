package com.kh.admin.adminProduct.model.service;
import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.adminProduct.model.dao.adminProductDao;
import com.kh.admin.adminProduct.model.vo.adminProduct;

public class adminProductService {

	public ArrayList<adminProduct> selectList() {

		Connection conn = getConnection();
		
		ArrayList<adminProduct> list = new adminProductDao().selectList(conn);		
		
		close(conn);
		
		return list;		
	}
	
	
}
