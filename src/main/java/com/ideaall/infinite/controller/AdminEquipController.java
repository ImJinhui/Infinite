package com.ideaall.infinite.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminEquipController {
	private final static String MAPPING = "/admin/";


    
	// Receive Parameters from Html Using @RequestParam Map with @PathVariable
	@RequestMapping(value = MAPPING+"{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(@RequestParam MultiValueMap<Object, Object> paramMultiMap, @RequestParam Map<String, Object> paramMap, 
			@PathVariable String action, ModelAndView modelandView) {

		String viewName = MAPPING + action ;
		String forwardView = (String) paramMap.get("forwardView") ;

		Map<String, Object> resultMap = new HashMap<String, Object>() ;
		List<Object> resultList = new ArrayList<Object>();

		// divided depending on action value
		if ("equip_list".equalsIgnoreCase(action)) {
			
		} else if ("equip_edit".equalsIgnoreCase(action)) {
			
		} else if ("equip_read".equalsIgnoreCase(action)) {
			
		} else if ("member_list".equalsIgnoreCase(action)) {
			
		} else if ("member_edit".equalsIgnoreCase(action)) {
			
		} else if ("member_read".equalsIgnoreCase(action)) {
			
		} else if ("result_manage".equalsIgnoreCase(action)) {
			
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
