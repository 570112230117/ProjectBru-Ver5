package com.bru.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.bru.model.LoginBean;
import com.bru.model.RoleBean;
import com.bru.model.StatusBean;
import com.bru.model.TestAjaxBean;
import com.bru.util.ConnectDB;

@Repository
public class LoginDao {

	// login
	int id;

	public LoginBean login(String username, String password) throws SQLException {
		LoginBean bean = new LoginBean();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM login WHERE username = ? AND password = ? AND status = '1' ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, username);
			prepared.setString(2, password);
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setUsername(rs.getString("username"));
				bean.setPassword(rs.getString("password"));
				bean.setRole(rs.getString("role"));
				bean.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		id = bean.getId();
		return bean;
	}

	public TestAjaxBean Id() {
		TestAjaxBean bean = new TestAjaxBean();
		bean.setId(id);
		return bean;
	}

	// list
	public List<LoginBean> findAll() throws SQLException {
		List<LoginBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM login ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				LoginBean bean = new LoginBean();
				bean.setId(rs.getInt("id"));
				bean.setUsername(rs.getString("username"));
				bean.setPassword(rs.getString("password"));
				bean.setRole(rs.getString("role"));
				bean.setStatus(status(rs.getString("status")));
				bean.setName(rs.getString("name"));
				bean.setAddress(rs.getString("address"));
				bean.setPhone(rs.getString("phone"));
				bean.setGender(rs.getString("gender"));
				bean.setBirthday(rs.getDate("birthday"));
				bean.setWork(rs.getDate("work"));
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

	// status
	String status(String id) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		List<StatusBean> list = new ArrayList<>();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM status_repairmen rp where rp.id = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, id);
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				StatusBean bean = new StatusBean();
				bean.setName(rs.getString("name"));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return list.get(0).getName();
	}// status

	// findById
	public LoginBean findById(Integer id) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		LoginBean bean = new LoginBean();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM login rp WHERE rp.id = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setInt(1, id);
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setUsername(rs.getString("username"));
				bean.setPassword(rs.getString("password"));
				bean.setRole(role(rs.getString("role")));
				bean.setStatus(rs.getString("status"));
				bean.setName(rs.getString("name"));
				bean.setAddress(rs.getString("address"));
				bean.setPhone(rs.getString("phone"));
				bean.setGender(rs.getString("gender"));
				bean.setBirthday(rs.getDate("birthday"));
				bean.setWork(rs.getDate("work"));

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;

	}
	

	// update
	public void update(LoginBean bean) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();

		try {
			sql.append(
					" UPDATE login SET  username = ? , password = ?,  status = ?, name = ?, address = ?, phone = ? , gender = ? , birthday = ?  WHERE id = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, bean.getUsername());
			prepared.setString(2, bean.getPassword());
			prepared.setString(3, bean.getStatus());
			prepared.setString(4, bean.getName());
			prepared.setString(5, bean.getAddress());
			prepared.setString(6, bean.getPhone());
			prepared.setString(7, bean.getGender());
			prepared.setDate(8, bean.getBirthday());
			prepared.setInt(9, bean.getId());
			prepared.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}

	// role
	String role(String id) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		List<RoleBean> list = new ArrayList<>();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM role rp where rp.id = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, id);
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				RoleBean bean = new RoleBean();
				bean.setName(rs.getString("name"));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return list.get(0).getName();
	}// role
	// end

}
