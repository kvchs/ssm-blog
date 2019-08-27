package com.blog.dto;

import org.springframework.util.StringUtils;

/**
 * 封装json对象，所有返回结果都使用它
 */
public class Result<T> {

	private boolean success;// 是否成功标志

	private T data;// 成功时返回的数据

	private String error;// 错误信息

	public Result() {
	}
	
	/*public static Result<String> success(){
		Result<String> result = new Result<>();
		result.setSuccess(true);
		result.setData("操作成功");
		return result;
	}
	
	public static Result<String> error(String msg){
		Result<String> result = new Result<>();
		result.setSuccess(false);
		if (StringUtils.isEmpty(msg)) {
			result.setData("操作失败");
		}else {
			result.setData(msg);
		}
		return result;
	}*/

	// 成功时的构造器
	public Result(boolean success, T data) {
		this.success = success;
		this.data = data;
	}

	// 错误时的构造器
	public Result(boolean success, String error) {
		this.success = success;
		this.error = error;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	@Override
	public String toString() {
		return "Result [success=" + success + ", data=" + data + ", error=" + error + "]";
	}

	// 省略getter和setter方法
	
}

