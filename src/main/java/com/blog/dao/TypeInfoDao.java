package com.blog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blog.entity.TypeInfo;

public interface TypeInfoDao {
	List<TypeInfo> list();

	int update(@Param("id") String id, @Param("sort") String sort, @Param("name") String name);

	int insert(@Param("sort") String sort, @Param("name") String name);

	int delete(@Param("idArr") String[] idArr);
}
