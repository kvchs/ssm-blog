package com.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.blog.dao.TypeInfoDao;
import com.blog.entity.TypeInfo;
import com.blog.service.TypeInfoService;

@Service
public class TypeInfoServiceImpl implements TypeInfoService {

	@Autowired
	private TypeInfoDao typeInfoDao;

	/**
	 * 查询所有文章分类
	 */
	@Override
	public List<TypeInfo> list() {
		return typeInfoDao.list();
	}

	/**
	 * 批量插入文章分类
	 */
	@Override
	public void save(String[] idArr, String[] sortArr, String[] nameArr) {

		for (int i = 0; i < idArr.length; i++) {

			if (StringUtils.isEmpty(idArr[i])) {
				// 插入
				typeInfoDao.insert(sortArr[i], nameArr[i]);
			} else {
				// 更新
				typeInfoDao.update(idArr[i], sortArr[i], nameArr[i]);
			}
		}
	}

	@Override
	public void delete(String[] idArr) {
				
				typeInfoDao.delete(idArr);
	}

}
