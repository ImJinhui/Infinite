
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

import com.ideaall.infinite.service.AdminAbilityService;

@Controller
public class AdminAbilityController {
	private final static String MAPPING = "/admin/ability/";

	@Autowired
	private AdminAbilityService service;
    
	// Receive Parameters from Html Using @RequestParam Map with @PathVariable
	@RequestMapping(value = MAPPING+"{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(@RequestParam MultiValueMap<Object, Object> paramMultiMap, @RequestParam Map<String, Object> paramMap, 
			@PathVariable String action, ModelAndView modelandView) {

		String viewName = MAPPING + action ;
		String forwardView = (String) paramMap.get("forwardView") ;

		Map<String, Object> resultMap = new HashMap<String, Object>() ;
		List<Object> resultList = new ArrayList<Object>();

		// divided depending on action value
		if ("ability_list".equalsIgnoreCase(action)) {
			resultMap = (Map<String, Object>) service.getList(paramMap);
		} else if ("ability_merge".equalsIgnoreCase(action)) {
			service.saveObject(paramMap);
			resultMap = (Map<String, Object>) service.getList(paramMap);
		} else if ("ability_delete".equalsIgnoreCase(action)) {
			service.deleteObject(paramMap);
			resultMap = (Map<String, Object>) service.getList(paramMap);
			forwardView = "/admin/ability/ability_list";
		} else if("ability_edit".equalsIgnoreCase(action)) {
			resultMap = (Map<String, Object>) service.getObject(paramMap);
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

