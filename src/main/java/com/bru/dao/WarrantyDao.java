package com.bru.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;
import com.bru.model.WarrantyBean;
import com.bru.util.ConnectDB;

@Repository
public class WarrantyDao {

	public WarrantyBean warranty(String a) throws SQLException {

		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		WarrantyBean bean = new WarrantyBean();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM warranty WHERE serial_number = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, a);
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setDate(rs.getDate("date"));
				bean.setProductCode(rs.getString("product_code"));
				bean.setProductName(rs.getString("product_name"));
				bean.setSerialNumber(rs.getString("serial_number"));
				bean.setWarranty(rs.getString("warranty"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}

		return bean;
	}

}
