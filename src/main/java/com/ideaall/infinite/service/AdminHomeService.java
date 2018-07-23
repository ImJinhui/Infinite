package com.ideaall.infinite.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideaall.infinite.dao.ShareDao;

@Service
public class AdminHomeService {

	@Autowired
	private ShareDao dao;
	
	public Object getList(Object dataMap) {
		
		String sqlMapId = "equip.modeList";
		Object resultObject = dao.getList(sqlMapId, dataMap);
		
		return resultObject;
	}
}
