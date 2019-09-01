package com.blog.web;

import static org.hamcrest.CoreMatchers.endsWith;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;

import com.blog.dto.Result;
import com.blog.entity.ArticleInfo;
import com.blog.service.ArticleInfoService;
import com.blog.service.TypeInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("article")
public class ArticleInfoController {
	
	@Autowired
	private ArticleInfoService articleInfoService;
	
	@Autowired
	private TypeInfoService typeInfoService;
	
	@RequestMapping("list")
	public String list(ModelMap map, @RequestParam(value="pageNum", defaultValue="1") int pageNum,
			@RequestParam(value="pageSize", defaultValue="10") int pageSize,
			@RequestParam(value="typeId", required = false) String typeId,
			@RequestParam(value="startDate", required = false) String startDate,
			@RequestParam(value="endDate", required = false) String endDate,			
			@RequestParam(value="title", required = false) String title			
			) {
		
		Map<String, String> param = new HashMap<>();
		param.put("endDate", endDate);
		param.put("typeId", typeId);
		param.put("startDate", startDate);
		param.put("title", title);
		param.put("status", "1");
		
		
		// PageHelper分页插件
		// 只需要在查询之前调用，传入页码和每页显示的条数
		PageHelper.startPage(pageNum, pageSize);
		List<ArticleInfo> articleInfos = articleInfoService.list();
		//map.put("list", articleInfos);
		PageInfo<ArticleInfo> pageInfo = new PageInfo<>(articleInfos);
		map.put("pageInfo", pageInfo);
		
		//查询所有文章分类
		map.put("typeList", typeInfoService.list());
 		return "admin/list_article";
		
	}
	
	@RequestMapping("edit")
	public String edit(ModelMap map, @RequestParam(required=false, value="id") String id) {
		
		/**
		 * 判断是新增还是
		 */
		if (!StringUtils.isEmpty(id)) {
			ArticleInfo articleInfo = articleInfoService.selectById(id);
			map.put("articleInfo", articleInfo);
		}
		
		//查询所有文章分类
		map.put("typeList", typeInfoService.list());
		return "admin/article_edit";
		
	}
	
	
	@RequestMapping("upload")
	@ResponseBody
	public Result<String> upload(MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException {
		String szFileName = file.getOriginalFilename();
		String szNewFileName = "";
		String szDateFolder = "";
		
		if (file!=null && szFileName!=null&&szFileName.length()>0) {
			Date date = new Date();
			szDateFolder = new SimpleDateFormat("yyyy/MM/dd").format(date);
			String szFilePath = "D:\\upload\\" + szDateFolder;
			File file2 = new File(szDateFolder);
			if (!file2.exists()) {
				file2.mkdir();
			}
			
			//新文件名称
			szNewFileName = UUID.randomUUID() + szFileName.substring(szFileName.lastIndexOf("."));
			File newFile = new File(szFilePath + "\\" + szNewFileName);
			file.transferTo(newFile);
		}
		
		return new Result(true, szDateFolder+"/"+szNewFileName, "文件上传成功");
	}
	
	@RequestMapping("upload.json")
	@ResponseBody
	public Result<String> uploadJSON(MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException {
		String szFileName = file.getOriginalFilename();
		String szNewFileName = "";
		String szDateFolder = "";
		
		if (file!=null && szFileName!=null&&szFileName.length()>0) {
			Date date = new Date();
			szDateFolder = new SimpleDateFormat("yyyy/MM/dd").format(date);
			String szFilePath = "D:\\upload\\" + szDateFolder;
			File file2 = new File(szDateFolder);
			if (!file2.exists()) {
				file2.mkdir();
			}
			
			//新文件名称
			szNewFileName = UUID.randomUUID() + szFileName.substring(szFileName.lastIndexOf("."));
			File newFile = new File(szFilePath + "\\" + szNewFileName);
			file.transferTo(newFile);
		}
		
		return new Result(true, "http://localhost:8080/upload/"+szDateFolder+"/"+szNewFileName, "文件上传成功");
	}
	
	@RequestMapping("save")
	@ResponseBody
	public Result<String> saveArticle(ArticleInfo articleInfo){
		articleInfoService.save(articleInfo);
		return new Result(true, "保存成功", "");
	}
	
	
}
