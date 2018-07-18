package com.ideaall.infinite.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideaall.infinite.dao.ShareDao;

@Service
public class AdminCategoryService {
	
	@Autowired
	private ShareDao dao;
	
	public Object getList(Object dataMap) {
		String sqlMapId = "category.list";

		Object resultObject = dao.getList(sqlMapId, dataMap);
		
		return resultObject;
	}
	
	public Object getObject(Object dataMap) {
		String sqlMapId = "category.read";

		Object resultObject = dao.getObject(sqlMapId, dataMap);
		
		return resultObject;
	}
	
	public Object saveObject(Object dataMap) {
		String sqlMapId= "category.mergeCate";
		Integer result = (Integer) dao.saveObject(sqlMapId, dataMap);
		
		sqlMapId= "category.mergeSubCate";
		result = (Integer) dao.saveObject(sqlMapId, dataMap);
		
		return result;
	}
	public Object deleteObject(Object dataMap) {
//		// delete child record authority
//		String sqlMapId = "authorityRmember.delete";
//
//		Integer resultKey = (Integer) dao.deleteObject(sqlMapId, dataMap);
//
//		// delete Mother record authority
//		sqlMapId = "member.delete";
//
//		resultKey = (Integer) dao.deleteObject(sqlMapId, dataMap);
//
//		// get Member List
//		sqlMapId = "member.list";
//		
//		Object resultObject = dao.getList(sqlMapId, dataMap);
//		
//		return resultObject;
		String sqlMapId = "category.delete";
		Integer resultKey = (Integer) dao.deleteObject(sqlMapId, dataMap);
		return resultKey;
	}
}
