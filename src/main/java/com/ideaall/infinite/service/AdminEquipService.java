package com.ideaall.infinite.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideaall.infinite.dao.ShareDao;

@Service
public class AdminEquipService {
	
	@Autowired
	private ShareDao dao;
	
	public Object getList(Object dataMap) {
		Map<String, Object> resultObject = new HashMap<String, Object>();
		
		String sqlMapId = "equip.list";
		Object resultEquipList = dao.getList(sqlMapId, dataMap);
		resultObject.put("resultEquipList", resultEquipList);
		
		sqlMapId = "equip.cateList";
		Object resultCateList = dao.getList(sqlMapId, dataMap);
		resultObject.put("resultCateList", resultCateList);
		
		sqlMapId = "equip.subCateList";
		Object resultSubCateList = dao.getList(sqlMapId, dataMap);
		resultObject.put("resultSubCateList", resultSubCateList);
		
		
		return resultObject;
	}
	
	public Object getListByCategory(Object dataMap) {
		Map<String, Object> resultObject = new HashMap<String, Object>();
		
		String sqlMapId = "equip.listByCate";
		Object resultEquipListByCate = dao.getList(sqlMapId, dataMap);
		resultObject.put("resultEquipListByCate", resultEquipListByCate);
		
		sqlMapId = "equip.cateList";
		Object resultCateList = dao.getList(sqlMapId, dataMap);
		resultObject.put("resultCateList", resultCateList);
		
		sqlMapId = "equip.subCateList";
		Object resultSubCateList = dao.getList(sqlMapId, dataMap);
		resultObject.put("resultSubCateList", resultSubCateList);
		
		return resultObject;
	}
	
	public Object getSubCateList(Object dataMap) {
		String sqlMapId = "equip.subCateList";
		
		Object resultObject = dao.getList(sqlMapId, dataMap);
		
		return resultObject;
	}
	
	public Object getObject(Object dataMap) {
//		String sqlMapId = "member.read";
//
//		Object resultObject = dao.getObject(sqlMapId, dataMap);
//		
//		return resultObject;
		return 0;
	}
	
	public Object saveObject(Object dataMap) {
		
		String sqlMapId = "equip.merge";
		Integer result = (Integer) dao.saveObject(sqlMapId, dataMap);

		sqlMapId = "equip.list";
		Object resultObject = dao.getList(sqlMapId, dataMap);
	     
		return resultObject;
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
		return 0;
	}
}
