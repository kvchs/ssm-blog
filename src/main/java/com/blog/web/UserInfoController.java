package com.blog.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.entity.UserInfo;
import com.blog.service.UserInfoService;


@Controller
@RequestMapping("user")
public class UserInfoController {

	@Autowired
	private UserInfoService uInfoService;
	
	
	@RequestMapping("info")
	@ResponseBody
	public String indexTest() {
		return "login";
	}
	
	@RequestMapping("index")
	public String index() {
		return "login";
	}
	
	@RequestMapping("login")
	public String login(ModelMap modelMap, @RequestParam(required=false, value="name") String name, @RequestParam(required=false, value="password") String password) {
		if (StringUtils.isEmpty(name) || StringUtils.isEmpty(password) ) {
			return "login";
		}
		UserInfo userInfo = uInfoService.checkUser(name, password);
		if (userInfo == null) {
			return "login";
		}
		
		return "home";
	}
}
