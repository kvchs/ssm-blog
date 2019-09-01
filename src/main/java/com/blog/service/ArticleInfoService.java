package com.blog.service;

import java.util.List;
import java.util.Map;

import com.blog.entity.ArticleInfo;

public interface ArticleInfoService {
	
	List<ArticleInfo> list();

	ArticleInfo selectById(String id);

	void save(ArticleInfo articleInfo);

	List<ArticleInfo> list(Map<String, String> param);

}
