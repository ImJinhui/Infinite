package com.ideaall.infinite.service;

import java.lang.reflect.Member;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideaall.infinite.dao.ShareDao;
import com.ideaall.infinite.utill.CommonUtil;
import com.ideaall.infinite.utill.Pagination;

@Service
public class AdminMemberService {

	@Autowired
	private ShareDao dao;

	@Autowired
	CommonUtil common;

	public Object getList(Object dataMap) {
		String sqlMapId = "member.list";
		List resultList = (List) dao.getList(sqlMapId, dataMap);

		for (int i = 0; i < resultList.size(); i++) {
			String member_seq = (String) ((Map<Object, Object>) resultList.get(i)).get("MEMBER_SEQ");
			((Map<Object, Object>) dataMap).put("MEMBER_SEQ", member_seq);

			sqlMapId = "member.abilitylist";
			List abilitylist = (List) dao.getList(sqlMapId, dataMap);

			((Map<Object, Object>) resultList.get(i)).put("ABILITY_NAMES", abilitylist);
			/*
			 * for (int j = 0; j < abilitylist.size(); j++) { ((Map<Object, Object>)
			 * resultList.get(i)).put("ABILITY_NAMES",
			 * ((Map<Object,Object>)abilitylist.get(j)).get("ABILITY_NAME")); }
			 */
		}

		/*
		 * Iterator itr = result.iterator(); sqlMapId = "member.abilitylist"; List
		 * result2 = (List) dao.getList(sqlMapId, dataMap); while (itr.hasNext()) {
		 * result2.add(dao.getList(sqlMapId, itr.hasNext())); }
		 */
		// Map resultMap = new HashMap<String, Object>();

		/* resultMap.put("List",result); */
		// result.put("ability_list", result2);

		return resultList;
	}

	public Object idcheck(Object dataMap) {
		String sqlMapId = "member.check";

		Object resultObject = dao.getObject(sqlMapId, dataMap);

		return resultObject;
	}

	public Object insert(Object dataMap) {
		String sqlMapId = "member.insert";

		String uuid = common.getUniqueSequence();
		((Map<Object, Object>) dataMap).put("MEMBER_SEQ", uuid);
		Object resultObject = dao.getObject(sqlMapId, dataMap);

		return resultObject;
	}

	public Object update(Object dataMap) {
		String sqlMapId = "member.update";

		Object resultObject = dao.getObject(sqlMapId, dataMap);

		return resultObject;
	}

	public Object adminupdate(Object dataMap) {
		String sqlMapId = "member.adminupdate";

		Object resultObject = dao.getObject(sqlMapId, dataMap);

		return resultObject;
	}

	public Object getObject1(Object dataMap) {
		String sqlMapId = "member.read1";
		Object resultObject = dao.getObject(sqlMapId, dataMap);

		return resultObject;
	}

	public Object getObject2(Object dataMap) {
		String sqlMapId = "member.read2";
		Object resultObject = dao.getList(sqlMapId, dataMap);

		return resultObject;
	}

	public Object getmemberADDR(Object dataMap) {
		String sqlMapId = "member.getmemberADDR";
		Object resultObject = dao.getObject(sqlMapId, dataMap);

		return resultObject;
	}

	public Object getListPagination(Object dataMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String sqlMapId = "";

		String searchitem = (String) ((Map<String, Object>) dataMap).get("searchitem");
		List<Object> resultList = new ArrayList<Object>();
		if ("name".equals(searchitem)) {
			sqlMapId = "member.find_name";
			resultList = (List<Object>) dao.getList(sqlMapId, dataMap);

		} else if ("id".equals(searchitem)) {
			sqlMapId = "member.find_id";
			resultList = (List<Object>) dao.getList(sqlMapId, dataMap);

		} else if ("tel".equals(searchitem)) {
			sqlMapId = "member.find_tel";
			resultList = (List<Object>) dao.getList(sqlMapId, dataMap);

		} else {

			sqlMapId = "member.totalcount";
			int totalCount = (int) dao.getObject(sqlMapId, dataMap);
			int currentPage;

			if ((((Map<String, Object>) dataMap).get("curPage")) == null) {
				currentPage = 1;
			} else {
				currentPage = Integer.valueOf((String) ((Map<String, Object>) dataMap).get("curPage"));
			}

			Pagination pagination = new Pagination(totalCount, currentPage);

			resultMap.put("pagination", pagination);
			((Map<String, Object>) dataMap).put("pagination", pagination);

			sqlMapId = "member.listpagination";
			resultList = (List<Object>) dao.getList(sqlMapId, dataMap);

			for (int i = 0; i < resultList.size(); i++) {
				String member_seq = (String) ((Map<Object, Object>) resultList.get(i)).get("MEMBER_SEQ");
				((Map<Object, Object>) dataMap).put("MEMBER_SEQ", member_seq);

				sqlMapId = "member.abilitylist";
				List abilitylist = (List) dao.getList(sqlMapId, dataMap);

				((Map<Object, Object>) resultList.get(i)).put("ABILITY_NAMES", abilitylist);
			}

		}

		resultMap.put("resultList", resultList);
		return resultMap;
	}

	public Object getAbilityList(Object dataMap) {
		String sqlMapId = "member.ability_list";

		List resultList = (List) dao.getList(sqlMapId, dataMap);
		/*
		 * Map map1 = new HashMap(); map1.put("MEMBER_SEQ", ((Map<String, Object>)
		 * dataMap).get("MEMBER_SEQ")); resultList.add(map1);
		 */
		return resultList;
	}

	// 능력추가
	public void insertAbility(Object dataMap) {

		String sqlMapId = "member.ability_insert";
		dao.saveObject(sqlMapId, dataMap);
	}

	/*
	 * // 회원 검색 public Object searchResult(Map<String, Object> paramMap) {
	 * 
	 * String searchitem = (String) paramMap.get("searchitem"); Object resultObject
	 * = "";
	 * 
	 * if (searchitem.equals("name")) { String sqlMapId = "member.find_name";
	 * resultObject = dao.getList(sqlMapId, paramMap);
	 * 
	 * } else if (searchitem.equals("id")) { String sqlMapId = "member.find_id";
	 * resultObject = dao.getList(sqlMapId, paramMap);
	 * 
	 * } else if (searchitem.equals("tel")) { String sqlMapId = "member.find_tel";
	 * resultObject = dao.getList(sqlMapId, paramMap);
	 * 
	 * }
	 * 
	 * return resultObject; }
	 */

	public void memberdelete(Object dataMap) {
		String sqlMapId = "member.delete";
		dao.deleteObject(sqlMapId, dataMap);

	}

	public Object abilitycheck(Map<String, Object> paramMap) {

		String sqlMapId = "member.hasAbility";
		Object resultObject = dao.getList(sqlMapId, paramMap);
		return resultObject;
	}

}
