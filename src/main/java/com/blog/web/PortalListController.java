package com.blog.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.entity.ArticleInfo;
import com.blog.service.ArticleInfoService;
import com.blog.service.TypeInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RequestMapping("portal")
@Controller
public class PortalListController {
	
	@Autowired
	private ArticleInfoService articleInfoService;
	
	@Autowired
	private TypeInfoService typeInfoService;
	
	@RequestMapping("index")
	public String portalMain(ModelMap map, @RequestParam(value="pageNum", defaultValue="1") int pageNum,
			@RequestParam(value="pageSize", defaultValue="1") int pageSize
			) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("status", 1);
		PageHelper.startPage(pageNum, pageSize);
		List<ArticleInfo> list = articleInfoService.list();
		PageInfo<ArticleInfo> pageInfo = new PageInfo<>();
		map.put("pageInfo", pageInfo);
		map.put("typeList", typeInfoService.list());
		return "portal/index";
	}

}
