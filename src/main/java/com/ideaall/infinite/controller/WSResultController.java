package com.ideaall.infinite.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ideaall.infinite.service.AdminResultService;


@RestController
public class WSResultController {

	@Autowired
	private AdminResultService service;
	

	@RequestMapping(value = "/wsResult/{action}", method = { RequestMethod.GET, RequestMethod.POST }, produces = "application/json")
	public  Object actionMethod(@RequestParam Map<String, Object> paramMap, @PathVariable String action) {
		
		
		List<Object> resultList = new ArrayList<Object>();
		
		if ("reserveListByDate".equalsIgnoreCase(action)) {
			resultList = (List<Object>) service.getListByDate(paramMap);
		} 
		return resultList;
	}
	
	
	
}
