package com.blog.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.service.UserInfoService;


@Controller
@RequestMapping("user")
public class UserInfoController {

	@Autowired
	private UserInfoService uInfoService;
	
	
	@RequestMapping("info")
	@ResponseBody
	public String index() {
		return "login";
	}
}
