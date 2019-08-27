package com.blog.exception;

/**
 * 系统自定义异常处理类，针对预期的异常，需要在程序中抛出
 * @author Administrator
 *
 */
public class LoginException extends Exception {
	private static final long serialVersionUID = 1L;
	private String message;

	public LoginException(String message) {
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	};
	
	
	
	
	

}
