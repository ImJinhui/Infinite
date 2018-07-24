package com.ideaall.infinite.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.ideaall.infinite.dao.ShareDao;
import com.ideaall.infinite.security.MemberInfo;

@Service
public class UserService {
	@Autowired
	ShareDao dao;
	
	public Object getList(Object dataMap) {
		String sqlMapId = "reservation_cate.list";
//
		List<Object> abilitiesList = new ArrayList<>();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MemberInfo username = (MemberInfo)authentication.getPrincipal();	// 세션에 있는 정보를 가져와서 memberinfo형 객체로 저장함
		((Map)dataMap).put("MEMBER_SEQ",username.getMemberSeq()); //member_seq정보를 가져와 mybatis에 넘길 맵에 저장함
		sqlMapId = "reservation_cate.abilitylist";
//		Object resultObject = dao.getList(sqlMapId, dataMap);
		abilitiesList = (List<Object>) dao.getList(sqlMapId, dataMap);
//		System.out.println(((Map)(abilitiesList.get(1))).get("ABILITY_SEQ"));
		int a = abilitiesList.size();
//		System.out.println(a);
		for(int i = 0; i < a; i++) {
			Map<String, Object> reservationSettingMap = new  HashMap<>();
			reservationSettingMap.put("ABILITY_SEQ", ((Map)(abilitiesList.get(i))).get("ABILITY_SEQ"));
			abilitiesList.add(reservationSettingMap);
		}
		((Map)(dataMap)).put("abilitiesList", abilitiesList);
		sqlMapId = "reservation_cate.subcatelist";
		abilitiesList = (List<Object>) dao.getList(sqlMapId, dataMap);
		a=abilitiesList.size();
		for(int i = 0; i < a; i++) {
			Map<String, Object> reservationSettingMap = new  HashMap<>();
			reservationSettingMap.put("ABILITY_SEQ", ((Map)(abilitiesList.get(i))).get("ABILITY_SEQ"));
			abilitiesList.add(reservationSettingMap);
		}
		((Map)(dataMap)).put("abilitiesList", abilitiesList);
		sqlMapId = "reservation_cate.equipplacelist";
		Object resultObject = (List<Object>) dao.getList(sqlMapId, dataMap);
//		resultObject = dao.getList(sqlMapId, dataMap);
		
		return resultObject;
	}
	public Object getEquipList(Object dataMap) {
		String sqlMapId = "reservation_cate.equiplist";

		Object resultObject = dao.getList(sqlMapId, dataMap);
		
		return resultObject;
	}
	public Object getReserveList(Object dataMap) {
		String sqlMapId = "reservation_cate.reservelist";

		Object resultObject = dao.getList(sqlMapId, dataMap);
		
		return resultObject;
	}
	public Object insertReserveList(Object dataMap) {
		String sqlMapId = "reservation_cate.insertreserve";
		
		List<Object> reservationSettingList = new ArrayList<>();
        
        for(int i = 0; i < ((String[])((Map)dataMap).get("EQUIP_SEQ")).length; i++){
        	if(((String[])((Map)dataMap).get("RESERVE_DATE"))[i].equals("1900-1-1"))
        		continue;
           Map<String, Object> reservationSettingMap = new  HashMap<>();
           reservationSettingMap.put("EQUIP_SEQ", ((String[])((Map)dataMap).get("EQUIP_SEQ"))[i]);
           reservationSettingMap.put("RESERVE_DATE",((String[])((Map)dataMap).get("RESERVE_DATE"))[i]);
           reservationSettingMap.put("RESERVE_S_TIME",((String[])((Map)dataMap).get("RESERVE_S_TIME"))[i]);
           reservationSettingMap.put("RESERVE_E_TIME",((String[])((Map)dataMap).get("RESERVE_E_TIME"))[i]);
           reservationSettingMap.put("ID",((String[])((Map)dataMap).get("ID"))[i]);
           reservationSettingList.add(reservationSettingMap);
        }
        ((Map)(dataMap)).put("reservationList", reservationSettingList);

		
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
	
	public Object saveObject(Map<Object, Object> dataMap) {
//		String uniqueSequence = (String) dataMap.get("MEMBER_SEQ");
//		
//		if("".equals(uniqueSequence)){
//			uniqueSequence = commonUtil.getUniqueSequence();
//		}
//		dataMap.put("MEMBER_SEQ", uniqueSequence);
//		dataMap.put("REGISTER_SEQ", "UUID-1111-1111111");
//		dataMap.put("MODIFIER_SEQ", "UUID-1111-1111111");
//
//		
//		String sqlMapId = "member.merge";
//	     Object resultKey = dao.saveObject(sqlMapId, dataMap);
//		
//	     sqlMapId="oracle_authorityRmember.insert";
//	      resultKey = dao.saveObject(sqlMapId, dataMap);
//	      
//	      sqlMapId="attachfile.insert";
//	      resultKey = dao.saveObject(sqlMapId, dataMap);
//		
//	      sqlMapId = "member.read";
//	      Object resultObject = dao.getObject(sqlMapId, dataMap);
//
//		return resultObject;
		return 0;
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
