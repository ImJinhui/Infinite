package com.ideaall.infinite.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ideaall.infinite.service.AdminMemberService;
import com.ideaall.infinite.service.CommonService;

@Controller
public class AdminMemberController {
	private final static String MAPPING = "/admin/member/";

	@Autowired
	AdminMemberService memberservice;

	@Autowired
	CommonService commonservice;

	// Receive Parameters from Html Using @RequestParam Map with @PathVariable
	@RequestMapping(value = MAPPING + "{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(@RequestParam MultiValueMap<Object, Object> paramMultiMap,
			@RequestParam Map<String, Object> paramMap, @PathVariable String action, ModelAndView modelandView) {

		String viewName = MAPPING + action;
		String forwardView = (String) paramMap.get("forwardView");

		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> resultMap2 = new HashMap<String, Object>();
		List<Object> resultList = new ArrayList<Object>();
		List<Object> resultList2 = new ArrayList<Object>();

		// divided depending on action value
		if ("member_list".equalsIgnoreCase(action)) {
			// resultList = (List<Object>) memberservice.getList(paramMap);
			resultMap = (Map) memberservice.getListPagination(paramMap);
		}

		else if ("member_ability".equalsIgnoreCase(action)) {
			resultList = (List<Object>) memberservice.getAbilityList(paramMap);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Calendar c1 = Calendar.getInstance();
			String obtain_date = sdf.format(c1.getTime());
			resultMap.put("OBTAIN_DATE", obtain_date);

		} else if ("ability_insert".equalsIgnoreCase(action)) {
			memberservice.insertAbility(paramMap); //능력추가 수행
			
			viewName = "/admin/member/member_read"; //다시 리스트화면 띄우기
			resultList = (List<Object>) commonservice.getADDList(paramMap);//상위주소+하위주소
			resultMap2 = (Map<String, Object>) memberservice.getmemberADDR(paramMap);//default 회원주소값
			
			resultMap = (Map<String, Object>) memberservice.getObject1(paramMap); //회원정보(이름~전화번호)
			resultList2 = (List<Object>) memberservice.getObject2(paramMap);//회원정보(능력)

		} else if ("member_edit".equalsIgnoreCase(action)) {

		} else if ("member_read".equalsIgnoreCase(action)) {
			resultList = (List<Object>) commonservice.getADDList(paramMap);//상위주소+하위주소
			resultMap2 = (Map<String, Object>) memberservice.getmemberADDR(paramMap);//default 회원주소값
			
			resultMap = (Map<String, Object>) memberservice.getObject1(paramMap); //회원정보(이름~전화번호)
			resultList2 = (List<Object>) memberservice.getObject2(paramMap);//회원정보(능력)
			

		} else if ("insert".equalsIgnoreCase(action)) {

			resultMap = (Map<String, Object>) memberservice.insert(paramMap);
			resultMap = (Map<String, Object>) commonservice.getInfo(paramMap);
			viewName = "/common/mypage";

		} else if ("update".equalsIgnoreCase(action)) {
			resultMap = (Map<String, Object>) memberservice.update(paramMap);
			viewName = "/main/index";

		} else if ("member_delete".equalsIgnoreCase(action)) {

			memberservice.memberdelete(paramMap);
			resultMap = (Map) memberservice.getListPagination(paramMap);
			viewName = "/admin/member/member_list";
			
		}else if ("member_admin_update".equalsIgnoreCase(action)) {

			memberservice.adminupdate(paramMap);
			resultMap = (Map) memberservice.getListPagination(paramMap);
			viewName = "/admin/member/member_list";
			
		}else if("member_search".equalsIgnoreCase(action)) {
			resultList = (List<Object>) memberservice.searchResult(paramMap);
			
			viewName="/admin/member/member_list";
			resultMap = (Map) memberservice.getListPagination(paramMap);
			
		}

		if (forwardView != null) {
			viewName = forwardView;
		}

		modelandView.setViewName(viewName);

		modelandView.addObject("paramMap", paramMap);
		modelandView.addObject("resultMap", resultMap);
		modelandView.addObject("resultMap2", resultMap);
		modelandView.addObject("resultList", resultList);
		modelandView.addObject("resultList2", resultList2);
		return modelandView;
	}

}
