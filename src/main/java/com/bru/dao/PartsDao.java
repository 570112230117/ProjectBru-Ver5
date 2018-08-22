package com.bru.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Repository;

import com.bru.model.LoginBean;
import com.bru.model.PartsBean;
import com.bru.model.RepairBean;
import com.bru.util.ConnectDB;

@Repository
public class PartsDao {

	
	// แปลงวันที่เวลา
	Locale localeTH = new Locale("th", "TH");
	Locale localeEN = new Locale("en", "EN");
	SimpleDateFormat formate = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss", localeTH);
	public static java.util.Date DateTHToEN(String date) throws ParseException {
		Locale localeTH = new Locale("th", "TH");
		Locale localeEN = new Locale("en", "EN");
		SimpleDateFormat formate = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss", localeTH);
		java.util.Date a = formate.parse(date);
		SimpleDateFormat dateformat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss", localeEN);
		java.util.Date b = dateformat.parse(dateformat.format(a));
		return b;
	}
	// insertParts
	public void insert(PartsBean bean) throws Exception {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(
					" INSERT INTO parts (date_receipt, device_id, device_name, serialnumber, brand,  warranty, price, device_user, customer_name, note) VALUES (?,?,?,?,?,?,?,?,?,?) ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setTimestamp(1, new java.sql.Timestamp(DateTHToEN(bean.getDateReceipt()).getTime()));
			prepared.setString(2, bean.getDeviceId());
			prepared.setString(3, bean.getDeviceName());
			prepared.setString(4, bean.getSerialNumber());
			prepared.setString(5, bean.getBrand());
			prepared.setString(6, bean.getWarranty());
			prepared.setString(7, bean.getPrice());
			prepared.setString(8, bean.getDeviceUser());
			prepared.setString(9, bean.getCustomerName());
			prepared.setString(10, bean.getNote());
			prepared.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}// end method insert
	
	public List<PartsBean> findAll() throws SQLException {
		List<PartsBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM parts ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				PartsBean bean = new PartsBean();
				bean.setId(rs.getInt("id"));
				bean.setDateReceipt(rs.getString("date_receipt"));
				bean.setDeviceId(rs.getString("device_id"));
				bean.setDeviceName(rs.getString("device_name"));
				bean.setSerialNumber(rs.getString("serialnumber"));
				bean.setBrand(rs.getString("brand"));
				bean.setWarranty(rs.getString("warranty"));
				bean.setPrice(rs.getString("price"));
				bean.setDeviceUser(deviceUser(rs.getString("device_user")));
				bean.setCustomerName(customerName(rs.getString("customer_name")));
				bean.setNote(rs.getString("note"));
				list.add(bean);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return list;
	}// end method list
	
	
	// customerName
		String customerName(String id) throws SQLException {
			ConnectDB con = new ConnectDB();
			PreparedStatement prepared = null;
			StringBuilder sql = new StringBuilder();
			List<RepairBean> list = new ArrayList<>();
			Connection conn = con.openConnect();
			try {
				sql.append(" SELECT * FROM repair rp where rp.repair_id = ? ");
				prepared = conn.prepareStatement(sql.toString());
				prepared.setString(1, id);
				ResultSet rs = prepared.executeQuery();
				while (rs.next()) {
					RepairBean bean = new RepairBean();
					bean.setRepairname(rs.getString("repair_name"));
					list.add(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn.close();
			}
			return list.get(0).getRepairname();
		}// customerName
		

		// deviceUser
			String deviceUser(String id) throws SQLException {
				ConnectDB con = new ConnectDB();
				PreparedStatement prepared = null;
				StringBuilder sql = new StringBuilder();
				List<LoginBean> list = new ArrayList<>();
				Connection conn = con.openConnect();
				try {
					sql.append(" SELECT * FROM login rp where rp.id = ? ");
					prepared = conn.prepareStatement(sql.toString());
					prepared.setString(1, id);
					ResultSet rs = prepared.executeQuery();
					while (rs.next()) {
						LoginBean bean = new LoginBean();
						bean.setName(rs.getString("name"));
						list.add(bean);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					conn.close();
				}
				return list.get(0).getName();
			}// deviceUser
	//end
}
