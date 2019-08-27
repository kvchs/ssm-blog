package com.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.dao.TypeInfoDao;
import com.blog.entity.TypeInfo;
import com.blog.service.TypeInfoService;

@Service
public class TypeInfoServiceImpl implements TypeInfoService{
	
	@Autowired
	private TypeInfoDao typeInfoDao;

	/**
	 * 查询所有文章分类
	 */
	@Override
	public List<TypeInfo> list() {
		return typeInfoDao.list();
	}

}
