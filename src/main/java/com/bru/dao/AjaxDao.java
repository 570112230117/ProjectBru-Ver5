package com.bru.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.bru.model.TestAjaxBean;
import com.bru.model.TypeAppliances;
import com.bru.model.TypeBrand;
import com.bru.model.TypeProduct;
import com.bru.util.ConnectDB;

@Repository
public class AjaxDao {
	// ดรอบดาว
	public List<TypeAppliances> appliances() throws SQLException {
		List<TypeAppliances> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		TypeAppliances bean = new TypeAppliances();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM type_appliances ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean = new TypeAppliances();
				bean.setName(rs.getString("name"));
				bean.setAppliancesId(rs.getString("appliances_id"));
				bean.setId(rs.getInt("id"));
				list.add(bean);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return list;
	}

	
	public List<TypeProduct> product(TestAjaxBean testAjaxBean) throws SQLException {
		List<TypeProduct> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		TypeProduct bean = new TypeProduct();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM type_product WHERE appliances_id = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, testAjaxBean.getAppliances());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean = new TypeProduct();
				bean.setId(rs.getInt("id"));
				bean.setProduct(rs.getString("product"));
				bean.setProductid(rs.getString("product_id"));
				list.add(bean);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return list;
	}

	public List<TypeBrand> brand(TestAjaxBean testAjaxBean) throws SQLException {
		List<TypeBrand> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		TypeBrand bean = new TypeBrand();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM type_brand WHERE product_id = ? and appliances_id = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, testAjaxBean.getBrand());
			prepared.setString(2, testAjaxBean.getAppliances());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean = new TypeBrand();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setProductId(rs.getString("product_id"));
				bean.setAppliancesId(rs.getString("appliances_id"));
				list.add(bean);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return list;
	}
}
