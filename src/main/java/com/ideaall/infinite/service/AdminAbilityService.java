package com.ideaall.infinite.service;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideaall.infinite.dao.ShareDao;

@Service
public class AdminAbilityService {
	
	@Autowired
	private ShareDao dao;
	
	public Object getList(Object dataMap) {
		String sqlMapId = "ability.list";

		Object resultObject = dao.getList(sqlMapId, dataMap);

		return resultObject;

	}
	
	public Object getObject(Object dataMap) {
		String sqlMapId = "ability.read";

		Object resultObject = dao.getObject(sqlMapId, dataMap);
		
		return resultObject;
	}
	
	public Object saveObject(/*Map<Object, Object>*/Object dataMap) {
		/*String uniqueSequence = (String) dataMap.get("MEMBER_SEQ");
		
		if("".equals(uniqueSequence)){
			uniqueSequence = commonUtil.getUniqueSequence();
		}
		dataMap.put("MEMBER_SEQ", uniqueSequence);
		dataMap.put("REGISTER_SEQ", "UUID-1111-1111111");
		dataMap.put("MODIFIER_SEQ", "UUID-1111-1111111");

		
		String sqlMapId = "member.merge";
	     Object resultKey = dao.saveObject(sqlMapId, dataMap);
		
	     sqlMapId="oracle_authorityRmember.insert";
	      resultKey = dao.saveObject(sqlMapId, dataMap);
	      
	      sqlMapId="attachfile.insert";
	      resultKey = dao.saveObject(sqlMapId, dataMap);
		
	      sqlMapId = "member.read";
	      Object resultObject = dao.getObject(sqlMapId, dataMap);

		return resultObject;*/
		String sqlMapId= "ability.merge";
		Integer result = (Integer) dao.saveObject(sqlMapId, dataMap);
		
		return result;
	}
	
	public Object updateObject(Object dataMap) {
		String sqlMapId = "ability.update";
		Integer result = (Integer) dao.saveObject(sqlMapId, dataMap);
		
		sqlMapId = "ability.list";
		Object resultObject = dao.getList(sqlMapId, dataMap);
		
		return resultObject;
	}
	
	public Object deleteObject(Object dataMap) {
		String sqlMapId = "ability.delete";
		Integer result = (Integer) dao.saveObject(sqlMapId, dataMap);
		
		sqlMapId = "ability.list";
		Object resultObject = dao.getList(sqlMapId, dataMap);
		return 0;
	}
}
