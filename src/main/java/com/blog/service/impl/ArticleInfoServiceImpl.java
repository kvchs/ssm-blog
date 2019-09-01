package com.blog.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.NativeWebRequest;

import com.blog.dao.ArticleInfoDao;
import com.blog.entity.ArticleInfo;
import com.blog.service.ArticleInfoService;

@Service
public class ArticleInfoServiceImpl implements ArticleInfoService{
	
	@Autowired
	private ArticleInfoDao articleInfoDao;

	@Override
	public List<ArticleInfo> list() {
		return articleInfoDao.list();
	}

	/**
	 * 查询单个文章信息
	 */
	@Override
	public ArticleInfo selectById(String id) {
		return articleInfoDao.selectById(id);
	}

	@Override
	public void save(ArticleInfo articleInfo) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = format.format(date);
		if (StringUtils.isEmpty(articleInfo.getId())) {
			// 新增
			articleInfo.setStatus(1);
			articleInfo.setUpdateTime(now);
			articleInfo.setViewCount(1);
			int max=10000,min=1;
			long randomNum = System.currentTimeMillis();  
			int ran3 = (int) (randomNum%(max-min)+min); 
			articleInfo.setId(String.valueOf(ran3));
			articleInfoDao.insert(articleInfo);
		}else {
			// 更新
			articleInfo.setUpdateTime(now);
			articleInfo.setStatus(1);
			articleInfoDao.update(articleInfo);
		}
	}

	@Override
	public List<ArticleInfo> list(Map<String, String> param) {
		return articleInfoDao.list(param);
	}

}
