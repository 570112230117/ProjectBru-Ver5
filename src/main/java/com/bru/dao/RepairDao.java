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
import com.bru.model.RepairBean;
import com.bru.model.RepairStatusBean;
import com.bru.model.TestAjaxBean;
import com.bru.model.TypeAppliances;
import com.bru.model.TypeProduct;
import com.bru.util.ConnectDB;

@Repository
public class RepairDao {

	public List<RepairBean> findAll() throws SQLException {
		List<RepairBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM repair ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				RepairBean bean = new RepairBean();
				bean.setRepairId(rs.getInt("repair_id"));
				bean.setRepairDateStr(rs.getString("repair_date"));
				bean.setRepairname(rs.getString("repair_name"));
				bean.setRepairAddress(rs.getString("repair_address"));
				bean.setRepairPhone(rs.getString("repair_phone"));
				bean.setRepairEmail(rs.getString("repair_email"));
				bean.setRepairAppliances(appliances(rs.getString("repair_appliances")));
				bean.setRepairProduct(product(rs.getString("repair_product")));
				bean.setRepairBrand(brand(rs.getString("repair_brand")));
				bean.setRepairWaste(rs.getString("repair_waste"));
				bean.setRepairDetail(rs.getString("repair_detail"));
				bean.setRepairAppointment(rs.getDate("repair_appointment"));
				bean.setRepairmenDate(rs.getDate("repairmen_date"));
				bean.setRepairmenCompletion(rs.getDate("repairmen_completion"));
				bean.setRepairmenCause(rs.getString("repairmen_completion"));
				bean.setRepairmenCause(rs.getString("repairmen_cause"));
				bean.setRepairmenExpenses(rs.getString("repairmen_expenses"));
				bean.setRepairmenStatus(rs.getString("repairmen_status"));
				bean.setRepairmenId(name(rs.getInt("repairmen_id")));
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

	// findById
	int repairId;

	public RepairBean findById(Integer id) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		RepairBean bean = new RepairBean();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM repair rp WHERE rp.repair_id = ?");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setInt(1, id);
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean.setRepairId(rs.getInt("repair_id"));
				bean.setRepairDateStr(rs.getString("repair_date"));
				bean.setRepairname(rs.getString("repair_name"));
				bean.setRepairAddress(rs.getString("repair_address"));
				bean.setRepairPhone(rs.getString("repair_phone"));
				bean.setRepairEmail(rs.getString("repair_email"));
				bean.setRepairAppliances(appliances(rs.getString("repair_appliances")));
				bean.setRepairProduct(product(rs.getString("repair_product")));
				bean.setRepairBrand(brand(rs.getString("repair_brand")));
				bean.setRepairWaste(rs.getString("repair_waste"));
				bean.setRepairDetail(rs.getString("repair_detail"));
				bean.setRepairAppointment(rs.getDate("repair_appointment"));
				bean.setRepairmenDate(rs.getDate("repairmen_date"));
				bean.setRepairmenCompletion(rs.getDate("repairmen_completion"));
				bean.setRepairmenCause(rs.getString("repairmen_completion"));
				bean.setRepairmenCause(rs.getString("repairmen_cause"));
				bean.setRepairmenExpenses(rs.getString("repairmen_expenses"));
				bean.setRepairmenStatus(repairstatus(rs.getString("repairmen_status")));
				bean.setRepairmenId(name(rs.getInt("repairmen_id")));

				repairId = bean.getRepairId();

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}// findById

	// repairAppliances
	String appliances(String id) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		List<TypeAppliances> list = new ArrayList<>();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM type_appliances rp where rp.appliances_id = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, id);
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				TypeAppliances bean = new TypeAppliances();
				bean.setName(rs.getString("name"));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return list.get(0).getName();
	}// repairAppliances

	// product
	String product(String id) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		List<TypeProduct> list = new ArrayList<>();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM type_product rp where rp.product_id = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, id);
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				TypeProduct bean = new TypeProduct();
				bean.setProduct(rs.getString("product"));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return list.get(0).getProduct();
	}// product

	// brand
	String brand(String id) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		List<TypeAppliances> list = new ArrayList<>();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM type_brand rp where rp.id = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, id);
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				TypeAppliances bean = new TypeAppliances();
				bean.setName(rs.getString("name"));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return list.get(0).getName();
	}// brand

	// status

	String repairstatus(String id) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		List<RepairStatusBean> list = new ArrayList<>();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM repair_status rp where rp.id = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, id);
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				RepairStatusBean bean = new RepairStatusBean();
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

	// role
	String name(int id) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		List<LoginBean> list = new ArrayList<>();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM login rp where rp.id = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setInt(1, id);
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
	}// role

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

	// insertrepair
	public void insert(RepairBean bean) throws Exception {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(
					" INSERT INTO repair (repair_date, repair_name, repair_address, repair_phone, repair_email, repair_appliances, repair_product, repair_brand , repair_waste, repair_detail, repair_appointment, repair_latitude , repair_longitude) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?) ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setTimestamp(1, new java.sql.Timestamp(DateTHToEN(bean.getRepairDateStr()).getTime()));
			prepared.setString(2, bean.getRepairname());
			prepared.setString(3, bean.getRepairAddress());
			prepared.setString(4, bean.getRepairPhone());
			prepared.setString(5, bean.getRepairEmail());
			prepared.setString(6, bean.getRepairAppliances());
			prepared.setString(7, bean.getRepairProduct());
			prepared.setString(8, bean.getRepairBrand());
			prepared.setString(9, bean.getRepairWaste());
			prepared.setString(10, bean.getRepairDetail());
			prepared.setDate(11, bean.getRepairAppointment());
			prepared.setString(12, bean.getLatitude());
			prepared.setString(13, bean.getLongitude());
			prepared.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}// end method insert

	// update
	public void update(RepairBean bean) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(
					" UPDATE repair SET  repair_name = ? , repair_address = ?, repair_phone = ?, repair_email = ? WHERE repair_id = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, bean.getRepairname());
			prepared.setString(2, bean.getRepairAddress());
			prepared.setString(3, bean.getRepairPhone());
			prepared.setString(4, bean.getRepairEmail());
			prepared.setInt(5, bean.getRepairId());
			prepared.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}

	}// end method update
	
//	//test
//	String amnuay(TestAjaxBean testbean, int value) throws SQLException {
//		ConnectDB con = new ConnectDB();
//		PreparedStatement prepared = null;
//		StringBuilder sql = new StringBuilder();
//		List<LoginBean> list = new ArrayList<>();
//		Connection conn = con.openConnect();
//		 
//		try {
//			sql.append(" SELECT * FROM status_repairmen rp where rp.id = ? ");
//			prepared = conn.prepareStatement(sql.toString());
//			prepared.setInt(1, testbean.getId());
//			prepared.setInt(2, value);
//			ResultSet rs = prepared.executeQuery();
//			while (rs.next()) {
//				LoginBean bean = new LoginBean();
//				bean.setName(rs.getString("name"));
//			
//				
//				
//				list.add(bean);
//			}
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}finally {
//			conn.close();
//		}
//		return list.get(0).getName();
//		
//	}

	// repairmen_id
	public void repairid(TestAjaxBean bean, int value) throws SQLException {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();

		try {
			sql.append(" UPDATE repair SET repairmen_id = ? WHERE repair_id = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setInt(1, bean.getId());
			prepared.setInt(2, value);
			prepared.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}

	public TestAjaxBean repairId() {
		TestAjaxBean bean = new TestAjaxBean();
		bean.setrId(repairId);
		return bean;
	}

	// updaterepairmen
	public void updaterepairmen(RepairBean bean) throws Exception {
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();

		try {
			sql.append(
					" UPDATE repair SET  repairmen_date = ? , repairmen_completion = ?, repairmen_cause = ?, repairmen_expenses = ?, repairmen_status = ? WHERE repair_id = ? ");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setDate(1, bean.getRepairmenDate());
			prepared.setDate(2, bean.getRepairmenCompletion());
			prepared.setString(3, bean.getRepairmenCause());
			prepared.setString(4, bean.getRepairmenExpenses());
			prepared.setString(5, bean.getRepairmenStatus());
			prepared.setInt(6, bean.getRepairId());
			prepared.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}
	// list table

	public List<RepairBean> status1() throws SQLException {
		List<RepairBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM repair WHERE repairmen_status = '1' ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				RepairBean bean = new RepairBean();
				bean.setRepairId(rs.getInt("repair_id"));
				bean.setRepairDateStr(rs.getString("repair_date"));
				bean.setRepairname(rs.getString("repair_name"));
				bean.setRepairAddress(rs.getString("repair_address"));
				bean.setRepairPhone(rs.getString("repair_phone"));
				bean.setRepairEmail(rs.getString("repair_email"));
				bean.setRepairAppliances(appliances(rs.getString("repair_appliances")));
				bean.setRepairProduct(product(rs.getString("repair_product")));
				bean.setRepairBrand(brand(rs.getString("repair_brand")));
				bean.setRepairWaste(rs.getString("repair_waste"));
				bean.setRepairDetail(rs.getString("repair_detail"));
				bean.setRepairAppointment(rs.getDate("repair_appointment"));
				bean.setRepairmenDate(rs.getDate("repairmen_date"));
				bean.setRepairmenCompletion(rs.getDate("repairmen_completion"));
				bean.setRepairmenCause(rs.getString("repairmen_completion"));
				bean.setRepairmenCause(rs.getString("repairmen_cause"));
				bean.setRepairmenExpenses(rs.getString("repairmen_expenses"));
				bean.setRepairmenStatus(rs.getString("repairmen_status"));
				bean.setRepairmenId(name(rs.getInt("repairmen_id")));
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
		// list table

	public List<RepairBean> status2() throws SQLException {
		List<RepairBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM repair WHERE repairmen_status = '2' ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				RepairBean bean = new RepairBean();
				bean.setRepairId(rs.getInt("repair_id"));
				bean.setRepairDateStr(rs.getString("repair_date"));
				bean.setRepairname(rs.getString("repair_name"));
				bean.setRepairAddress(rs.getString("repair_address"));
				bean.setRepairPhone(rs.getString("repair_phone"));
				bean.setRepairEmail(rs.getString("repair_email"));
				bean.setRepairAppliances(appliances(rs.getString("repair_appliances")));
				bean.setRepairProduct(product(rs.getString("repair_product")));
				bean.setRepairBrand(brand(rs.getString("repair_brand")));
				bean.setRepairWaste(rs.getString("repair_waste"));
				bean.setRepairDetail(rs.getString("repair_detail"));
				bean.setRepairAppointment(rs.getDate("repair_appointment"));
				bean.setRepairmenDate(rs.getDate("repairmen_date"));
				bean.setRepairmenCompletion(rs.getDate("repairmen_completion"));
				bean.setRepairmenCause(rs.getString("repairmen_completion"));
				bean.setRepairmenCause(rs.getString("repairmen_cause"));
				bean.setRepairmenExpenses(rs.getString("repairmen_expenses"));
				bean.setRepairmenStatus(rs.getString("repairmen_status"));
				bean.setRepairmenId(name(rs.getInt("repairmen_id")));
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
		// list table

	public List<RepairBean> status3() throws SQLException {
		List<RepairBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM repair WHERE repairmen_status = '3' ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				RepairBean bean = new RepairBean();
				bean.setRepairId(rs.getInt("repair_id"));
				bean.setRepairDateStr(rs.getString("repair_date"));
				bean.setRepairname(rs.getString("repair_name"));
				bean.setRepairAddress(rs.getString("repair_address"));
				bean.setRepairPhone(rs.getString("repair_phone"));
				bean.setRepairEmail(rs.getString("repair_email"));
				bean.setRepairAppliances(appliances(rs.getString("repair_appliances")));
				bean.setRepairProduct(product(rs.getString("repair_product")));
				bean.setRepairBrand(brand(rs.getString("repair_brand")));
				bean.setRepairWaste(rs.getString("repair_waste"));
				bean.setRepairDetail(rs.getString("repair_detail"));
				bean.setRepairAppointment(rs.getDate("repair_appointment"));
				bean.setRepairmenDate(rs.getDate("repairmen_date"));
				bean.setRepairmenCompletion(rs.getDate("repairmen_completion"));
				bean.setRepairmenCause(rs.getString("repairmen_completion"));
				bean.setRepairmenCause(rs.getString("repairmen_cause"));
				bean.setRepairmenExpenses(rs.getString("repairmen_expenses"));
				bean.setRepairmenStatus(rs.getString("repairmen_status"));
				bean.setRepairmenId(name(rs.getInt("repairmen_id")));
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
		// list table

	public List<RepairBean> status4() throws SQLException {
		List<RepairBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM repair WHERE repairmen_status = '4' ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				RepairBean bean = new RepairBean();
				bean.setRepairId(rs.getInt("repair_id"));
				bean.setRepairDateStr(rs.getString("repair_date"));
				bean.setRepairname(rs.getString("repair_name"));
				bean.setRepairAddress(rs.getString("repair_address"));
				bean.setRepairPhone(rs.getString("repair_phone"));
				bean.setRepairEmail(rs.getString("repair_email"));
				bean.setRepairAppliances(appliances(rs.getString("repair_appliances")));
				bean.setRepairProduct(product(rs.getString("repair_product")));
				bean.setRepairBrand(brand(rs.getString("repair_brand")));
				bean.setRepairWaste(rs.getString("repair_waste"));
				bean.setRepairDetail(rs.getString("repair_detail"));
				bean.setRepairAppointment(rs.getDate("repair_appointment"));
				bean.setRepairmenDate(rs.getDate("repairmen_date"));
				bean.setRepairmenCompletion(rs.getDate("repairmen_completion"));
				bean.setRepairmenCause(rs.getString("repairmen_completion"));
				bean.setRepairmenCause(rs.getString("repairmen_cause"));
				bean.setRepairmenExpenses(rs.getString("repairmen_expenses"));
				bean.setRepairmenStatus(rs.getString("repairmen_status"));
				bean.setRepairmenId(name(rs.getInt("repairmen_id")));
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
		// list table

	public List<RepairBean> status5() throws SQLException {
		List<RepairBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM repair WHERE repairmen_status = '5' ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				RepairBean bean = new RepairBean();
				bean.setRepairId(rs.getInt("repair_id"));
				bean.setRepairDateStr(rs.getString("repair_date"));
				bean.setRepairname(rs.getString("repair_name"));
				bean.setRepairAddress(rs.getString("repair_address"));
				bean.setRepairPhone(rs.getString("repair_phone"));
				bean.setRepairEmail(rs.getString("repair_email"));
				bean.setRepairAppliances(appliances(rs.getString("repair_appliances")));
				bean.setRepairProduct(product(rs.getString("repair_product")));
				bean.setRepairBrand(brand(rs.getString("repair_brand")));
				bean.setRepairWaste(rs.getString("repair_waste"));
				bean.setRepairDetail(rs.getString("repair_detail"));
				bean.setRepairAppointment(rs.getDate("repair_appointment"));
				bean.setRepairmenDate(rs.getDate("repairmen_date"));
				bean.setRepairmenCompletion(rs.getDate("repairmen_completion"));
				bean.setRepairmenCause(rs.getString("repairmen_completion"));
				bean.setRepairmenCause(rs.getString("repairmen_cause"));
				bean.setRepairmenExpenses(rs.getString("repairmen_expenses"));
				bean.setRepairmenStatus(rs.getString("repairmen_status"));
				bean.setRepairmenId(name(rs.getInt("repairmen_id")));
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
		// list table

	public List<RepairBean> status6() throws SQLException {
		List<RepairBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT * FROM repair WHERE repairmen_status = '6' ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				RepairBean bean = new RepairBean();
				bean.setRepairId(rs.getInt("repair_id"));
				bean.setRepairDateStr(rs.getString("repair_date"));
				bean.setRepairname(rs.getString("repair_name"));
				bean.setRepairAddress(rs.getString("repair_address"));
				bean.setRepairPhone(rs.getString("repair_phone"));
				bean.setRepairEmail(rs.getString("repair_email"));
				bean.setRepairAppliances(appliances(rs.getString("repair_appliances")));
				bean.setRepairProduct(product(rs.getString("repair_product")));
				bean.setRepairBrand(brand(rs.getString("repair_brand")));
				bean.setRepairWaste(rs.getString("repair_waste"));
				bean.setRepairDetail(rs.getString("repair_detail"));
				bean.setRepairAppointment(rs.getDate("repair_appointment"));
				bean.setRepairmenDate(rs.getDate("repairmen_date"));
				bean.setRepairmenCompletion(rs.getDate("repairmen_completion"));
				bean.setRepairmenCause(rs.getString("repairmen_completion"));
				bean.setRepairmenCause(rs.getString("repairmen_cause"));
				bean.setRepairmenExpenses(rs.getString("repairmen_expenses"));
				bean.setRepairmenStatus(rs.getString("repairmen_status"));
				bean.setRepairmenId(name(rs.getInt("repairmen_id")));
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

	// list count
	public RepairBean count() throws SQLException {
		RepairBean bean = new RepairBean();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT count(repair_id) as repairSum FROM repair ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean.setRepairId(rs.getInt("repairSum"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}// end method list

	// list count1
	public RepairBean count1() throws SQLException {
		RepairBean bean = new RepairBean();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT count(repair_id) as repairSum FROM  repair WHERE repairmen_status = '1' ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean.setRepairId(rs.getInt("repairSum"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}// end method list1

	// list count1
	public RepairBean count2() throws SQLException {
		RepairBean bean = new RepairBean();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT count(repair_id) as repairSum FROM  repair WHERE repairmen_status = '2' ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean.setRepairId(rs.getInt("repairSum"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}// end method list1

	// list count1
	public RepairBean count3() throws SQLException {
		RepairBean bean = new RepairBean();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT count(repair_id) as repairSum FROM  repair WHERE repairmen_status = '3' ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean.setRepairId(rs.getInt("repairSum"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}// end method list1

	// list count1
	public RepairBean count4() throws SQLException {
		RepairBean bean = new RepairBean();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT count(repair_id) as repairSum FROM  repair WHERE repairmen_status = '4' ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean.setRepairId(rs.getInt("repairSum"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}// end method list1
		// list count1

	public RepairBean count5() throws SQLException {
		RepairBean bean = new RepairBean();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT count(repair_id) as repairSum FROM  repair WHERE repairmen_status = '5' ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean.setRepairId(rs.getInt("repairSum"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}// end method list1
		// list count1

	public RepairBean count6() throws SQLException {
		RepairBean bean = new RepairBean();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		Connection conn = con.openConnect();
		try {
			sql.append(" SELECT count(repair_id) as repairSum FROM  repair WHERE repairmen_status = '6' ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean.setRepairId(rs.getInt("repairSum"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}// end method list1

	// list table
	// endclass
}
