package com.blog.dao;

import java.util.List;
import java.util.Map;

import com.blog.entity.ArticleInfo;

public interface ArticleInfoDao {
	
	List<ArticleInfo> list();

	ArticleInfo selectById(String id);
	
	int insert(ArticleInfo articleInfo);
	
	int update(ArticleInfo articleInfo);

	List<ArticleInfo> list(Map<String, String> param);

}
