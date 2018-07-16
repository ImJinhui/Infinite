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

import com.ideaall.infinite.service.AdminMemberService;
import com.ideaall.infinite.service.CommonService;

@Controller
public class AdminMemberController {
	private final static String MAPPING = "/admin/member/";

	@Autowired
	AdminMemberService memberservice;
    
	@Autowired
	CommonService commonservice;
	
	// Receive Parameters from Html Using @RequestParam Map with @PathVariable
	@RequestMapping(value = MAPPING+"{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(@RequestParam MultiValueMap<Object, Object> paramMultiMap, @RequestParam Map<String, Object> paramMap, 
			@PathVariable String action, ModelAndView modelandView) {

		String viewName = MAPPING + action ;
		String forwardView = (String) paramMap.get("forwardView") ;

		Map<String, Object> resultMap = new HashMap<String, Object>() ;
		List<Object> resultList = new ArrayList<Object>();

		// divided depending on action value
		if ("member_list".equalsIgnoreCase(action)) {
			resultList = (List<Object>) memberservice.getList(paramMap);
		} else if ("member_edit".equalsIgnoreCase(action)) {
			
		} else if ("member_read".equalsIgnoreCase(action)) {
			resultMap = (Map<String, Object>) memberservice.getObject1(paramMap);
			resultList =  (List<Object>) memberservice.getObject2(paramMap);
			
			
		} else if("insert".equalsIgnoreCase(action)) {
			
			resultMap = (Map<String, Object>) memberservice.insert(paramMap);
			resultMap = (Map<String, Object>) commonservice.getInfo(paramMap);
			viewName="/common/mypage";
		
		} else if("update".equalsIgnoreCase(action)){
			 resultMap = (Map<String, Object>)memberservice.update(paramMap);
			viewName="/main/index";
			
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
