package com.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.dao.ArticleInfoDao;
import com.blog.entity.ArticleInfo;
import com.blog.service.ArticleInfoService;

@Service
public class ArticleInfoServiceImpl implements ArticleInfoService{
	
	@Autowired
	private ArticleInfoDao articleInfo;

	@Override
	public List<ArticleInfo> list() {
		return articleInfo.list();
	}

	/**
	 * 查询单个文章信息
	 */
	@Override
	public ArticleInfo selectById(String id) {
		return articleInfo.selectById(id);
	}

}
