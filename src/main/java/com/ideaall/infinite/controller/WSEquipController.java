package com.ideaall.infinite.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ideaall.infinite.service.AdminEquipService;


@RestController
public class WSEquipController {

	@Autowired
	private AdminEquipService service;
	

	@RequestMapping(value = "/wsEquip/{action}", method = { RequestMethod.GET, RequestMethod.POST }, produces = "application/json")
	public  Object actionMethod(@RequestParam Map<String, Object> paramMap, @PathVariable String action) {
		
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Object> resultList = new ArrayList<Object>();
		
		if ("equipList".equalsIgnoreCase(action)) {
			resultList = (List<Object>) service.getListByCategory(paramMap);
			return resultList;
		} else if("subCateList".equalsIgnoreCase(action)) {
			resultList = (List<Object>) service.getSubCateList(paramMap);
			return resultList;
		
		}else if ("firstList".equalsIgnoreCase(action)) {
//			resultList = service.getList("board.list2", paramMap);
//			resultMap = service.getObject("board.read", paramMap);
		} else if ("commentList".equals(action)) {
//			resultList = service.getList("comment.list", paramMap);
			return resultList;
		} 
		return resultMap;
	}
	
	
	
}
