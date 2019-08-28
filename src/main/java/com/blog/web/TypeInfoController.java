package com.blog.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.dto.Result;
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

	@RequestMapping("save_type")
	@ResponseBody
	public Result<String> saveType(@RequestParam(value = "idArr") String[] idArr, @RequestParam(value = "sortArr") String[] sortArr,
			@RequestParam(value = "nameArr") String[] nameArr) {
		typeInfoService.save(idArr, sortArr, nameArr);
		return new Result<>(true, "更新数据成功","");

	}
	
	@RequestMapping("delete")
	@ResponseBody
	public Result<String> delete(@RequestParam(value = "idArr") String[] idArr) {
		System.out.println(idArr);
		for(String i: idArr) {
			System.out.println(i);
		}
		typeInfoService.delete(idArr);
		return new Result<>(true, "成功删除数据","");

	}

}
