package com.kh.admin.adminProduct.model.service;
import static com.kh.common.JDBCTemplate.*;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.adminProduct.model.dao.adminProductDao;
import com.kh.admin.adminProduct.model.vo.adminProduct;
import com.kh.product.model.vo.Attachment;

public class adminProductService {

	public ArrayList<adminProduct> selectList() {

		Connection conn = getConnection();
		
		ArrayList<adminProduct> list = new adminProductDao().selectList(conn);		
		
		close(conn);
		
		return list;		
	}

	public int insertProduct(adminProduct ap, Attachment at) {
		
		Connection conn = getConnection();
		
		int result1 = new adminProductDao().insertProduct(conn, ap);
		int result2 = 1;
		
		if(at != null) {
			result2 = new adminProductDao().insertAttachment(conn, at);
		}
		
		if(result1*result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1*result2;
	}

	public adminProduct selectUpdateProduct(int prodNo) {
		
		Connection conn = getConnection();
		
		adminProduct ap = new adminProductDao().selectProduct(conn, prodNo);
		
		close(conn);
		
		return ap;
	}

	public Attachment selectAttachment(int prodNo) {

		Connection conn = getConnection();
		
		Attachment at = new adminProductDao().selectAttachment(conn, prodNo);
		
		close(conn);
		
		return at;
	}

	public int updateProduct(adminProduct ap, Attachment at) {
		
		Connection conn = getConnection();
		
		int result1 = new adminProductDao().updateProduct(conn, ap);
		int result2 = 1;
		
		if(at != null) {
			result2 = new adminProductDao().updateAttachment(conn, at);
		}
		
		if(result1*result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1*result2;		
	}

	public int deleteProduct(int prodNo) {

		Connection conn = getConnection();
		
		int result1 = new adminProductDao().deleteProduct(conn, prodNo);
		int result2 = new adminProductDao().deleteAttachment(conn, prodNo);		
		
		if(result1*result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1*result2;	
	}
	
	
}
