package com.blog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.dao.UserInfoDao;
import com.blog.entity.UserInfo;


@Service("UserInfoService")
public class UserInfoService {
	
	@Autowired
	private UserInfoDao userInfoDao;
	
	public UserInfo checkUser(String name, String password) {
		return userInfoDao.checkUser(name, password);
	}
}