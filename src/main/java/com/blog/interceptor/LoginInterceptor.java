package com.blog.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.blog.entity.UserInfo;

public class LoginInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		// 获取拦截请求的地址
		String url = request.getRequestURI();
		// 对特殊地址直接放行
		if (url.indexOf("login") >= 0) {
			return true;
		}
		// 判断session，session存在的话，登陆后台
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		if (userInfo != null) {
			return true;
		}
		
		// 跳转到登录页面
		request.getRequestDispatcher("/WEB-INF/jsp/admin/login.jsp").forward(request, response);
		
		return false;
		//return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

}
