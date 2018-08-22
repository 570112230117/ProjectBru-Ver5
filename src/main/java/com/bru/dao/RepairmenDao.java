package com.bru.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.bru.model.LoginBean;
import com.bru.model.RepairStatusBean;
import com.bru.model.RoleBean;
import com.bru.util.ConnectDB;

@Repository
public class RepairmenDao {

	// ดรอบดาว
	public List<RoleBean> role() throws SQLException {
		List<RoleBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		RoleBean bean = new RoleBean();
		Connection conn = con.openConnect();

		try {
			sql.append(" SELECT * FROM role ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean = new RoleBean();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
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

	// ดรอบดาว
	public List<RepairStatusBean> repairstatus() throws SQLException {
		List<RepairStatusBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		RepairStatusBean bean = new RepairStatusBean();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM repair_status ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean = new RepairStatusBean();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
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

	// insert_repairmen
	public void insert(LoginBean bean) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(
					" INSERT INTO login (name, address, phone, gender, birthday, work, role, username , password, status) VALUES (?,?,?,?,?,?,?,?,?,?) ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, bean.getName());
			prepared.setString(2, bean.getAddress());
			prepared.setString(3, bean.getPhone());
			prepared.setString(4, bean.getGender());
			prepared.setDate(5, bean.getBirthday());
			prepared.setDate(6, bean.getWork());
			prepared.setString(7, bean.getRole());
			prepared.setString(8, bean.getUsername());
			prepared.setString(9, bean.getPassword());
			prepared.setString(10, bean.getStatus());
			prepared.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}// end method insert

	// update
	public void updatepersonal(LoginBean bean) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();

		try {
			sql.append(
					" UPDATE login SET  username = ? , name = ?, address = ?, phone = ? , gender = ? , birthday = ?  WHERE id = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, bean.getUsername());
			prepared.setString(2, bean.getName());
			prepared.setString(3, bean.getAddress());
			prepared.setString(4, bean.getPhone());
			prepared.setString(5, bean.getGender());
			prepared.setDate(6, bean.getBirthday());
			prepared.setInt(7, bean.getId());
			prepared.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}

	// end
}
