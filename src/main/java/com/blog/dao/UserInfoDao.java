package com.blog.dao;

import org.apache.ibatis.annotations.Param;

import com.blog.entity.UserInfo;


public interface UserInfoDao {
	UserInfo checkUser(@Param("name") String name, @Param("password") String password);

}
