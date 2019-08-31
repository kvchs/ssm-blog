package com.blog.dao;

import java.util.List;

import com.blog.entity.ArticleInfo;

public interface ArticleInfoDao {
	
	List<ArticleInfo> list();

	ArticleInfo selectById(String id);

}
