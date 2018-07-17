package com.ideaall.infinite.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ideaall.infinite.service.AdminMemberService;
import com.ideaall.infinite.service.CommonService;
import com.ideaall.infinite.utill.PageMaker;
import com.ideaall.infinite.utill.Paging;
import com.ideaall.infinite.write.WriteInfo;
import com.ideaall.infinite.write.WriteService;

@Controller
public class WSmemberController {

	@Autowired
	CommonService commonservice;

	@Autowired
	AdminMemberService memberservice;
	
	@Autowired
	WriteService writeService;

	@RequestMapping(value = "/ws/{action}", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json")
	public Object actionMethod(@RequestParam Map<String, Object> paramMap, @PathVariable String action) {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Object> resultList = new ArrayList<Object>();

		if ("subadd".equalsIgnoreCase(action)) {
			String sqlMapId = "member.subaddlist";
			resultMap = (Map<String, Object>) commonservice.getSubADDList(paramMap);

		}

		return resultMap;
	}

	@RequestMapping(value = "/subadd", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json")
	public @ResponseBody Map<String, Object> ajaxCall(@RequestParam Map<String, Object> paramMap) {

		List<Map> resultList = new ArrayList<>();
		Map<String, Object> resultMap = new HashMap<>();
		System.out.println(paramMap.get("ADDR_SEQ"));

		resultList = (List<Map>) commonservice.getSubADDList(paramMap);
		System.out.println(resultList.toString());
		System.out.println("-----");

		resultMap.put("addrList", resultList);
		return resultMap;
	}

	@RequestMapping(value = "/idcheck", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json")
	public @ResponseBody Map<String, Object> idcheck(@RequestParam Map<String, Object> paramMap) {

		List<Map> resultList = new ArrayList<>();
		Map<String, Object> resultMap = new HashMap<>();

		resultMap = (Map<String, Object>) memberservice.idcheck(paramMap);

		return resultMap;
	}

	/*@RequestMapping(value = "/list", method = RequestMethod.GET) 
	public String list(Model model, HttpServletRequest req) throws Exception {

		int currentPageNo = 1;
		int maxPost=10;
		
		if(req.getParameter("pages")!=null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo()-1)*paging.getMaxPost();
		
		List<WriteInfo> page = new ArrayList<WriteInfo>();
		page = (ArrayList<WriteInfo>) writeService.writeList(offset, paging.getMaxPost());
		paging.setNumberOfRecords(writeService.writeGetCount());
		
		paging.makePaging();
		
		model.addAttribute("page", page);
		model.addAttribute("paging", paging);
		
		return "/admin/member_list";
		

	}*/

	
	

	

}
