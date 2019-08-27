package com.blog.exception;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.blog.dto.Result;
import com.google.gson.Gson;

public class LoginExceptionResolver implements HandlerExceptionResolver{

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		// 打印到控制台
		ex.printStackTrace();
		//定义错误信息
		String message = "系统异常，请联系管理员";
		if (ex instanceof LoginException) {
			message = ((LoginException)ex).getMessage();
		}
		// 判断请求类型
		HandlerMethod handlerMethod = (HandlerMethod)handler;
		ResponseBody responseBody = handlerMethod.getMethod().getAnnotation(ResponseBody.class);
		// json请求，就返回json数据
		if (responseBody != null) {
			Result<String> result = new Result<>();
			result.setSuccess(false);
			result.setData("验证失败");
			result.setError(message);
			String json = new Gson().toJson(result);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=utf-8");
			try {
				response.getWriter().write(json);
				response.getWriter().flush();
			}catch (IOException e) {
				e.printStackTrace();
			}
			// 返回一个空ModelAndView代码手动生成响应
			return new ModelAndView();
		}
		
		// 跳转页面的请求，就跳转到错误页面
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("message", message);
		//指向错误页面
		modelAndView.setViewName("error");
		
		return modelAndView;
	}

}
