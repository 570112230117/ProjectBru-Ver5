package com.bru.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bru.dao.LoginDao;
import com.bru.dao.RepairDao;
import com.bru.model.LoginBean;
import com.bru.model.RepairBean;

@Controller
public class LoginController {

	@Autowired
	LoginDao loginDao;

	@Autowired
	RepairDao repairDao;

	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("messessError", "");
		return "login";
	}

	@RequestMapping("/welcome")
	public String authenLogin(String username, String password, HttpServletRequest request, Model model) throws SQLException {
		String authen = "";
		LoginBean bean = new LoginBean();

			bean = loginDao.login(username, password);
			request.getSession().setAttribute("LoginUser", bean);
			if (bean.getUsername() != null) {
				if (bean.getRole().equals("1")) {
					RepairBean beann = new RepairBean();
					beann = repairDao.count();
					request.getSession().setAttribute("beanRe", beann);
					beann = repairDao.count1();
					request.getSession().setAttribute("bean1", beann);
					beann = repairDao.count2();
					request.getSession().setAttribute("bean2", beann);
					beann = repairDao.count3();
					request.getSession().setAttribute("bean3", beann);
					beann = repairDao.count4();
					request.getSession().setAttribute("bean4", beann);
					beann = repairDao.count5();
					request.getSession().setAttribute("bean5", beann);
					beann = repairDao.count6();
					request.getSession().setAttribute("bean6", beann);
					authen = "welcome";
				} else if (bean.getRole().equals("2")) {
					RepairBean beann = new RepairBean();
					beann = repairDao.count();
					request.getSession().setAttribute("beanRe", beann);
					beann = repairDao.count1();
					request.getSession().setAttribute("bean1", beann);
					beann = repairDao.count2();
					request.getSession().setAttribute("bean2", beann);
					beann = repairDao.count3();
					request.getSession().setAttribute("bean3", beann);
					beann = repairDao.count4();
					request.getSession().setAttribute("bean4", beann);
					beann = repairDao.count5();
					request.getSession().setAttribute("bean5", beann);
					beann = repairDao.count6();
					request.getSession().setAttribute("bean6", beann);
					authen = "hello";
				}
			} else {
				model.addAttribute("messessError", "F");
				authen = "login";
			}
	
		return authen;
	}

	@RequestMapping("/logout")
	private String logout(HttpServletRequest request, Model model) {
		request.getSession().removeAttribute("LoginUser");
		request.getSession().removeAttribute("beanRe");
		request.getSession().removeAttribute("bean1");
		request.getSession().removeAttribute("bean2");
		request.getSession().removeAttribute("bean3");
		request.getSession().removeAttribute("bean4");
		request.getSession().removeAttribute("bean5");
		request.getSession().removeAttribute("bean6");
		model.addAttribute("messessError", "L");
		return "login";
	}
}
