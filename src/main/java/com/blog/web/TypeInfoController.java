package com.blog.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.entity.TypeInfo;
import com.blog.service.TypeInfoService;

@Controller
@RequestMapping("type")
public class TypeInfoController {
	
	@Autowired
	private TypeInfoService typeInfoService;
	
	
	@RequestMapping("list")
	public String list(ModelMap map) {
		
		List<TypeInfo> list = typeInfoService.list();
		map.put("list", list);
		return "admin/list";
		
	}

}
