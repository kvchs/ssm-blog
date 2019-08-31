package com.blog.service;

import java.util.List;

import com.blog.entity.ArticleInfo;

public interface ArticleInfoService {
	
	List<ArticleInfo> list();

	ArticleInfo selectById(String id);

}
