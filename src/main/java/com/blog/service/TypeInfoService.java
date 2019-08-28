package com.blog.service;

import java.util.List;

import com.blog.entity.TypeInfo;

public interface TypeInfoService {

	public List<TypeInfo> list();

	public void save(String[] idArr, String[] sortArr, String[] nameArr);

	public void delete(String[] idArr);
}
