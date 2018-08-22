package com.bru.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.bru.dao.AjaxDao;
import com.bru.dao.RepairDao;
import com.bru.model.TestAjaxBean;
import com.bru.model.TypeAppliances;
import com.bru.model.TypeBrand;
import com.bru.model.TypeProduct;

@RestController
public class AjaxController {

	@Autowired
	AjaxDao ajaxDao;

	@Autowired
	RepairDao repairDao;

	// Drop-down
	@RequestMapping(value = "/appliances")
	public List<TypeAppliances> appliances() throws SQLException{
		List<TypeAppliances> list = new ArrayList<>();
		list = ajaxDao.appliances();
		return list;
	}

	// Drop-down
	@RequestMapping(value = "/product", method = RequestMethod.POST)
	public List<TypeProduct> product(@RequestBody TestAjaxBean testAjexBean)  throws SQLException {
		List<TypeProduct> list = new ArrayList<>();
		list = ajaxDao.product(testAjexBean);		
		return list;
	}

	@RequestMapping(value = "/brand", method = RequestMethod.POST)
	public List<TypeBrand> brand(@RequestBody TestAjaxBean testAjexBean) throws SQLException {
		List<TypeBrand> list = new ArrayList<>();
		list = ajaxDao.brand(testAjexBean);
		return list;
	}
	
}
