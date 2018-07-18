package com.ideaall.infinite.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ideaall.infinite.service.UserService;

@RestController
public class WSreservationController {

	@Autowired
	private UserService service;
	
	@RequestMapping(value = "/wss/{action}", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json")
	public Object actionMethod(@RequestParam Map<String, Object> paramMap, @PathVariable String action) {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Object> resultList = new ArrayList<Object>();
		
		
		if ("equip_List".equalsIgnoreCase(action)) {

			resultList = (List<Object>) service.getEquipList(paramMap);
			return resultList;
		} 
		else if ("reserve_time".equalsIgnoreCase(action)) {

			resultList = (List<Object>) service.getReserveList(paramMap);

			return resultList;
		} 
		
		return resultList;
	}
	
//	@RequestMapping(value = "/subadd", method = { RequestMethod.GET, RequestMethod.POST }, produces = "application/json")	
//	public @ResponseBody Map<String, Object> ajaxCall(@RequestParam Map<String, Object> paramMap){
//		
//		List<Map> resultList = new ArrayList<>();
//		Map<String, Object> resultMap = new HashMap<>();
//		System.out.println(paramMap.get("ADDR_SEQ"));
//		
//		resultList = (List<Map>) commonservice.getSubADDList(paramMap);
//		System.out.println(resultList.toString());
//		System.out.println("-----");
//		
//		resultMap.put("addrList", resultList);
//		return resultMap;
//	}
//	

	

}
