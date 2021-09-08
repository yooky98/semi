package com.kh.admin.adminOrder.model.service;
import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.adminOrder.model.dao.adminOrderDao;
import com.kh.admin.adminOrder.model.vo.adminOrderList;

public class adminOrderService {

	public ArrayList<adminOrderList> selectList() {
		
		Connection conn = getConnection();
		
		ArrayList<adminOrderList> list = new adminOrderDao().selectList(conn);
		
		close(conn);
		
		return list;
	}

}
