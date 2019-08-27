package com.blog.web;

import javax.security.auth.login.LoginException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.dto.Result;
import com.blog.entity.UserInfo;
import com.blog.service.UserInfoService;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private UserInfoService userInfoService;

	@RequestMapping("index")
	public String index() {
		return "admin/index";
	}

	@RequestMapping("login")
	public String login() {
		return "admin/login";
	}

	@RequestMapping("login_action")
	@ResponseBody
	public Result<UserInfo> loginAction(ModelMap map, HttpServletRequest request) throws LoginException {
		/* 获取参数 */
		String loginName = request.getParameter("loginName");
		String password = request.getParameter("password");
		// 校验参数
		if (StringUtils.isEmpty(loginName) || StringUtils.isEmpty(password)) {
			return new Result<>(false, "用户名或者密码不能为空");
			// throw new LoginException("用户名或者密码不能为空");
		}
		UserInfo userInfo = userInfoService.checkUser(loginName, password);
		if (userInfo == null) {
			// return new Result<>(false, "用户名或者密码不正确");
			throw new LoginException("用户名或者密码不能为空");
		}
		// 设置session
		request.getSession().setAttribute("userInfo", userInfo);
		return new Result<>(true, userInfo);
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		// 销毁session
		session.invalidate();
		return "admin/login";
	}
}
