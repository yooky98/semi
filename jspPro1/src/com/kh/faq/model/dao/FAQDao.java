package com.kh.faq.model.dao;
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

import com.kh.faq.model.vo.FAQ;

public class FAQDao {
	
	private Properties prop = new Properties();
	
	public FAQDao() {
		String fileName = FAQDao.class.getResource("/sql/faq/faq-query.properties").getPath();
		//System.out.println("fileName : " + fileName);
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

	public ArrayList<FAQ> selectList(Connection conn) {
		
		ArrayList<FAQ> list = new ArrayList<FAQ>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//selectList=SELECT FAQ_TYPE, FAQ_QUES, FAQ_ANS FROM FAQ
		String sql = prop.getProperty("selectList");		
		
		try {
			pstmt = conn.prepareStatement(sql);		
			rset = pstmt.executeQuery();
						
			while(rset.next()) {
				FAQ f = new FAQ();
				
				f.setFAQType(rset.getString("FAQ_TYPE"));
				f.setFAQQues(rset.getString("FAQ_QUES"));
				f.setFAQAns(rset.getString("FAQ_ANS"));
				
				list.add(f);
			}			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
