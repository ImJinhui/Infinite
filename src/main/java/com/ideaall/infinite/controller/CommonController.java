package com.ideaall.infinite.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	private final static String MAPPING = "/common";

	@Autowired
	CommonService commonservice;

	// Receive Parameters from Html Using @RequestParam Map with @PathVariable
	@RequestMapping(value = MAPPING, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(@RequestParam MultiValueMap<Object, Object> paramMultiMap,
			@RequestParam Map<String, Object> paramMap, ModelAndView modelandView) {

		String action = (String) paramMap.get("action");
		String viewName = MAPPING +"/"+ action;
		System.out.println(viewName);
		String forwardView = (String) paramMap.get("forwardView");

		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Object> resultList = new ArrayList<Object>();

		// divided depending on action value
		if ("login".equalsIgnoreCase(action)) {
			
		} else if ("signup".equalsIgnoreCase(action)) {
 			resultList = (List<Object>) commonservice.getADDList(paramMap);

		} else if ("mypage".equalsIgnoreCase(action)) {
			resultMap.put("id", (String) paramMap.get("id"));
			resultMap = (Map<String, Object>) commonservice.getInfo(paramMap);

		} else if ("loginfail".equalsIgnoreCase(action)) {
			viewName = "/common/loginfail";
		}

		if (forwardView != null) {
			viewName = forwardView;
		}

		modelandView.setViewName(viewName);

		modelandView.addObject("paramMap", paramMap);
		modelandView.addObject("resultMap", resultMap);
		modelandView.addObject("resultList", resultList);
		return modelandView;
	}
}

/**
 * AJAX 동적 select box Controller
 *//*
	 * 
	 * @RequestMapping("/testSelect.do") public void selectAjax(HttpServletRequest
	 * req, HttpServletResponse res, String param) { try { // 도 정보 받음 String
	 * province = param;
	 * 
	 * // 알맞은 동적 select box info 생성 List<String> cityList = new ArrayList();
	 * 
	 * if (province.equals("gyeonGi")) { cityList.add("안양"); cityList.add("의정부"); }
	 * else if (province.equals("gangWon")) { cityList.add("원주");
	 * cityList.add("우리집"); }
	 * 
	 * // jsonArray에 추가 JSONArray jsonArray = new JSONArray(); for (int i = 0; i <
	 * cityList.size(); i++) { jsonArray.add(cityList.get(i)); }
	 * 
	 * // jsonArray 넘김 PrintWriter pw = res.getWriter();
	 * pw.print(jsonArray.toString()); pw.flush(); pw.close();
	 * 
	 * } catch (Exception e) { System.out.println("Controller error"); } } [출처]
	 * [JAVA] Dynamic 동적 select box 구현|작성자 코변
	 * 
	 * 
	 * }
	 */