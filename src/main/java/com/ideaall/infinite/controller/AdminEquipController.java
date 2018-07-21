package com.ideaall.infinite.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ideaall.infinite.component.MapParamCollector;
import com.ideaall.infinite.service.AdminEquipService;

@Controller
public class AdminEquipController {
	private final static String MAPPING = "/admin/equip/";

	@Autowired
	private AdminEquipService service;
    
	// Receive Parameters from Html Using @RequestParam Map with @PathVariable
	@RequestMapping(value = MAPPING+"{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(MapParamCollector paramMethodMap, @PathVariable String action, ModelAndView modelandView) {
		
		Map<Object,Object> paramMap = paramMethodMap.getMap();
		String viewName = MAPPING + action ;
		String forwardView = (String) paramMap.get("forwardView") ;

		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Object> resultList = new ArrayList<Object>();

		// divided depending on action value
		if ("equip_list".equalsIgnoreCase(action)) {
			resultMap =  (Map<String, Object>) service.getList(paramMap);
		} else if ("equip_listByCate".equalsIgnoreCase(action)) {
			resultMap = (Map<String, Object>) service.getListByCategory(paramMap);
		} else if ("equip_merge".equalsIgnoreCase(action)) {
 			service.saveObject(paramMap);
			resultMap =  (Map<String, Object>) service.getList(paramMap);
		} else if("equip_edit".equalsIgnoreCase(action)) {
			//장비 카테고리 세팅 위함 
			resultMap =  (Map<String, Object>) service.getList(paramMap);
			resultMap.put("resultObject", service.getObject(paramMap));
		} else if("equip_delete".equalsIgnoreCase(action)) {
			service.deleteObject(paramMap);
			resultMap =  (Map<String, Object>) service.getList(paramMap);
			forwardView = "/admin/equip/equip_list";
		}
		

		if(forwardView != null){
			viewName = forwardView;
		}
		
		modelandView.setViewName(viewName);

		modelandView.addObject("paramMap", paramMap);
		modelandView.addObject("resultMap", resultMap);
		modelandView.addObject("resultList", resultList);
		return modelandView;
	}

}
