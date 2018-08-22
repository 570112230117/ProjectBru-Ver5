package com.bru.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bru.dao.LoginDao;
import com.bru.dao.PartsDao;
import com.bru.dao.RepairmenDao;
import com.bru.model.LoginBean;
import com.bru.model.PartsBean;
import com.bru.model.RepairStatusBean;
import com.bru.model.RoleBean;

@RestController
public class RepairmenRestController {

	@Autowired
	RepairmenDao repairmenDao;

	@Autowired
	LoginDao loginDao;
	
	@Autowired
	PartsDao partsDao;

	@RequestMapping(value = "/tabelrepairmen")
	public List<LoginBean> all() throws SQLException {
		List<LoginBean> list = new ArrayList<>();
		list = loginDao.findAll();
		return list;
	}

	// Drop-down
	@RequestMapping(value = "/position")
	public List<RoleBean> addrepairmen() throws SQLException {
		List<RoleBean> list = new ArrayList<>();
		list = repairmenDao.role();
		return list;
	}

	// Drop-down
	@RequestMapping(value = "/repairstatus")
	public List<RepairStatusBean> rest() throws SQLException {
		List<RepairStatusBean> list = new ArrayList<>();
		list = repairmenDao.repairstatus();
		return list;
	}
	
	
	//part
	@RequestMapping(value = "/partsjson")
	public List<PartsBean> part() throws SQLException {
		List<PartsBean> list = new ArrayList<>();
		list = partsDao.findAll();
		return list;
	}
	
	// end
}
