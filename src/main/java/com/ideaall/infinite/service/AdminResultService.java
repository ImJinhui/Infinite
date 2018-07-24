package com.ideaall.infinite.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideaall.infinite.dao.ShareDao;
import com.ideaall.infinite.utill.Pagination;

@Service
public class AdminResultService {
	
	@Autowired
	private ShareDao dao;
	
	public Object getList(Object dataMap) {
		String sqlMapId = "result.list";

		Object resultObject = dao.getList(sqlMapId, dataMap);
		
		return resultObject;
	}
	
	public Object getObject(Object dataMap) {
		String sqlMapId = "result.read";

		Object resultObject = dao.getObject(sqlMapId, dataMap);
		
		return resultObject;
	}
	
	public Object getListPagination(Object dataMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String sqlMapId = "result.totalcount";
		int totalCount = (int) dao.getObject(sqlMapId, dataMap);
		int currentPage = 1;
		if (((Map<String, Object>) dataMap).get("curPage") != null) {
			currentPage = Integer.valueOf(((Map<String, String>) dataMap).get("curPage"));
		}
		Pagination pagination = new Pagination(totalCount, currentPage);
		resultMap.put("pagination", pagination);
		sqlMapId = "result.listpagination";
		((Map<String, Object>) dataMap).put("pagination", pagination);
		Object resultList = dao.getList(sqlMapId, dataMap);
		resultMap.put("resultList", resultList);
		return resultMap;
	}

	
	public Object saveObject(Object dataMap) {
		Map<String, Object> paramMap = (Map<String, Object>) dataMap;

		String sqlMapId = "result.merge";
		Integer result = (Integer) dao.saveObject(sqlMapId, dataMap);
		
		if ("".equals(paramMap.get ("FILE_SEQ"))) {
			sqlMapId = "file.resultInsert";
			result = (Integer) dao.saveObject(sqlMapId, paramMap);
 		} else if(((List)paramMap.get("attachFileList")).isEmpty()){
			
		} else {
 			sqlMapId = "file.resultUpdate";
			result = (Integer) dao.saveObject(sqlMapId, paramMap);
		}
		Object resultObject = (Object) this.getObject(paramMap);
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
