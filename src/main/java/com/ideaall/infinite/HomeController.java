package com.ideaall.infinite;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ideaall.infinite.component.MapParamCollector;
import com.ideaall.infinite.security.MemberInfo;
import com.ideaall.infinite.service.AdminHomeService;

@Controller
public class HomeController {

	@Autowired
	private AdminHomeService service;
	

	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(@RequestParam Map<String, Object> paramMap, ModelAndView modelandView) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		/*System.out.println(auth);*/
		Collection<? extends GrantedAuthority> authority = auth.getAuthorities();
		/*System.out.println(authority);*/
		paramMap.put("AUTHORITY",authority);
		
		String viewName = "/main/index";

		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Object> resultList = new ArrayList<Object>();

		resultList = (List<Object>) service.getList(paramMap);

		modelandView.setViewName(viewName);

		modelandView.addObject("paramMap", paramMap);
		modelandView.addObject("resultMap", resultMap);
		modelandView.addObject("resultList", resultList);

		return modelandView;
	}
}
