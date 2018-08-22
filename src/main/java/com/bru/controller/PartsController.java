package com.bru.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.bru.dao.PartsDao;
import com.bru.dao.RepairDao;
import com.bru.model.PartsBean;

@Controller
public class PartsController {

	@Autowired
	PartsDao partsDao;

	@Autowired
	RepairDao repairDao;

	@RequestMapping(path = "/addparts", method = RequestMethod.GET)
	public String addpart(HttpServletRequest request, Model model) throws SQLException {
		return "addparts";
	}

	// insert
	@RequestMapping(value = { "/insertparts" }, method = RequestMethod.POST, produces = "application/json")
	public Map<String, String> insert(@RequestBody PartsBean partsBean) throws Exception {
		partsDao.insert(partsBean);
		Map<String, String> part = new HashMap<String, String>();
		return part;
	}

	// end
}
