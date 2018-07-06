package com.ideaall.infinite.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class ShareDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Object getList(String sqlMapId, Object dataMap) {
		Object result = sqlSession.selectList(sqlMapId, dataMap);

		return result;
	}

	public Object getObject(String sqlMapId, Object dataMap) {
		Object result = sqlSession.selectOne(sqlMapId, dataMap);
		
		return result;
	}

	public Object saveObject(String sqlMapId, Object dataMap) {
		Integer result = sqlSession.insert((String)sqlMapId, dataMap);
		
		return result;
	}

	public Object deleteObject(String sqlMapId, Object dataMap) {
		
		Integer result = sqlSession.delete(sqlMapId,dataMap);
		return result;
	}

}
