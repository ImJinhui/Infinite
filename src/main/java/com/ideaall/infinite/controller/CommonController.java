package com.ideaall.infinite.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ideaall.infinite.service.CommonService;

@Controller
public class CommonController {
	private final static String MAPPING = "/common/";

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
		if ("login".equalsIgnoreCase(action)) {
			
		} else if ("signup".equalsIgnoreCase(action)) {
			
		} else if ("mypage".equalsIgnoreCase(action)) {
			
		} else if("check".equalsIgnoreCase(action)) {
			resultMap = (Map) commonservice.membercheck(paramMap);
			
			if(resultMap!=null) {//검색된 아이디가 있으면,
				
				String dbPass = (String)resultMap.get("PASSWORD");
				String jspPass = (String) paramMap.get("password");
				if(dbPass.equals(jspPass)) {//비밀번호가 일치하면, 로그인성공
					viewName = "/main/index";
					resultMap.put("id",(String)resultMap.get("id"));
					
				}else {//비밀번호가 실패하면, 로그인 실패
					viewName = "/common/loginfail";
				}
				
			}else {//검색된 아이디가 없으면
				viewName = "/common/loginfail";
			}
		
			
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
